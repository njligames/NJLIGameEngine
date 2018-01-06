local WorldEntity = {}
WorldEntity.__index = WorldEntity

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
   assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")
  assert(init.startStateName, "Init variable is expecting a startStateName value")
  assert(init.gameInstance, "Init variable is expecting a gameInstance value")

  self._gameInstance = init.gameInstance
  self._startStateName = init.startStateName

  self._world = njli.World.getInstance()

  self:getWorld():setName(init.name)

  self._stateEntityTable = {}
  if init then
    for k,v in pairs(init.states) do
      self:_addEntityState(v.name, v.module)
    end
  end
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

function WorldEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function WorldEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function WorldEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: \"" .. stateName .. "\"")

  return self._stateEntityTable[stateName]
end

function WorldEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function WorldEntity:_hasState()
  return self:getWorld():getStateMachine():getState() ~= nil
end

function WorldEntity:_getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "message")
  assert(self:getWorld():getStateMachine():getState(), "There is no current World State")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

--#############################################################################
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(WorldEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function WorldEntity:className()
  return "WorldEntity"
end

function WorldEntity:class()
  return self
end

function WorldEntity:superClass()
  return nil
end

function WorldEntity:isa(theClass)
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

function WorldEntity:__gc()
  WorldEntity._destroy(self)
end

function WorldEntity:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntity:_destroy()
  assert(not self.__WorldEntityCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function WorldEntity:_create(init)
  self.__WorldEntityCalledLoad = false
  
  __ctor(self, init)
end

function WorldEntity:load()
  __load(self)
  
  self.__WorldEntityCalledLoad = true
end

function WorldEntity:unLoad()
  assert(self.__WorldEntityCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__WorldEntityCalledLoad = false
end

return WorldEntity
