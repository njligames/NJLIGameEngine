local YappyGame = {}
YappyGame.__index = YappyGame

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
  assert(init, "init variable is nil.")
  assert(init.class, "init.class variable is expecting a class")
  assert(init.states, "init.states variable is expecting a states table")
  assert(type(init.states) == "table", "init.states variable is expecting a states table")

  --Create the WorldEntity
  self._worldEntity = init.class({
    name = init.name,
    --Set WorldEntityStates
    states = init.states,
    --Set the nodes for this WorldEntity
    nodes = init.nodes,
    entityOwner = self,
  })

  -- self._worldEntity:load()

end

local __dtor = function(self)
    self._worldEntity = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function YappyGame:perspectiveCamera()
    return self._perspectiveCamera
end

function YappyGame:orthographicCamera()
    return self._orthographicCamera
end

function YappyGame:geometry()
    return self._geometry
end

function YappyGame:shader()
    return self._shader
end

function YappyGame:material()
    return self._material
end

--#############################################################################

function YappyGame:startStateMachine()
  
  self:getWorldEntity():startStateMachine()

  -- for k,v in pairs(self._nodeEntityTable) do
  --   v:startStateMachine()
  -- end

end

function YappyGame:getWorldEntity()
  return self._worldEntity
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(YappyGame, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function YappyGame:className()
  return "YappyGame"
end

function YappyGame:class()
  return self
end

function YappyGame:superClass()
  return nil
end

function YappyGame:isa(theClass)
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

function YappyGame:__gc()
  YappyGame._destroy(self)
end

function YappyGame:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function YappyGame:_destroy()
  assert(not self.__YappyGameCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function YappyGame:_create(init)
  self.__YappyGameCalledLoad = false

  __ctor(self, init)
end

function YappyGame:load()
  __load(self)

  self.__YappyGameCalledLoad = true
end

function YappyGame:unLoad()
  assert(self.__YappyGameCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__YappyGameCalledLoad = false
end

return YappyGame
