local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Fly = {}
Fly.__index = Fly

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

function Fly:enter()
  BaseClass.enter(self)
end

function Fly:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Fly:exit()
  BaseClass.exit(self)
end

function Fly:onMessage()
  BaseClass.onMessage(self)
end

function Fly:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Fly:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Fly:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Fly:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Fly:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Fly:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Fly:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Fly:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Fly:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Fly:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Fly:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Fly:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Fly:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Fly:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Fly:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Fly:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Fly:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Fly:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Fly:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Fly:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Fly:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Fly:renderHUD()
  BaseClass.renderHUD(self)
end

function Fly:gamePause()
  BaseClass.gamePause(self)
end

function Fly:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Fly:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Fly:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Fly:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Fly:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Fly:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Fly:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Fly:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Fly:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Fly:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Fly:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Fly:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Fly, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Fly:className()
  return "Fly"
end

function Fly:class()
  return self
end

function Fly:superClass()
  return BaseClass
end

function Fly:__gc()
  --Destroy derived class first
  Fly._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Fly:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Fly:_destroy()
  assert(not self.__FlyCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Fly:_create(init)
  self.__FlyCalledLoad = false
  __ctor(self, init)
end

function Fly:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__FlyCalledLoad = true
end

function Fly:unLoad()
  assert(self.__FlyCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__FlyCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Fly
