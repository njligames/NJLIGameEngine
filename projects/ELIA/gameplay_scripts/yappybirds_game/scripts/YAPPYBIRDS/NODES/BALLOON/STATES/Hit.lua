local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Hit = {}
Hit.__index = Hit

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
  --TODO: construct this Entity
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

function Hit:enter()
  BaseClass.enter(self)

  self:getNodeEntity():setFrameAction('thrown', 2)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Hit:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Hit:exit()
  BaseClass.exit(self)
end

function Hit:onMessage()
  BaseClass.onMessage(self)
end

function Hit:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Hit:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Hit:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Hit:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Hit:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Hit:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Hit:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Hit:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Hit:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Hit:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Hit:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Hit:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Hit:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Hit:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Hit:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Hit:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Hit:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Hit:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Hit:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Hit:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Hit:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Hit:renderHUD()
  BaseClass.renderHUD(self)
end

function Hit:gamePause()
  BaseClass.gamePause(self)
end

function Hit:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Hit:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Hit:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Hit:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Hit:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Hit:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Hit:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Hit:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Hit:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Hit:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Hit:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Hit:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Hit, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Hit:className()
  return "Hit"
end

function Hit:class()
  return self
end

function Hit:superClass()
  return BaseClass
end

function Hit:__gc()
  --Destroy derived class first
  Hit._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Hit:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Hit:_destroy()
  assert(not self.__HitCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Hit:_create(init)
  self.__HitCalledLoad = false
  __ctor(self, init)
end

function Hit:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__HitCalledLoad = true
end

function Hit:unLoad()
  assert(self.__HitCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__HitCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Hit
