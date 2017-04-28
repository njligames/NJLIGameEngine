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

function Pursue:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
end

function Pursue:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
end

function Pursue:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
end

function Pursue:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
end

function Pursue:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Pursue:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Pursue:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Pursue:actionComplete(action)
  BaseClass.actionComplete(self, action)
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
