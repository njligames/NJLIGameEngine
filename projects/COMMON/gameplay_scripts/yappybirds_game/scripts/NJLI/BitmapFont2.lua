local BitmapFont2 = {}
BitmapFont2.__index = BitmapFont2

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

--TODO: write function here for BitmapFont2
--function BitmapFont2:somefunction()
--end

function BitmapFont2:load(...)
  local fonts = ... or {}

  local baseFontPath = "fonts/"

  self._fonts = {}

  for i=1,#fonts do
    local font = fonts[i]
    print(font)
  end

end

function BitmapFont2:printf(...)
	local arg = ... or {}

	local text = arg.text or "BitmapFont2 Text"
	local align = "left"
	local fontIndex = arg.fontIndex or 1

	if arg.align and (arg.align == "left" or arg.align == "center" or arg.align == "right") then
		align = arg.align
	end

	for c in string.gmatch( text .. '\n', '(.)' ) do
		print(c)
	end


	local mainNode
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BitmapFont2, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function BitmapFont2:className()
  return "BitmapFont2"
end

function BitmapFont2:class()
  return self
end

function BitmapFont2:superClass()
  return nil
end

function BitmapFont2:isa(theClass)
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

function BitmapFont2:__gc()
  BitmapFont2._destroy(self)
end

function BitmapFont2:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BitmapFont2:_destroy()
  assert(not self.__BitmapFont2CalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function BitmapFont2:_create(init)
  self.__BitmapFont2CalledLoad = false
  
  __ctor(self, init)
end

function BitmapFont2:load()
  __load(self)
  
  self.__BitmapFont2CalledLoad = true
end

function BitmapFont2:unLoad()
  assert(self.__BitmapFont2CalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__BitmapFont2CalledLoad = false
end

return BitmapFont2
