local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Pursue = {}
Pursue.__index = Pursue

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

function Pursue:enter()
  BaseClass.enter(self)

  self:getNodeEntity():setFrameAction('idle', 8)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Pursue:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Pursue:exit()
  BaseClass.exit(self)
end

function Pursue:onMessage()
  BaseClass.onMessage(self)
end

function Pursue:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Pursue:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Pursue:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Pursue:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Pursue:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Pursue:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Pursue:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Pursue:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Pursue:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Pursue:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Pursue:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Pursue:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Pursue:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Pursue:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Pursue:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Pursue:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Pursue:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Pursue:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Pursue:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Pursue:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Pursue:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Pursue:renderHUD()
  BaseClass.renderHUD(self)
end

function Pursue:gamePause()
  BaseClass.gamePause(self)
end

function Pursue:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Pursue:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Pursue:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Pursue:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Pursue:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Pursue:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Pursue:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Pursue:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Pursue:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Pursue:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Pursue:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Pursue:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Pursue, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Pursue:className()
  return "Pursue"
end

function Pursue:class()
  return self
end

function Pursue:superClass()
  return BaseClass
end

function Pursue:__gc()
  --Destroy derived class first
  Pursue._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Pursue:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Pursue:_destroy()
  assert(not self.__PursueCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Pursue:_create(init)
  self.__PursueCalledLoad = false
  __ctor(self, init)
end

function Pursue:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__PursueCalledLoad = true
end

function Pursue:unLoad()
  assert(self.__PursueCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__PursueCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Pursue
