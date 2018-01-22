local TexturePacker = {}
TexturePacker.__index = TexturePacker

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
  local tbl = init or {}

  local tp = tbl.file or nil

  if tp then
    local assetPath = njli.ASSET_PATH("scripts/generated/texturepacker/" .. tp .. ".lua")
    self._sheetInfo = loadfile(assetPath)()
  end

  local image = njli.Image.create()
  if njli.World.getInstance():getWorldResourceLoader():load("images/generated/" .. tp .. ".png", image) then
    local shader = njli.ShaderProgram.create()
    if njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader) then
      local material = njli.Material.create()
      local geometry = njli.Sprite2D.create()

      geometry:setMaterial(material)
      geometry:setShaderProgram(shader)

      geometry:getMaterial():getDiffuse():loadGPU(image)

      self._sheetData = {image=image, material=material, shader=shader, geometry=geometry}
    else
      njli.ShaderProgram.destroy(shader)
    end
  else
    njli.Image.destroy(image)
  end
end

local __dtor = function(self)
  --TODO: destruct this Entity
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--############################################################################# 

function TexturePacker:draw(name)

  local frameNumber = self._sheetInfo:getFrameIndex(name)
  assert(frameNumber, "no such name in the textrue packer file as " .. name)

  local frame = self._sheetInfo.sheet.frames[frameNumber]
  local x = frame.x or 0
  local y = frame.y or 0
  local width = frame.width or 0
  local height = frame.height or 0
  local pivotx = (frame.pivotx / width) or 0
  local pivoty = (frame.pivoty / height) or 0

  local node = njli.Node.create()
  local geometry = self._sheetData.geometry or nil
  geometry:setName(name)
  assert(geometry, "there must be geometry loaded")

  node:setName(name)
  node:setGeometry(geometry)

  geometry:setSpriteAtlasFrame(node, x, y, width, height)

  geometry:setDimensions(node,
    bullet.btVector2( width, height),
    bullet.btVector2( pivotx, pivoty ))

  return node

end

function TexturePacker:hide(camera)
  self._hiddenCamera=camera

  local geometry = self._sheetData.geometry or nil
  if geometry then
    geometry:hide(camera)
  end
end

function TexturePacker:show(camera)
  self._showCamera=camera

  local geometry = self._sheetData.geometry or nil
  if geometry then
    geometry:show(camera)
  end
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(TexturePacker, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function TexturePacker:className()
  return "TexturePacker"
end

function TexturePacker:class()
  return self
end

function TexturePacker:superClass()
  return nil
end

function TexturePacker:isa(theClass)
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

function TexturePacker:__gc()
  TexturePacker._destroy(self)
end

function TexturePacker:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function TexturePacker:_destroy()
  assert(not self.__TexturePackerCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function TexturePacker:_create(init)
  self.__TexturePackerCalledLoad = false
  
  __ctor(self, init)
end

function TexturePacker:load()
  __load(self)
  
  self.__TexturePackerCalledLoad = true
end

function TexturePacker:unLoad()
  assert(self.__TexturePackerCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__TexturePackerCalledLoad = false
end

return TexturePacker
