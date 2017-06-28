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
    Geometry2D:getMaterial():getDiffuse():loadGPU(image)
    njli.Image.destroy(image)

    self:getScene():addCameraNode(OrthographicCameraNode, true)
    self:getScene():addCameraNode(PerspectiveCameraNode)

    self._button = self:createButtonControl("stage", 400, 400, 25)
    --self._switch = self:createSwitchControl("stage", 313, 400, 25)
    self:createImageControl("ui_thanks", 0, 0, 1)
    
    
    

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

function Menu:createButtonControl(buttonName, xPos, yPos, buttonScale)
    local n = buttonName or "PLAY"
    local x = xPos or 0
    local y = yPos or 0
    local s = buttonScale or 25

    local buttonNodeEntity = NJLIButtonControl.class({
        name = n,
        states = NJLIButtonControl.states,
        entityOwner = self,
        atlas = self._spriteAtlas,
        geometry = Geometry2D,
        scale = s,
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
      self:addNodeEntity(buttonNodeEntity)

      buttonNodeEntity:hide(PerspectiveCameraNode:getCamera())
      buttonNodeEntity:show(OrthographicCameraNode:getCamera())

      buttonNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

      return buttonNodeEntity
end

function Menu:createSwitchControl(switchName, xPos, yPos, switchScale)
    local n = switchName or "PLAY"
    local x = xPos or 0
    local y = yPos or 0
    local s = switchScale or 25

    local switchNodeEntity = NJLISwitchControl.class({
        name = n,
        states = NJLISwitchControl.states,
        entityOwner = self,
        atlas = self._spriteAtlas,
        geometry = Geometry2D,
        scale = s,
        disabled = false,
    })
    self:addNodeEntity(switchNodeEntity)

    switchNodeEntity:hide(PerspectiveCameraNode:getCamera())
    switchNodeEntity:show(OrthographicCameraNode:getCamera())

    switchNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

    return switchNodeEntity
end

function Menu:createImageControl(imageName, xPos, yPos, imageScale)
    local n = imageName or "PLAY"
    local x = xPos or 0
    local y = yPos or 0
    local s = imageScale or 25

    local imageNodeEntity = NJLIImageControl.class({
        name = n,
        states = NJLIImageControl.states,
        entityOwner = self,
        atlas = self._spriteAtlas,
        geometry = Geometry2D,
        scale = s,
      })
      self:addNodeEntity(imageNodeEntity)

      imageNodeEntity:hide(PerspectiveCameraNode:getCamera())
      imageNodeEntity:show(OrthographicCameraNode:getCamera())

      imageNodeEntity:getNode():setOrigin(bullet.btVector3(x, y, -1))

      return imageNodeEntity
end

function Menu:createLabelControl(xPos, yPos)
    local x = xPos or 0
    local y = yPos or 0

    local labelNodeEntity = NJLILabelControl.class({
        states = NJLILabelControl.states,
        entityOwner = self,
      })

      labelNodeEntity:hide(PerspectiveCameraNode:getCamera())
      labelNodeEntity:show(OrthographicCameraNode:getCamera())

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
