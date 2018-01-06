local NodeEntity = {}
NodeEntity.__index = NodeEntity

local json = require('json')

setmetatable(NodeEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function NodeEntity:className()
  return "NodeEntity"
end

function NodeEntity:class()
  return self
end

function NodeEntity:superClass()
  return nil
end

function NodeEntity:isa(theClass)
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

function NodeEntity:destroy()
  NodeEntity.__gc(self)
end

function NodeEntity:create(init)

  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")
  assert(init.physicsShape, "Init variable is expecting a physicsShape value")
  assert(init.physicsBody, "Init variable is expecting a physicsBody value")
  assert(init.sharedGeometry, "Init variable is expecting a sharedGeometry value")

  self._init = init

  self:load()
end

function NodeEntity:__gc()
  self:unLoad()
end

function NodeEntity:__tostring()

  return json:stringify(self)
end

function NodeEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function NodeEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function NodeEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function NodeEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function NodeEntity:hasState()
  return self:getNode():getStateMachine():getState() ~= nil
end

function NodeEntity:getCurrentEntityState()
  assert(self:getNode():getStateMachine(), "message")
  assert(self:getNode():getStateMachine():getState(), "message")
  assert(self:getNode():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getNode():getStateMachine():getState():getName())
end

function NodeEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function NodeEntity:getNode()
  return self._node
end

function NodeEntity:getPhysicsShape()
  return self._physicsShape
end

function NodeEntity:getPhysicsBody()
  return self._physicsBody
end

function NodeEntity:getAction()
  return self._action
end

function NodeEntity:getClock()
  return self._clock
end

function NodeEntity:isLoaded()
  if self.loaded then
    return self.loaded
  end
  return false
end

function NodeEntity:load()
  print("SceneEntity:load()")

  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
  self.loaded = true
  
  
  

--  self._stateEntityTable = {}
--  for k,v in pairs(self._init.states) do
--    local m = require v.module

--    self:_addEntityState(v.name, m)
--  end

--  self._node = njli.Node.create()
--  self:getNode():setName(self._init.name)

--  self._physicsShape = self._init.physicsShape
--  self._physicsBody = self._init.physicsBody

--  self._action = njli.Action.create()
--  self._clock = njli.Clock.create()

--  self._sharedGeometry = self._init.sharedGeometry

--  self.loaded = true
end

function NodeEntity:unLoad()

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
  
  print("SceneEntity:unLoad()")
  
  
  
  
  if self:getClock() then
    njli.Clock.destroy(self:getClock())
    self._clock = nil
  end

  if self:getAction() then
    njli.Action.destroy(self:getAction())
    self._action = nil
  end

  if self:getPhysicsBody() then
    njli.PhysicsBody.destroy(self:getPhysicsBody())
    self._physicsBody = nil
  end

  if self:getPhysicsShape() then
    njli.PhysicsShape.destroy(self:getPhysicsShape())
    self._physicsShape = nil
  end

  if self:getNode() then
    njli.Node.destroy(self:getNode())
    self._node = nil
  end

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
end

function NodeEntity:startStateMachine()
end

function NodeEntity:enter()
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():enter()
end

function NodeEntity:update(timeStep)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():update(timeStep)
end

function NodeEntity:exit()
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():exit()
end

function NodeEntity:onMessage(message)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():onMessage(message)
end

function NodeEntity:touchDown(touches)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():touchDown(touches)
end

function NodeEntity:touchUp(touches)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():touchUp(touches)
end

function NodeEntity:touchMove(touches)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():touchMove(touches)
end

function NodeEntity:touchCancelled(touches)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():touchCancelled(touches)
end

function NodeEntity:render()
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():render()
end

function NodeEntity:actionUpdate(action, timeStep)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():actionUpdate(action, timeStep)
end

function NodeEntity:actionComplete(action)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():actionComplete(action)
end

function NodeEntity:collide(otherNode, collisionPoint)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():collide(otherNode, collisionPoint)
end

function NodeEntity:near(otherNode)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():near(otherNode)
end

function NodeEntity:rayTouchDown(rayContact)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():rayTouchDown(rayContact)
end

function NodeEntity:rayTouchUp(rayContact)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():rayTouchUp(rayContact)
end

function NodeEntity:rayTouchMove(rayContact)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():rayTouchMove(rayContact)
end

function NodeEntity:rayTouchCancelled(rayContact)
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():rayTouchCancelled(rayContact)
end

function NodeEntity:pause()
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():pause()
end

function NodeEntity:unPause()
  assert(self:hasState(), "NodeEntity must be in a state")
  self:getCurrentEntityState():unPause()
end

return NodeEntity
