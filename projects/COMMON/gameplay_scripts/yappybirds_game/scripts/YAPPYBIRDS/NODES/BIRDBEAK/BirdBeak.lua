local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local BirdBeak = {}
BirdBeak.__index = BirdBeak

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

function BirdBeak:enter()
  BaseClass.enter(self)
end

function BirdBeak:update(timeStep)
  BaseClass.update(self, timeStep)
end

function BirdBeak:exit()
  BaseClass.exit(self)
end

function BirdBeak:onMessage()
  BaseClass.onMessage(self)
end

function BirdBeak:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function BirdBeak:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function BirdBeak:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function BirdBeak:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function BirdBeak:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function BirdBeak:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function BirdBeak:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function BirdBeak:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function BirdBeak:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function BirdBeak:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function BirdBeak:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function BirdBeak:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function BirdBeak:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function BirdBeak:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function BirdBeak:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function BirdBeak:near(otherNode)
  BaseClass.near(self, otherNode)
end

function BirdBeak:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function BirdBeak:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function BirdBeak:keyboardShow()
  BaseClass.keyboardShow(self)
end

function BirdBeak:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function BirdBeak:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function BirdBeak:renderHUD()
  BaseClass.renderHUD(self)
end

function BirdBeak:gamePause()
  BaseClass.gamePause(self)
end

function BirdBeak:gameUnPause()
  BaseClass.gameUnPause(self)
end

function BirdBeak:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function BirdBeak:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function BirdBeak:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function BirdBeak:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function BirdBeak:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function BirdBeak:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function BirdBeak:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function BirdBeak:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function BirdBeak:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function BirdBeak:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function BirdBeak:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BirdBeak, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function BirdBeak:className()
  return "BirdBeak"
end

function BirdBeak:class()
  return self
end

function BirdBeak:superClass()
  return BaseClass
end

function BirdBeak:__gc()
  --Destroy derived class first
  BirdBeak._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function BirdBeak:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BirdBeak:_destroy()
  assert(not self.__BirdBeakCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function BirdBeak:_create(init)
  self.__BirdBeakCalledLoad = false
  __ctor(self, init)
end

function BirdBeak:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BirdBeakCalledLoad = true
end

function BirdBeak:unLoad()
  assert(self.__BirdBeakCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BirdBeakCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return BirdBeak
