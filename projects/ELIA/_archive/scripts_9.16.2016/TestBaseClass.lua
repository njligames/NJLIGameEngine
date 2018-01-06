local TestBaseClass = {}
TestBaseClass.__index = TestBaseClass

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
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

setmetatable(TestBaseClass, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function TestBaseClass:className()
  return "TestBaseClass"
end

function TestBaseClass:class()
  return self
end

function TestBaseClass:superClass()
  return nil
end

function TestBaseClass:isa(theClass)
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

function TestBaseClass:__gc()
  TestBaseClass._destroy(self)
end

function TestBaseClass:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function TestBaseClass:_destroy()
  assert(not self.__TestBaseClassCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function TestBaseClass:_create(init)
  self.__TestBaseClassCalledLoad = false
  
  __ctor(self, init)
end

function TestBaseClass:load()
  __load(self)
  
  self.__TestBaseClassCalledLoad = true
end

function TestBaseClass:unLoad()
  assert(self.__TestBaseClassCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__TestBaseClassCalledLoad = false
end

return TestBaseClass
