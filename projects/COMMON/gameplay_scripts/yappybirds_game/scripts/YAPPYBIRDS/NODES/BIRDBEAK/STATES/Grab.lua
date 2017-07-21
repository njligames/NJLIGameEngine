local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Grab = {}
Grab.__index = Grab

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

function Grab:enter()
  BaseClass.enter(self)
end

function Grab:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Grab:exit()
  BaseClass.exit(self)
end

function Grab:onMessage()
  BaseClass.onMessage(self)
end

function Grab:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Grab:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Grab:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Grab:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Grab:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Grab:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Grab:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Grab:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Grab:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Grab:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Grab:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Grab:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Grab:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Grab:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Grab:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Grab:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Grab:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Grab:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Grab:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Grab:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Grab:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Grab:renderHUD()
  BaseClass.renderHUD(self)
end

function Grab:gamePause()
  BaseClass.gamePause(self)
end

function Grab:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Grab:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Grab:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Grab:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Grab:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Grab:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Grab:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Grab:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Grab:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Grab:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Grab:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Grab:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Grab, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Grab:className()
  return "Grab"
end

function Grab:class()
  return self
end

function Grab:superClass()
  return BaseClass
end

function Grab:__gc()
  --Destroy derived class first
  Grab._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Grab:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Grab:_destroy()
  assert(not self.__GrabCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Grab:_create(init)
  self.__GrabCalledLoad = false
  __ctor(self, init)
end

function Grab:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GrabCalledLoad = true
end

function Grab:unLoad()
  assert(self.__GrabCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GrabCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Grab
