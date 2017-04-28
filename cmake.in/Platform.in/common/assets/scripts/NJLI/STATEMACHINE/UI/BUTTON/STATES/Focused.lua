local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Focused = {}
Focused.__index = Focused

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

function Focused:enter()
	BaseClass.enter(self)
end

function Focused:update(timeStep)
	BaseClass.update(self, timeStep)
end

function Focused:exit()
	BaseClass.exit(self)
end

function Focused:onMessage()
	BaseClass.onMessage(self)
end

function Focused:rayTouchDown(rayContact)
	BaseClass.rayTouchDown(self, rayContact)
end

function Focused:rayTouchUp(rayContact)
	BaseClass.rayTouchUp(self, rayContact)
end

function Focused:rayTouchMove(rayContact)
	BaseClass.rayTouchMove(self, rayContact)
end

function Focused:rayTouchCancelled(rayContact)
	BaseClass.rayTouchCancelled(self, rayContact)
end

function Focused:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)
end

function Focused:collide(otherNode, collisionPoint)
	BaseClass.collide(self, collisionPoint)
end

function Focused:near(otherNode)
	BaseClass.near(self, otherNode)
end

function Focused:actionUpdate(action, timeStep)
	BaseClass.actionUpdate(self, timeStep)
end

function Focused:actionComplete(action)
	BaseClass.actionComplete(self, action)
end

function Focused:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Focused:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Focused:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Focused:renderHUD()
    BaseClass.renderHUD(self)
end

function Focused:gamePause()
    BaseClass.gamePause(self)
end

function Focused:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Focused:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Focused:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Focused:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Focused:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Focused, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Focused:className()
  return "Focused"
end

function Focused:class()
  return self
end

function Focused:superClass()
  return BaseClass
end

function Focused:__gc()
  --Destroy derived class first
  Focused._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Focused:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Focused:_destroy()
  assert(not self.__FocusedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Focused:_create(init)
  self.__FocusedCalledLoad = false
  __ctor(self, init)
end

function Focused:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__FocusedCalledLoad = true
end

function Focused:unLoad()
  assert(self.__FocusedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__FocusedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Focused
