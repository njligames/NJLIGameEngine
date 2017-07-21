local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Caught = {}
Caught.__index = Caught

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

function Caught:enter()
  BaseClass.enter(self)
end

function Caught:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Caught:exit()
  BaseClass.exit(self)
end

function Caught:onMessage()
  BaseClass.onMessage(self)
end

function Caught:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Caught:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Caught:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Caught:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Caught:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Caught:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Caught:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Caught:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Caught:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Caught:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Caught:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Caught:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Caught:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Caught:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Caught:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Caught:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Caught:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Caught:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Caught:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Caught:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Caught:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Caught:renderHUD()
  BaseClass.renderHUD(self)
end

function Caught:gamePause()
  BaseClass.gamePause(self)
end

function Caught:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Caught:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Caught:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Caught:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Caught:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Caught:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Caught:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Caught:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Caught:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Caught:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Caught:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Caught:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Caught, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Caught:className()
  return "Caught"
end

function Caught:class()
  return self
end

function Caught:superClass()
  return BaseClass
end

function Caught:__gc()
  --Destroy derived class first
  Caught._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Caught:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Caught:_destroy()
  assert(not self.__CaughtCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Caught:_create(init)
  self.__CaughtCalledLoad = false
  __ctor(self, init)
end

function Caught:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__CaughtCalledLoad = true
end

function Caught:unLoad()
  assert(self.__CaughtCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__CaughtCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Caught
