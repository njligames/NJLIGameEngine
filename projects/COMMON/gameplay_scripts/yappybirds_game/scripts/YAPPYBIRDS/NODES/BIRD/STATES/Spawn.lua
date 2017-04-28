local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Spawn = {}
Spawn.__index = Spawn

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

function Spawn:enter()
  BaseClass.enter(self)
end

function Spawn:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Spawn:exit()
  BaseClass.exit(self)
end

function Spawn:onMessage()
  BaseClass.onMessage(self)
end

function Spawn:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
end

function Spawn:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
end

function Spawn:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
end

function Spawn:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
end

function Spawn:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Spawn:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Spawn:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Spawn:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Spawn, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Spawn:className()
  return "Spawn"
end

function Spawn:class()
  return self
end

function Spawn:superClass()
  return BaseClass
end

function Spawn:__gc()
  --Destroy derived class first
  Spawn._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Spawn:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Spawn:_destroy()
  assert(not self.__SpawnCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Spawn:_create(init)
  self.__SpawnCalledLoad = false
  __ctor(self, init)
end

function Spawn:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SpawnCalledLoad = true
end

function Spawn:unLoad()
  assert(self.__SpawnCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__SpawnCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Spawn
