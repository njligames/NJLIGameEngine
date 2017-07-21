local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Dog = {}
Dog.__index = Dog

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

function Dog:enter()
  BaseClass.enter(self)
end

function Dog:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Dog:exit()
  BaseClass.exit(self)
end

function Dog:onMessage()
  BaseClass.onMessage(self)
end

function Dog:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Dog:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Dog:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Dog:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Dog:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Dog:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Dog:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Dog:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Dog:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Dog:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Dog:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Dog:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Dog:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Dog:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Dog:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Dog:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Dog:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Dog:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Dog:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Dog:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Dog:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Dog:renderHUD()
  BaseClass.renderHUD(self)
end

function Dog:gamePause()
  BaseClass.gamePause(self)
end

function Dog:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Dog:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Dog:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Dog:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Dog:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Dog:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Dog:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Dog:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Dog:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Dog:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Dog:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Dog:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Dog, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Dog:className()
  return "Dog"
end

function Dog:class()
  return self
end

function Dog:superClass()
  return BaseClass
end

function Dog:__gc()
  --Destroy derived class first
  Dog._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Dog:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Dog:_destroy()
  assert(not self.__DogCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Dog:_create(init)
  self.__DogCalledLoad = false
  __ctor(self, init)
end

function Dog:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__DogCalledLoad = true
end

function Dog:unLoad()
  assert(self.__DogCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__DogCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Dog
