local Interface = {}
Interface.__index = Interface

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

require "NJLI.util"

local StateMachineEntity = require "NJLI.STATEMACHINE.StateMachineEntity"
local DeviceEntity = require "NJLI.DeviceEntity"

local __ctor = function(self, init)
  self._stateMachineEntity = StateMachineEntity()
  self._deviceEntity = DeviceEntity()
end

local __dtor = function(self)
  self._stateMachineEntity = nil
  self._deviceEntity = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--Private
--#############################################################################

function Interface:getStateMachine()
  return self._stateMachineEntity
end

function Interface:getDeviceEntity()
  return self._deviceEntity
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Interface, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function Interface:className()
  return "Interface"
end

function Interface:class()
  return self
end

function Interface:superClass()
  return nil
end

function Interface:isa(theClass)
  local b_isa = false
  local cur_class = theClass:class()
  while ( nil ~= cur_class ) and ( false == b_isa ) do
    if cur_class == theClass then
      b_isa = true
    else
      cur_class = cur_class:superClass()
    end
  end

  return b_isa
end

function Interface:__gc()
  Interface._destroy(self)
end

function Interface:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Interface:_destroy()
  assert(not self.__NJLIInterfaceCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function Interface:_create(init)
  self.__NJLIInterfaceCalledLoad = false

  __ctor(self, init)
end

function Interface:load()
  __load(self)

  self.__NJLIInterfaceCalledLoad = true
end

function Interface:unLoad()
  assert(self.__NJLIInterfaceCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__NJLIInterfaceCalledLoad = false
end

return Interface

