local BaseClass = require "NJLI.STATEMACHINE.SceneEntity"

local Menu = {}
Menu.__index = Menu

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor()
-- __dtor()
-- __load()
-- __unLoad()
--#############################################################################

local __ctor = function(self, init)
  local spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/interface0.lua")
  self._spriteAtlas = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

  local image = njli.Image.create()
  njli.World.getInstance():getWorldResourceLoader():load("images/generated/interface0.png", image)
  Geometry2D[1]:getMaterial():getDiffuse():loadGPU(image)
  njli.Image.destroy(image)

  self:getScene():addCameraNode(OrthographicCameraNode, true)
  self:getScene():addCameraNode(PerspectiveCameraNode)


  local mm = self:createMainMenuUI()
  for k, v in pairs(mm) do
    v:display(false)
  end
  for k, v in pairs(mm) do
    v:display(true)
  end
  
-- local ls = self:createLevelSelectUI()
-- for k, v in pairs(ls) do
--   v:display(false)
-- end
-- for k, v in pairs(ls) do
--   v:display(true)
-- end

--   self:createAboutUI()
  -- print("self:createAboutUI()")



--    self._label = self:createLabelControl( 0, 0)
--    self._label:text("THE TEXT\nTHE TEXT")
--    self._label:getNode():setOrigin(bullet.btVector3(njli.SCREEN():x() - self._label:bounds().width, 0, -1))
--
--    self._topLeft = self:createLabelControl(0, 0)
--    self._topLeft:text("TOP LEFT")
--    print_r(self._topLeft:bounds())
--    self._topLeft:getNode():setOrigin(bullet.btVector3( 0.0, njli.SCREEN():y() - self._topLeft:bounds().height, -1.0))
--
--    self._topRight = self:createLabelControl(0, 0)
--    self._topRight:text("TOP RIGHT")
--    self._topRight:getNode():setOrigin(bullet.btVector3(njli.SCREEN():x() - self._topRight:bounds().width, njli.SCREEN():y() - self._topRight:bounds().height, -1.0))
--
--    self._bottomLeft = self:createLabelControl(0, 0)
--    self._bottomLeft:text("BOTTOM LEFT")
--    self._bottomLeft:getNode():setOrigin(bullet.btVector3( 0.0, 0.0, -1.0 ))
--
--    self._bottomRight = self:createLabelControl(0, 0)
--    self._bottomRight:text("BOTTOM RIGHT")
--    self._bottomRight:getNode():setOrigin(bullet.btVector3( njli.SCREEN():x() - self._bottomRight:bounds().width, 0.0, -1.0))

end

local __dtor = function(self)
  njli.SpriteFrameAtlas.destroy(self._spriteAtlas)
  self._spriteAtlas = nil
end

local __load = function(self)
  --TODO: load this Entity

end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function Menu:createAboutUI()

  local label = self:createLabelControl( 0, 0, true )
--  label:text(njli.LOCALIZED_TEXT("jim", "taste man-flesh", "jim"))
  label:text("Have a seat, Joe")
--  label:text("Jim.")
  label:getNode():setOrigin(bullet.btVector2(0.0, njli.SCREEN():y() * 0.5))
end

function Menu:createLevelSelectUI()
  local ret = {}
  
  self._imageStack = -0.1

  local ui_background = self:createImageControl("ui_background", 
    (njli.SCREEN():x() * 0.5),
    (njli.SCREEN():y() * 0.5),
    1.0,
    1.0,
    true)
  table.insert(ret, ui_background)

  local dimension = (1.0 / 6.0)

  local function createStageButton(row, column, level, tbl)
    local r = row or 0
    local c = column or 0

    local stage = self:createButtonControl("stage",
      0,
      0,
      dimension,
      dimension,
      true)
    stage:touchUpInsideCallback(
      function(r)
        local stateName = ""
--        self:getSceneEntity():pushState(stateName)
        print("push to LevelSelect " .. level) 
      end
    )
    table.insert(tbl, stage)

    local dim_x = stage:getDimensions():x()
    local dim_y = stage:getDimensions():y()

    local margin_x = njli.SCREEN():x() * (1.0 / 6.0)
    local margin_y = njli.SCREEN():y() * (1.0 / 4.0)

    local x = (dim_x * 0.5) + (dim_x * c)
    local y = (dim_y * 0.5) + (dim_y * r)

    local gutter_x = (dim_x * c) * 0.5
    local gutter_y = (dim_y * r) * 0.3

    stage:setOrigin(bullet.btVector2( margin_x + x + gutter_x, margin_y + y + gutter_y ))
  
    return stage
  end

  createStageButton(0,0, 11, ret)
  createStageButton(0,1, 12, ret)
  createStageButton(0,2, 13, ret)
  createStageButton(0,3, 14, ret)
  createStageButton(0,4, 15, ret)

  createStageButton(1,0, 6, ret)
  createStageButton(1,1, 7, ret)
  createStageButton(1,2, 8, ret)
  createStageButton(1,3, 9, ret)
  createStageButton(1,4, 10, ret)

  createStageButton(2,0, 1, ret)
  createStageButton(2,1, 2, ret)
  createStageButton(2,2, 3, ret)
  createStageButton(2,3, 4, ret)
  createStageButton(2,4, 5, ret)

  local back = self:createButtonControl("BACK",
    0,
    0,
    dimension,
    dimension,
    true)
  table.insert(ret, back)
  
  back:touchUpInsideCallback(
    function(r)
      local stateName = ""
--      self:getSceneEntity():pushState(stateName)
      print("BACK") 
    end
  )

  local x = back:getDimensions():x() * 0.5 + (njli.SCREEN():x() * (1.0 / 60.0))
  local y = back:getDimensions():y() * 0.5 + (njli.SCREEN():y() * (1.0 / 60.0))
  back:setOrigin(bullet.btVector2( x, y ))

  return ret
