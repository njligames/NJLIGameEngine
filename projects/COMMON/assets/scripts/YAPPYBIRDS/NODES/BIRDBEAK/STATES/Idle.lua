local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Idle = {}
Idle.__index = Idle

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

function Idle:enter()
  BaseClass.enter(self)
end

function Idle:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Idle:exit()
  BaseClass.exit(self)
end

function Idle:onMessage()
  BaseClass.onMessage(self)
end

function Idle:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
end

function Idle:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
end

function Idle:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
end

function Idle:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
end

function Idle:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Idle:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Idle:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Idle:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Idle, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Idle:className()
  return "Idle"
end

function Idle:class()
  return self
end

function Idle:superClass()
  return BaseClass
end

function Idle:__gc()
  --Destroy derived class first
  Idle._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Idle:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Idle:_destroy()
  assert(not self.__IdleCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Idle:_create(init)
  self.__IdleCalledLoad = false
  __ctor(self, init)
end

function Idle:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__IdleCalledLoad = true
end

function Idle:unLoad()
  assert(self.__IdleCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__IdleCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Idle
