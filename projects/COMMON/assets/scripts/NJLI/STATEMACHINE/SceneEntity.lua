local SceneEntity = {}
SceneEntity.__index = SceneEntity

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
    assert(nil ~= init, "init variable is nil.")
    assert(type(init) == "table", "not a table")
    assert(nil ~= init.states, "init variable is nil.")
    assert(type(init.states) == "table", "not a table")
    assert(nil ~= init.entityOwner, "entityOwner variable is nil.")
    assert(nil ~= init.nodes, "init variable is nil.")
    assert(type(init.nodes) == "table", "not a table")

    self.__nodeEntities = {}

    self._entityOwner = init.entityOwner

    self._physicsWorld = njli.PhysicsWorld.create()
    self._scene = njli.Scene.create()
    self:getScene():setPhysicsWorld(self._physicsWorld)

    if init.name ~= nil then
        self:getScene():setName(init.name)
    else
        self:getScene():setName("NJLI.STATEMACHINE.SceneEntity")
    end
    
    njli.World.getInstance():setScene(self:getScene())
    
    self._entityName = self:getScene():getName()

    self._rootNode = njli.Node.create()
    self:getScene():setRootNode(self._rootNode)

    local startState = nil

    self._stateEntityTable = {}
    self._localStateEntityTable = {}
    
    for k,v in pairs(init.states) do
        assert(v.class ~= nil, "")
        assert(v.nodes ~= nil, "is nil")
        assert(type(v.nodes) == "table", "not a table")

        --create a SceneEntityState
        local stateEntity = v.class({
            name = v.name,
            entityOwner = self,
            nodes = v.nodes
          })
  
        local key = stateEntity:getEntityName()
        assert(self._localStateEntityTable[key] == nil, "Cannot have duplicate stateEntity names.")
        self._localStateEntityTable[key] = stateEntity

        if startState == nil then
          startState = stateEntity
        end

        self:__addEntityState(stateEntity)
    end

    assert(startState, "No start state was defined for " .. self:getScene():getName())

    --Create the NodeEntities for this SceneEntity
    self:addNodeEntities(init.nodes, self)

    Interface:getStateMachine():getEntityManager():addSceneEntity(self)

    self._startStateName = startState:getSceneState():getName()
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeSceneEntity(self)

  self._localStateEntityTable = nil
  self._stateEntityTable = nil

  njli.Scene.destroy(self:getScene())
  self._scene = nil

    njli.PhysicsWorld.destroy(self._physicsWorld)
    self._physicsWorld = nil

  njli.Node.destroy(self._rootNode)
  self._rootNode = nil
    
end

local __load = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getSceneState():getName()):load()
    end
end

local __unLoad = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getSceneState():getName()):unLoad()
    end
end

--#############################################################################
--Private
--#############################################################################

function SceneEntity:__addEntityState(entityState)
    table.insert(self._stateEntityTable, entityState)
end

function SceneEntity:__removeEntityState(stateName)
    local has, index, entityState = self:hasEntityState(stateName)
    if has then
        self._localStateEntityTable[entityState:getEntityName()] = nil
        table.remove(self._stateEntityTable, index)
    end
end

function SceneEntity:__getEntityState(stateName)
  local nodeEntityState = self._localStateEntityTable[stateName]
  
  if nil == nodeEntityState then
    return Interface:getStateMachine():getEntityManager():getSceneEntityState(stateName)
  end
  
  return nodeEntityState
end

function SceneEntity:_getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:__getEntityState(self:getScene():getStateMachine():getState():getName())
end

--#############################################################################
--Add/Remove NodeEntities
--#############################################################################

function SceneEntity:addNodeEntities(nodes, nodeEntitiyOwner)
  for k,v in pairs(nodes) do
    --Create a NodeEntity
    assert(v.class ~= nil, "init.class variable is expecting a class")
    assert(v.states ~= nil, "init.states variable is expecting a states table")
    assert(type(v.states) == "table", "init.states variable is expecting a states table")
    -- assert(v.nodes ~= nil, "init.nodes variable is expecting a nodes table")
    -- assert(type(v.nodes) == "table", "init.nodes variable is expecting a nodes table")

    local nodeEntity = v.class({
        name = v.name,
        states = v.states,
        entityOwner = nodeEntitiyOwner,
      })

    self:addNodeEntity(nodeEntity)

    if nil ~= v.nodes then
      self:addNodeEntities(v.nodes, nodeEntity)
    end
  end
end

function SceneEntity:removeNodeEntities()
    for k, v in pairs(self.__nodeEntities) do
        self:removeNodeEntity(k)
    end
end

