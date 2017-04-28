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

function Grab:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
end

function Grab:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
end

function Grab:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
end

function Grab:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
end

function Grab:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Grab:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Grab:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Grab:actionComplete(action)
  BaseClass.actionComplete(self, action)
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
