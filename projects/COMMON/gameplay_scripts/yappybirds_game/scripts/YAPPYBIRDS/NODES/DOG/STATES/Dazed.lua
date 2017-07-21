local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Dazed = {}
Dazed.__index = Dazed

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

function Dazed:enter()
  BaseClass.enter(self)
end

function Dazed:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Dazed:exit()
  BaseClass.exit(self)
end

function Dazed:onMessage()
  BaseClass.onMessage(self)
end

function Dazed:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Dazed:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Dazed:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Dazed:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Dazed:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Dazed:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Dazed:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Dazed:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Dazed:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Dazed:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Dazed:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Dazed:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Dazed:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Dazed:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Dazed:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Dazed:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Dazed:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Dazed:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Dazed:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Dazed:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Dazed:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Dazed:renderHUD()
  BaseClass.renderHUD(self)
end

function Dazed:gamePause()
  BaseClass.gamePause(self)
end

function Dazed:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Dazed:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Dazed:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Dazed:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Dazed:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Dazed:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Dazed:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Dazed:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Dazed:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Dazed:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Dazed:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Dazed:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Dazed, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Dazed:className()
  return "Dazed"
end

function Dazed:class()
  return self
end

function Dazed:superClass()
  return BaseClass
end

function Dazed:__gc()
  --Destroy derived class first
  Dazed._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Dazed:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Dazed:_destroy()
  assert(not self.__DazedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Dazed:_create(init)
  self.__DazedCalledLoad = false
  __ctor(self, init)
end

function Dazed:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__DazedCalledLoad = true
end

function Dazed:unLoad()
  assert(self.__DazedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__DazedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Dazed
