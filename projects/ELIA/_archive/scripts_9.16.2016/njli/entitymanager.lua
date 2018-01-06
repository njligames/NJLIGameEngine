local EntityManager = {}
EntityManager.__index = EntityManager

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
  self._nodeEntityTable = {}
  self._sceneEntityTable = {}
  self._worldEntityTable = {}
end

local __dtor = function(self)
  --TODO: destruct this Entity
  self._nodeEntityTable = nil
  self._sceneEntityTable = nil
  self._worldEntityTable = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function EntityManager:getNodeEntity(key)
  assert(self:hasNodeEntity(key), "There is no NJLINodeEntity with key " .. key)

  return self._nodeEntityTable[key]
end

function EntityManager:getSceneEntity(key)
  assert(self:hasSceneEntity(key), "There is no NJLISceneEntity with key " .. key)

  return self._sceneEntityTable[key]
end

function EntityManager:getWorldEntity(key)
  assert(self:hasWorldEntity(key), "There is no NJLIWorldEntity with key " .. key)

  return self._worldEntityTable[key]
end

--#############################################################################

function EntityManager:addNodeEntity(nodeEntity)
  assert(nodeEntity, "nodeEntity is nil")

  local key = nodeEntity:getNode():getName()

  assert(not self:hasNodeEntity(key), "Trying to overwrite a NJLINodeEntity with key " .. key)
  self._nodeEntityTable[key] = nodeEntity

  return key
end

function EntityManager:addSceneEntity(sceneEntity)
  assert(sceneEntity, "sceneEntity is nil")

  local key = sceneEntity:getScene():getName()

  assert(not self:hasSceneEntity(key), "Trying to overwrite a NJLISceneEntity with key " .. key)
  self._sceneEntityTable[key] = sceneEntity

  return key
end

function EntityManager:addWorldEntity(worldEntity)
  assert(worldEntity, "worldEntity is nil")

  local key = worldEntity:getWorld():getName()

  assert(not self:hasWorldEntity(key), "Trying to overwrite a NJLIWorldEntity with key " .. key)
  self._worldEntityTable[key] = worldEntity

  return key
end

--#############################################################################

function EntityManager:removeNodeEntity(key)
  self._nodeEntityTable[key] = nil
end

function EntityManager:removeSceneEntity(key)
  self._sceneEntityTable[key] = nil
end

function EntityManager:removeWorldEntity(key)
  self._worldEntityTable[key] = nil
end

--#############################################################################

function EntityManager:hasNodeEntity(key)
  return (self._nodeEntityTable[key] ~= nil)
end

function EntityManager:hasSceneEntity(key)
  return (self._sceneEntityTable[key] ~= nil)
end

function EntityManager:hasWorldEntity(key)
  return (self._worldEntityTable[key] ~= nil)
end

--#############################################################################
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(EntityManager, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function EntityManager:className()
  return "EntityManager"
end

function EntityManager:class()
  return self
end

function EntityManager:superClass()
  return nil
end

function EntityManager:isa(theClass)
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

function EntityManager:__gc()
  EntityManager._destroy(self)
end

function EntityManager:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function EntityManager:_destroy()
  assert(not self.__EntityManagerCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function EntityManager:_create(init)
  self.__EntityManagerCalledLoad = false
  
  __ctor(self, init)
end

function EntityManager:load()
  __load(self)
  
  self.__EntityManagerCalledLoad = true
end

function EntityManager:unLoad()
  assert(self.__EntityManagerCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__EntityManagerCalledLoad = false
end

return EntityManager
