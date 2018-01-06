local BaseClass = require "TestBaseClass"

local TestDerivedClass = {}
TestDerivedClass.__index = TestDerivedClass

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
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(TestDerivedClass, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function TestDerivedClass:className()
  return "TestDerivedClass"
end

function TestDerivedClass:class()
  return self
end

function TestDerivedClass:superClass()
  return BaseClass
end

function TestDerivedClass:__gc()
  --Destroy derived class first
  TestDerivedClass._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function TestDerivedClass:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function TestDerivedClass:_destroy()
  assert(not self.__TestDerivedClassCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function TestDerivedClass:_create(init)
  self.__TestDerivedClassCalledLoad = false
  __ctor(self, init)
end

function TestDerivedClass:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__TestDerivedClassCalledLoad = true
end

function TestDerivedClass:unLoad()
  assert(self.__TestDerivedClassCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__TestDerivedClassCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return TestDerivedClass
