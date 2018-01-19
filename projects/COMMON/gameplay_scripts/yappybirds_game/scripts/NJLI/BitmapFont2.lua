local BitmapFont2 = {}
BitmapFont2.__index = BitmapFont2

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
--#############################################################################

local __ctor = function(self, init)

  local fonts = init or {}

  self._fonts = {}
  self._maxLineHeight = 0
  for i=1,#fonts do
    local font = fonts[i]
    local assetPath = njli.ASSET_PATH("fonts/" .. font .. ".lua")
    local data = loadfile(assetPath)()

    -- self._maxLineHeight = math.max(self._maxLineHeight, data.common.lineHeight)
    self._maxLineHeight = math.max(self._maxLineHeight, data.info.lineHeight)

    local image = njli.Image.create()
    if njli.World.getInstance():getWorldResourceLoader():load("fonts/" .. font .. ".png", image) then
      local shader = njli.ShaderProgram.create()
      if njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader) then
        local material = njli.Material.create()
        local geometry = njli.Sprite2D.create()

        geometry:setMaterial(material)
        geometry:setShaderProgram(shader)

        geometry:getMaterial():getDiffuse():loadGPU(image)

        table.insert(self._fonts, {font=font, image=image, data=data, material=material, shader=shader, geometry=geometry})

        local kerningTable = {}

        local kernings = data.kernings or {}
        for kerningIdx=1,#kernings do
          local kerningData = kernings[kerningIdx]
          local firstChar = string.char(kerningData.first)
          local secondChar = string.char(kerningData.second)
          local kerningAmt = kerningData.amount
          local key = firstChar .. secondChar
          kerningTable[key] = kerningAmt
        end

        self._fonts[i].kerningTable = kerningTable

      else
        njli.ShaderProgram.destroy(shader)
      end
    else
      njli.Image.destroy(image)
    end
  end

end

local __dtor = function(self)
  for i=1,#self._fonts do
    local image = self._fonts[i].image
    njli.Image.destroy(image)

    local material = self._fonts[i].material
    njli.Material.destroy(material)

    local shader = self._fonts[i].shader
    njli.ShaderProgram.destroy(shader)

    local geometry = self._fonts[i].geometry
    njli.Sprite2D.destroy(geometry)
  end
  self._fonts = nil
end

local __load = function(self)
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--############################################################################# 

function BitmapFont2:maxLineHeight()
  -- print(self._maxLineHeight)
  return self._maxLineHeight
end

function BitmapFont2:lineHeight(fontIndex)
  local fi = fontIndex or 1
  if fi  <= #self._fonts then
      return self._fonts[fi].data.info.lineHeight
  end
end

function BitmapFont2:_renderLetter(...)

  local arg = ... or {}
  local mainNode = arg.mainNode or nil
  assert(mainNode, "There must me a main node to attach the letter to.")

  local charValue = arg.charValue or "?"
  local fontIndex = arg.fontIndex or 1

  local ascii = string.byte(charValue) or error("This should be impossible", 1)
  local charData = self._fonts[fontIndex].data.frames[ascii - 31]

  local node = nil
  local recycled = false
  if charData then

    local geometry = self._fonts[fontIndex].geometry

    local letterIndex = arg.letterIndex or 1
    if (letterIndex - 1) < mainNode:numberOfChildrenNodes() then
      node = mainNode:getChildNode(letterIndex - 1)
      recycled = true
    else
      node = njli.Node.create()
    end

    local letter = {xPivot=0,yPivot=0}

    node:setName(charValue)
    node:setGeometry(geometry)
    
    geometry:setSpriteAtlasFrame(node,
      charData.x,
      charData.y,
      charData.width,
      charData.height)

    geometry:setDimensions(node,
      bullet.btVector2( charData.width*2, charData.height*2),
      bullet.btVector2( letter.xPivot, letter.yPivot ))

  end

  return charData, node, recycled

end

function BitmapFont2:_renderNewline(...)
  print('render new line')
end

function BitmapFont2:hide(camera)
  self._hiddenCamera=camera

  for i=1,#self._fonts do
    local geometry = self._fonts[i].geometry
    if geometry then
      geometry:hide(camera)
    end
  end
end

function BitmapFont2:show(camera)
  self._showCamera=camera

  for i=1,#self._fonts do
    local geometry = self._fonts[i].geometry
    if geometry then
      geometry:show(camera)
    end
  end
end

function BitmapFont2:updateFont(...)
  local arg = ... or {}

  local node = arg.node
  local fontIndexTable = arg.fontIndexTable 
  local align = arg.align or "left"

  local arg =
  {
    mainNode=node,
    text=node:getName(),
    align=align or "left"
  }

  print_r(arg)
end

