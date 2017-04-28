local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Bird = {}
Bird.__index = Bird

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

function Bird:enter()
  BaseClass.enter(self)
end

function Bird:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Bird:exit()
  BaseClass.exit(self)
end

function Bird:onMessage()
  BaseClass.onMessage(self)
end

function Bird:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Bird:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Bird:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Bird:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Bird:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Bird:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Bird:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Bird:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Bird, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Bird:className()
  return "Bird"
end

function Bird:class()
  return self
end

function Bird:superClass()
  return BaseClass
end

function Bird:__gc()
  --Destroy derived class first
  Bird._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Bird:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Bird:_destroy()
  assert(not self.__BirdCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Bird:_create(init)
  self.__BirdCalledLoad = false
  __ctor(self, init)
end

function Bird:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BirdCalledLoad = true
end

function Bird:unLoad()
  assert(self.__BirdCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BirdCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Bird
