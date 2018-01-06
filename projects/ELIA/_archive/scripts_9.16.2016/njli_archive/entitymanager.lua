local EntityManager = {}
EntityManager.__index = EntityManager

local json = require('json')

setmetatable(EntityManager, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function EntityManager:destroy()
  EntityManager.__gc(self)
end

function EntityManager:create(init)

  self._nodeEntityTable = {}
  self._sceneEntityTable = {}
  self._worldEntityTable = {}

  if init then

  end
end

function EntityManager:__gc()

  for k,v in pairs(self._nodeEntityTable) do
    v:destroy()
  end

  for k,v in pairs(self._sceneEntityTable) do
    v:destroy()
  end

  for k,v in pairs(self._worldEntityTable) do
    v:destroy()
  end
end

function EntityManager:__tostring()

  return json:stringify(self)
end

function EntityManager:set_nodeEntityTable(newval)
  self._nodeEntityTable = newval
end

function EntityManager:get_nodeEntityTable()
  return self._nodeEntityTable
end

function EntityManager:set_sceneEntityTable(newval)
  self._sceneEntityTable = newval
end

function EntityManager:get_sceneEntityTable()
  return self._sceneEntityTable
end

function EntityManager:set_worldEntityTable(newval)
  self._worldEntityTable = newval
end

function EntityManager:get_worldEntityTable()
  return self._worldEntityTable
end

function EntityManager:getNodeEntity(key)
  assert(self:hasNodeEntity(key), "There is no NJLINodeEntity with key " .. key)

  local nodeEntity = self._nodeEntityTable[key]
  assert(nodeEntity, "The nodeEntity is nil")

  return nodeEntity
end

function EntityManager:getSceneEntity(key)
  assert(self:hasSceneEntity(key), "There is no NJLISceneEntity with key " .. key)

  local sceneEntity = self._sceneEntityTable[key]
  assert(sceneEntity, "The sceneEntity is nil")

  return sceneEntity
end

function EntityManager:getWorldEntity(key)
  assert(self:hasWorldEntity(key), "There is no NJLIWorldEntity with key " .. key)

  local worldEntity = self._worldEntityTable[key]
  assert(worldEntity, "The worldEntity is nil")

  return worldEntity
end

function EntityManager:addNodeEntity(nodeEntity)
  assert(nodeEntity, "nodeEntity is nil")

  local key = nodeEntity:getNode():getName()
  assert(not self:hasNodeEntity(key), "Trying to overwrite a NJLINodeEntity with key " .. key)

  self._nodeEntityTable[key] = nodeEntity

  return key
end

function EntityManager:addSceneEntity(sceneEntity)
  assert(sceneEntity, "sceneEntity is nil")

  local scene = sceneEntity:getScene()

  local key = scene:getName()

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

function EntityManager:removeNodeEntity(key)
  self:getNodeEntity(key):destroy()

  self._nodeEntityTable[key] = nil
end

function EntityManager:removeSceneEntity(key)
  self:getSceneEntity(key):destroy()

  self._sceneEntityTable[key] = nil
end

function EntityManager:removeWorldEntity(key)
  self:getWorldEntity(key):destroy()

  self._worldEntityTable[key] = nil
end

function EntityManager:hasNodeEntity(key)
  return (self._nodeEntityTable[key] ~= nil)
end

function EntityManager:hasSceneEntity(key)
  return (self._sceneEntityTable[key] ~= nil)
end

function EntityManager:hasWorldEntity(key)
  return (self._worldEntityTable[key] ~= nil)
end

return EntityManager