function BitmapFont2:printf(...)
	local arg = ... or {}

	local text = arg.text or "???"
	local align = arg.align or "left"

	if arg.align and (arg.align == "left" or arg.align == "center" or arg.align == "right") then
		align = arg.align
	end

  local mainNode = arg.mainNode or njli.Node.create()
  mainNode:setName(text)

  local rect = { 0, 0, 0, 0 }

  local fontIndexTable = {}
  if arg.fontIndexTable then
    for i=1, #arg.fontIndexTable do
      fontIndexTable[i] = arg.fontIndexTable[i] or 1
    end
  else
    for i=1,string.len(text) do
      fontIndexTable[i] = 1
    end
  end
  self._fontIndexTable = fontIndexTable


  local spacesInTab = arg.spacesInTab or 2

  local xStart, yStart = 0, 0
  --TODO: Calculate the starting position based on the justification
  local letterIndex = 1

  local xCurrent, yCurrent = xStart, yStart

  local node = nil
  local charData = nil
  local recycleNode = false


  
  for i=0,mainNode:numberOfChildrenNodes() do 
    local letterIndex=i+1
    local paramTable =
    {
      mainNode = mainNode,
      letterIndex = letterIndex,
      charValue = " ",
      fontIndex = fontIndexTable[letterIndex]
    }
    charData, node, recycleNode = self:_renderLetter(paramTable)
  end

   -- for i=1, i<mainNode:numberOfChildrenNodes() do
   --   local currentIndex = i + 1
   --   print(currentIndex)
   -- end

  -- for i=1, i<=string.len(text) do
  --   -- local paramTable =
  --   -- {
  --   --   mainNode = mainNode,
  --   --   letterIndex = currentIndex,
  --   --   charValue = " ",
  --   --   fontIndex = fontIndexTable[letterIndex]
  --   -- }
  --   -- charData, node, recycleNode = self:_renderLetter(paramTable)
  --   print(i)
  -- end

	for c in string.gmatch( text .. '\n', '(.)' ) do
    local ascii = string.byte(c)

    local paramTable =
    {
      mainNode = mainNode,
      letterIndex = letterIndex,
      charValue = c,
      fontIndex = fontIndexTable[letterIndex]
    }

    if (ascii >= 32 and ascii <= 126) then
      charData, node, recycleNode = self:_renderLetter(paramTable)

      local fontIndex = paramTable.fontIndex or 1
      local lineHeight = self._fonts[fontIndex].data.info.lineHeight
      local base = self._fonts[fontIndex].data.info.base

      local xpos = xCurrent + charData.xoffset
      local ypos = (lineHeight - charData.yoffset) - charData.height - (lineHeight - base) - yCurrent

      xCurrent = xCurrent + charData.xadvance

      if node then
        node:setOrigin(bullet.btVector3(xpos, ypos, 0))
        if not recycleNode then
          mainNode:addChildNode(node)
        end
      end
    else
      -- if LINEFEED
      if ascii == 10 then
        -- xOffset, yOffset, xAdvance = self:_renderNewline(paramTable)
      -- if TAB
      elseif  ascii == 9 then
        paramTable.charValue = " "
        for i=1, spacesInTab do
          charData, node, recycleNode = self:_renderLetter(paramTable)

          local fontIndex = paramTable.fontIndex or 1
          local lineHeight = self._fonts[fontIndex].data.info.lineHeight
          local base = self._fonts[fontIndex].data.info.base

          local xpos = xCurrent + charData.xoffset
          local ypos = (lineHeight - charData.yoffset) - charData.height - (lineHeight - base) - yCurrent

          xCurrent = xCurrent + charData.xadvance

          if node then
            node:setOrigin(bullet.btVector3(xpos, ypos, 0))
            if not recycleNode then
              mainNode:addChildNode(node)
            end
          end
        end
      end
    end

    letterIndex = letterIndex + 1
	end

  -- if self._showCamera then
  --   mainNode:show(self._showCamera)
  -- end
  -- if self._hiddenCamera then
  --   mainNode:hide(self._hiddenCamera)
  -- end

  return mainNode, rect
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BitmapFont2, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function BitmapFont2:className()
  return "BitmapFont2"
end

function BitmapFont2:class()
  return self
end

function BitmapFont2:superClass()
  return nil
end

function BitmapFont2:isa(theClass)
  local b_isa = false
  local cur_class = theClass:class()
  while ( nil ~= cur_class ) and ( false == b_isa ) do
    if cur_class == theClass then
      b_isa = true
    else
      cur_class = cur_class:superClass()
    end
  end

  return b_isa
end

function BitmapFont2:__gc()
  BitmapFont2._destroy(self)
end

function BitmapFont2:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BitmapFont2:_destroy()
  assert(not self.__BitmapFont2CalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function BitmapFont2:_create(init)
  self.__BitmapFont2CalledLoad = false
  
  __ctor(self, init)
end

function BitmapFont2:load()
  __load(self)
  
  self.__BitmapFont2CalledLoad = true
end

function BitmapFont2:unLoad()
  assert(self.__BitmapFont2CalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__BitmapFont2CalledLoad = false
end

return BitmapFont2