function SceneEntity:addNodeEntity(nodeEntity)

    assert(self.__nodeEntities ~= nil)
    assert(nodeEntity ~= nil)

    local name = nodeEntity:getNode():getName()

    assert(self.__nodeEntities[name] == nil)

    self.__nodeEntities[name]  = nodeEntity

    local nodeEntitiyOwner = nodeEntity:getOwner()

    if nodeEntitiyOwner:superClass():className() == "SceneEntity" or
        nodeEntitiyOwner:superClass():className() == "SceneEntityState" then
        self:getScene():getRootNode():addChildNode(nodeEntity:getNode())
    else
        nodeEntitiyOwner:getNode():addChildNode(nodeEntity:getNode())
    end
end

function SceneEntity:removeNodeEntity(name)
    assert(name ~= nil)
    assert(self.__nodeEntities ~= nil)

    self.__nodeEntities[name] = nil
end

function SceneEntity:startNodeEntities()
   for k, v in pairs(self.__nodeEntities) do
       v:startStateMachine()
   end
end

--#############################################################################
--General
--#############################################################################

function SceneEntity:getEntityName()
  return self._entityName
end

function SceneEntity:getScene()
  return self._scene
end

function SceneEntity:hasEntityState(stateName)
    for index,value in ipairs(self._stateEntityTable) do 
        if stateName == value:getSceneState():getName() then
            return true, index, value
        end
    end
    return false
end

function SceneEntity:hasState()
  return self:getScene():getStateMachine():getState() ~= nil
end

function SceneEntity:getWorldEntityState()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function SceneEntity:pushState(stateName)
    self:__getEntityState(stateName):push()
end

function SceneEntity:getStartStateEntity()
  return self:__getEntityState(self._startStateName)
end

function SceneEntity:startStateMachine()
    --print(self:getScene():getName() .. " :startStateMachine()")

    self:pushState(self._startStateName)
end

function SceneEntity:enter()
    --print(self:getScene():getName() .. " :enter()")

    assert(self:hasState(), "SceneEntity must be in a state")

    self:_getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
  --print(self:getScene():getName() .. " :update("..timeStep..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  --print(self:getScene():getName() .. " :exit()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():exit()

  for k, v in pairs(self.__nodeEntities) do
       v:getNode():getStateMachine():clear()
   end
end

function SceneEntity:onMessage(message)
  --print(self:getScene():getName() .. " :onMessage(" .. tostring(message) .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():onMessage(message)
end

function SceneEntity:touchDown(touches)
  --print(self:getScene():getName() .. " :touchDown(" .. #touches .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function SceneEntity:touchUp(touches)
  --print(self:getScene():getName() .. " :touchUp(" .. #touches .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function SceneEntity:touchMove(touches)
  --print(self:getScene():getName() .. " :touchMove("..#touches ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function SceneEntity:touchCancelled(touches)
  --print(self:getScene():getName() .. " :touchCancelled("..#touches ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

function SceneEntity:renderHUD()
  --print(self:getScene():getName() .. " :renderHUD()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function SceneEntity:pause()
  --print(self:getScene():getName() .. " :pause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function SceneEntity:unPause()
  --print(self:getScene():getName() .. " :unPause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function SceneEntity:willResignActive()
  --print(self:getScene():getName() .. " :willResignActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function SceneEntity:didBecomeActive()
  --print(self:getScene():getName() .. " :didBecomeActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function SceneEntity:didEnterBackground()
  --print(self:getScene():getName() .. " :didEnterBackground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function SceneEntity:willEnterForeground()
  --print(self:getScene():getName() .. " :willEnterForeground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function SceneEntity:willTerminate()
  --print(self:getScene():getName() .. " :willTerminate()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function SceneEntity:interrupt()
  --print(self:getScene():getName() .. " :interrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function SceneEntity:resumeInterrupt()
  --print(self:getScene():getName() .. " :resumeInterrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

function SceneEntity:receivedMemoryWarning()
  --print(self:getScene():getName() .. " :receivedMemoryWarning()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
end
--
--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SceneEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function SceneEntity:className()
  return "SceneEntity"
end

function SceneEntity:class()
  return self
end

function SceneEntity:superClass()
  return nil
end

function SceneEntity:isa(theClass)
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

function SceneEntity:__gc()
  SceneEntity._destroy(self)
end

function SceneEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntity:_destroy()
  assert(not self.__SceneEntityCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function SceneEntity:_create(init)
  self.__SceneEntityCalledLoad = false

  __ctor(self, init)
end

function SceneEntity:load()
  __load(self)

  self.__SceneEntityCalledLoad = true
end

function SceneEntity:unLoad()
  assert(self.__SceneEntityCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__SceneEntityCalledLoad = false
end

return SceneEntity