end

function Menu:createMainMenuUI()
  local ret = {}
  
  self._imageStack = -0.1

  local ui_background = self:createImageControl("ui_background", 
    (njli.SCREEN():x() * 0.5),
    (njli.SCREEN():y() * 0.5),
    1.0,
    1.0,
    true)
  table.insert(ret, ui_background)

  local logo_yb = self:createImageControl("logo_yb", 
    njli.SCREEN():x() * 0.5, 
    (njli.SCREEN():y() * 0.7),
    0.9,
    0.9,
    true)
  table.insert(ret, logo_yb)

  local play_button = self:createButtonControl("PLAY",
    (njli.SCREEN():x() * 0.5),
    (njli.SCREEN():y() * 0.3),
    0.3,
    0.3,
    true)
  table.insert(ret, play_button)
  
  play_button:touchUpInsideCallback(
    function(r)
      local stateName = ""
--      self:getSceneEntity():pushState(stateName)
      print("PLAY") 
    end
  )
  
  
  return ret
end

--function Menu:scaleDimension(dimSprite, screenPercentWidth, screenPercentHeight)
--  assert(screenPercentWidth >= 0.0 and screenPercentWidth <= 1.0)
--  assert(screenPercentHeight >= 0.0 and screenPercentHeight <= 1.0)

--  local wi = dimSprite:x()
--  local hi = dimSprite:y()
--  local ri = wi / hi

--  local ws = njli.SCREEN():x()
--  local hs = njli.SCREEN():y()
--  local rs = ws / hs

--  local resultw = ws
--  local resulth = hi * ws / wi
--  if rs > ri then
--    resultw = wi * hs / hi
--    resulth = hs
--  end

--  return bullet.btVector2( resultw * screenPercentWidth, resulth * screenPercentHeight ) * 2
--end

function Menu:createButtonControl(buttonName, xPos, yPos, screenPercentWidth, screenPercentHeight, visible)
  local n = buttonName or "PLAY"
  local x = xPos or 0
  local y = yPos or 0
  local pw = screenPercentWidth or 1.0
  local ph = screenPercentHeight or 1.0

  local buttonNodeEntity = NJLIButtonControl.class({
      name = n,
      states = NJLIButtonControl.states,
      entityOwner = self,
      atlas = self._spriteAtlas,
      geometry = Geometry2D[1],
      scale = 1.0,
      screenPercentWidth = pw,
      screenPercentHeight = ph,
      disabled = false,
      touchUpOutside = function(touches) end,
      touchUpInside = function(rayContact) end,
      touchDownInside = function(rayContact) end,
      touchDragOutside = function() end,
      touchDragInside = function(rayContact) end,
      touchCancelled = function(rayContact) end,
      soundTouchUpOutside = nil, --path to the sound
      soundTouchUpInside = "sounds/interface_select-whoosh.ogg", --path to the sound
      soundTouchDownInside = nil, --path to the sound
      soundTouchDragOutside = nil, --path to the sound
      soundTouchDragInside = nil, --path to the sound
      soundTouchCancelled = nil, --path to the sound

    })
  self:addNodeEntity(buttonNodeEntity)

  buttonNodeEntity:hide(PerspectiveCameraNode:getCamera())

  if visible then
    buttonNodeEntity:show(OrthographicCameraNode:getCamera())
  else
    buttonNodeEntity:hide(OrthographicCameraNode:getCamera())
    buttonNodeEntity:disabled(true)
  end

  buttonNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

  return buttonNodeEntity
