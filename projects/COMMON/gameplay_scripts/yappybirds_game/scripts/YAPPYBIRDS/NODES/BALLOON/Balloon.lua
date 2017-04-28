local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Balloon = {}
Balloon.__index = Balloon

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

function Balloon:enter()
  BaseClass.enter(self)
end

function Balloon:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Balloon:exit()
  BaseClass.exit(self)
end

function Balloon:onMessage()
  BaseClass.onMessage(self)
end

function Balloon:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Balloon:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Balloon:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Balloon:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Balloon:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Balloon:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Balloon:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Balloon:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Balloon, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Balloon:className()
  return "Balloon"
end

function Balloon:class()
  return self
end

function Balloon:superClass()
  return BaseClass
end

function Balloon:__gc()
  --Destroy derived class first
  Balloon._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Balloon:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Balloon:_destroy()
  assert(not self.__BalloonCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Balloon:_create(init)
  self.__BalloonCalledLoad = false
  __ctor(self, init)
end

function Balloon:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BalloonCalledLoad = true
end

function Balloon:unLoad()
  assert(self.__BalloonCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BalloonCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Balloon
