local EntityManager = {}
EntityManager.__index = EntityManager

local __ctor = function(self, init)

  self.__nodeEntityTable = {}
  self.__sceneEntityTable = {}
  self.__worldEntityTable = {}

  self.__nodeEntityStateTable = {}
  self.__sceneEntityStateTable = {}
  self.__worldEntityStateTable = {}
end

local __dtor = function(self)

  self.__nodeEntityTable = nil
  self.__sceneEntityTable = nil
  self.__worldEntityTable = nil

  self.__nodeEntityStateTable = nil
  self.__sceneEntityStateTable = nil
  self.__worldEntityStateTable = nil
end

local __load = function(self)

end

local __unLoad = function(self)

end

function EntityManager:getNodeEntity(key)
  if not self:hasNodeEntity(key) then
    error("There is no NodeEntity with key " .. key, 2)
  end

  return self.__nodeEntityTable[key]
end

function EntityManager:getSceneEntity(key)
  if not self:hasSceneEntity(key) then
    error("There is no SceneEntity with key " .. key, 2)
  end

  return self.__sceneEntityTable[key]
end

function EntityManager:getWorldEntity(key)
  if not self:hasWorldEntity(key) then
    error("There is no WorldEntity with key " .. key, 2)
  end

  return self.__worldEntityTable[key]
end

function EntityManager:getNodeEntityState(key)
  if not self:hasNodeEntityState(key) then
    error("There is no NodeEntityState with key " .. key, 2)
  end

  return self.__nodeEntityStateTable[key]
end

function EntityManager:getSceneEntityState(key)
  if not self:hasSceneEntityState(key) then
    error("There is no SceneEntityState with key " .. key, 2)
  end

  return self.__sceneEntityStateTable[key]
end

function EntityManager:getWorldEntityState(key)
  if not self:hasWorldEntityState(key) then
    error("There is no WorldEntityState with key " .. key)
  end

  return self.__worldEntityStateTable[key]
end

function EntityManager:__generateUniqueName(object, tbl)
    local baseName = object:getName()
    local name = baseName
    local instance = 1
    if tbl[name] ~= nil then
        repeat
            name = baseName .. ",." .. tostring(instance) .. ","
            instance = instance + 1
        until(tbl[name] == nil)
    end
    object:setName(name)

    assert(nil == tbl[name], "__generateUniqueName didn't function correctly")
end

function EntityManager:addNodeEntity(entity)
    assert(entity, "nodeEntity is nil")

    self:__generateUniqueName(entity:getNode(), self.__nodeEntityTable)
    self.__nodeEntityTable[entity:getNode():getName()] = entity
end

function EntityManager:addSceneEntity(entity)
    assert(entity, "sceneEntity is nil")

    self:__generateUniqueName(entity:getScene(), self.__sceneEntityTable)
    self.__sceneEntityTable[entity:getScene():getName()] = entity
end

function EntityManager:addWorldEntity(entity)
    assert(entity, "worldEntity is nil")

    self:__generateUniqueName(entity:getWorld(), self.__worldEntityTable)
    self.__worldEntityTable[entity:getWorld():getName()] = entity
end

function EntityManager:addNodeEntityState(entity)
    assert(entity, "nodeEntityState is nil")

    self:__generateUniqueName(entity:getNodeState(), self.__nodeEntityStateTable)
    self.__nodeEntityStateTable[entity:getNodeState():getName()] = entity
end

function EntityManager:addSceneEntityState(entity)
    assert(entity, "sceneEntityState is nil")

    self:__generateUniqueName(entity:getSceneState(), self.__sceneEntityStateTable)
    self.__sceneEntityStateTable[entity:getSceneState():getName()] = entity
end

function EntityManager:addWorldEntityState(entity)
    assert(entity, "worldEntityState is nil")

    self:__generateUniqueName(entity:getWorldState(), self.__worldEntityStateTable)
    self.__worldEntityStateTable[entity:getWorldState():getName()] = entity
end

function EntityManager:removeNodeEntity(entity)
    local key = entity:getNode():getName()

    assert(self:hasNodeEntity(key), "trying to remove a nodeEntity that isn't there")

    self.__nodeEntityTable[key] = nil
end

function EntityManager:removeSceneEntity(entity)
    local key = entity:getScene():getName()
    assert(self:hasSceneEntity(key), "trying to remove a sceneEntity that isn't there")

    self.__sceneEntityTable[key] = nil
end

function EntityManager:removeWorldEntity(entity)
    local key = entity:getWorld():getName()
    assert(self:hasWorldEntity(key), "trying to remove a worldEntity that isn't there")

    self.__worldEntityTable[key] = nil
end

function EntityManager:removeNodeEntityState(entity)
    local key = entity:getNodeState():getName()
    assert(self:hasNodeEntityState(key), "trying to remove a nodeEntityState that isn't there")

    local entityState = self.__nodeEntityStateTable[key]
    local entity = entityState:getNodeEntity()
    entity:__removeEntityState(entityState:getNodeState():getName())

    self.__nodeEntityStateTable[key] = nil
end

function EntityManager:removeSceneEntityState(entity)
    local key = entity:getSceneState():getName()
    assert(self:hasSceneEntityState(key), "trying to remove a sceneEntityState that isn't there")

    local entityState = self.__sceneEntityStateTable[key]
    local entity = entityState:getSceneEntity()
    entity:__removeEntityState(entityState:getSceneState():getName())

    self.__sceneEntityStateTable[key] = nil
end

function EntityManager:removeWorldEntityState(entity)
    local key = entity:getWorldState():getName()
    assert(self:hasWorldEntityState(key), "trying to remove a worldEntitystate that isn't there")

    local entityState = self.__worldEntityStateTable[key]
    local entity = entityState:getWorldEntity()
    entity:__removeEntityState(entityState:getWorldState():getName())

    self.__worldEntityStateTable[key] = nil
end

function EntityManager:hasNodeEntity(key)
  return (self.__nodeEntityTable[key] ~= nil)
end

function EntityManager:hasSceneEntity(key)
  return (self.__sceneEntityTable[key] ~= nil)
end

function EntityManager:hasWorldEntity(key)
  return (self.__worldEntityTable[key] ~= nil)
end

function EntityManager:hasNodeEntityState(key)
  return (self.__nodeEntityStateTable[key] ~= nil)
end

function EntityManager:hasSceneEntityState(key)
  return (self.__sceneEntityStateTable[key] ~= nil)
end

function EntityManager:hasWorldEntityState(key)
  return (self.__worldEntityStateTable[key] ~= nil)
end

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
