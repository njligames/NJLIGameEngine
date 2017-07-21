local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Grabbing = {}
Grabbing.__index = Grabbing

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

function Grabbing:enter()
  BaseClass.enter(self)
end

function Grabbing:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Grabbing:exit()
  BaseClass.exit(self)
end

function Grabbing:onMessage()
  BaseClass.onMessage(self)
end

function Grabbing:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Grabbing:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Grabbing:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Grabbing:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Grabbing:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Grabbing:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Grabbing:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Grabbing:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Grabbing:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Grabbing:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Grabbing:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Grabbing:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Grabbing:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Grabbing:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Grabbing:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Grabbing:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Grabbing:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Grabbing:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Grabbing:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Grabbing:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Grabbing:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Grabbing:renderHUD()
  BaseClass.renderHUD(self)
end

function Grabbing:gamePause()
  BaseClass.gamePause(self)
end

function Grabbing:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Grabbing:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Grabbing:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Grabbing:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Grabbing:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Grabbing:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Grabbing:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Grabbing:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Grabbing:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Grabbing:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Grabbing:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Grabbing:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Grabbing, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Grabbing:className()
  return "Grabbing"
end

function Grabbing:class()
  return self
end

function Grabbing:superClass()
  return BaseClass
end

function Grabbing:__gc()
  --Destroy derived class first
  Grabbing._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Grabbing:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Grabbing:_destroy()
  assert(not self.__GrabbingCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Grabbing:_create(init)
  self.__GrabbingCalledLoad = false
  __ctor(self, init)
end

function Grabbing:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GrabbingCalledLoad = true
end

function Grabbing:unLoad()
  assert(self.__GrabbingCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GrabbingCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Grabbing