end

function Menu:createSwitchControl(switchName, xPos, yPos, visible)
  local n = switchName or "PLAY"
  local x = xPos or 0
  local y = yPos or 0

  local switchNodeEntity = NJLISwitchControl.class({
      name = n,
      states = NJLISwitchControl.states,
      entityOwner = self,
      atlas = self._spriteAtlas,
      geometry = Geometry2D[1],
      scale = 1.0,
      disabled = false,
      touchUpOutside = function(touches) print(#touches) end,
      touchUpInside = function(rayContact) print(rayContact) end,
      touchDownInside = function(rayContact) print(rayContact) end,
      touchDragOutside = function() print("touchDragOutside") end,
      touchDragInside = function(rayContact) print(rayContact) end,
      touchCancelled = function(rayContact) print(rayContact) end,
      soundTouchUpOutside = nil, --path to the sound
      soundTouchUpInside = "sounds/interface_select-whoosh.ogg", --path to the sound
      soundTouchDownInside = nil, --path to the sound
      soundTouchDragOutside = nil, --path to the sound
      soundTouchDragInside = nil, --path to the sound
      soundTouchCancelled = nil, --path to the sound
    })
  self:addNodeEntity(switchNodeEntity)

  switchNodeEntity:hide(PerspectiveCameraNode:getCamera())

  if visible then
    switchNodeEntity:show(OrthographicCameraNode:getCamera())
  else
    switchNodeEntity:hide(OrthographicCameraNode:getCamera())
    switchNodeEntity:disabled(true)
  end

  switchNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

  return switchNodeEntity
end

function Menu:createImageControl(imageName, xPos, yPos, screenPercentWidth, screenPercentHeight, visible)
  local n = imageName or "PLAY"
  local x = xPos or 0
  local y = yPos or 0
  local pw = screenPercentWidth or 1.0
  local ph = screenPercentHeight or 1.0

  local imageNodeEntity = NJLIImageControl.class({
      name = n,
      states = NJLIImageControl.states,
      entityOwner = self,
      atlas = self._spriteAtlas,
      geometry = Geometry2D[1],
      scale = 1.0,
      screenPercentWidth = pw,
      screenPercentHeight = ph,
    })
  self:addNodeEntity(imageNodeEntity)

  imageNodeEntity:hide(PerspectiveCameraNode:getCamera())

  if visible then
    imageNodeEntity:show(OrthographicCameraNode:getCamera())
  else
    imageNodeEntity:hide(OrthographicCameraNode:getCamera())
  end

  imageNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, self._imageStack))

  self._imageStack = self._imageStack - 0.01

  return imageNodeEntity
end

function Menu:createLabelControl(xPos, yPos, visible)
  local x = xPos or 0
  local y = yPos or 0

  local labelNodeEntity = NJLILabelControl.class({
      states = NJLILabelControl.states,
      entityOwner = self,
    })

  labelNodeEntity:hide(PerspectiveCameraNode:getCamera())

  if visible then
    labelNodeEntity:show(OrthographicCameraNode:getCamera())
  else
    labelNodeEntity:hide(OrthographicCameraNode:getCamera())
  end

  labelNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

  return labelNodeEntity
end


--#############################################################################

function Menu:enter()
  BaseClass.enter(self)

end

function Menu:update(timeStep)
  BaseClass.update(self, timeStep)

end

function Menu:exit()
  BaseClass.exit(self)
end

function Menu:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Menu:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Menu:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Menu:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Menu:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Menu:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Menu:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Menu:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Menu:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Menu:renderHUD()
  BaseClass.renderHUD(self)
end

function Menu:pause()
  BaseClass.pause(self)
end

function Menu:unPause()
  BaseClass.unPause(self)
end

function Menu:willResignActive()
  BaseClass.willResignActive(self)
end

function Menu:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Menu:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Menu:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Menu:willTerminate()
  BaseClass.willTerminate(self)
end

function Menu:interrupt()
  BaseClass.interrupt(self)
end

function Menu:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Menu:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Menu, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Menu:className()
  return "Menu"
end

function Menu:class()
  return self
end

function Menu:superClass()
  return BaseClass
end

function Menu:__gc()
  --Destroy derived class first
  Menu._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Menu:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Menu:_destroy()
  assert(not self.__MenuCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Menu:_create(init)
  self.__MenuCalledLoad = false
  __ctor(self, init)
end

function Menu:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__MenuCalledLoad = true
end

function Menu:unLoad()
  assert(self.__MenuCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__MenuCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Menu
