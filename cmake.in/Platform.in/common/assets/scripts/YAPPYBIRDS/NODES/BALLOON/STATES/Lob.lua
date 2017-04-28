local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Lob = {}
Lob.__index = Lob

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

function Lob:enter()
  BaseClass.enter(self)
end

function Lob:update(timeStep)
  BaseClass.update(self, timeStep)
  
end

function Lob:exit()
  BaseClass.exit(self)
end

function Lob:onMessage()
  BaseClass.onMessage(self)
end

function Lob:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
end

function Lob:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
end

function Lob:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
end

function Lob:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
end

function Lob:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Lob:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Lob:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Lob:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Lob, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Lob:className()
  return "Lob"
end

function Lob:class()
  return self
end

function Lob:superClass()
  return BaseClass
end

function Lob:__gc()
  --Destroy derived class first
  Lob._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Lob:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Lob:_destroy()
  assert(not self.__LobCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Lob:_create(init)
  self.__LobCalledLoad = false
  __ctor(self, init)
end

function Lob:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LobCalledLoad = true
end

function Lob:unLoad()
  assert(self.__LobCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__LobCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Lob
