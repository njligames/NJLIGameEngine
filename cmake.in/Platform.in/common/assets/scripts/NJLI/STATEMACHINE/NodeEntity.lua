local NodeEntity = {}
NodeEntity.__index = NodeEntity

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
  assert(type(init) == "table", "Init variable is expecting a states table")
  assert(init.entityOwner ~= nil, "init.entityOwner is nil")
  assert(init.states ~= nil, "init.states variable is nil")
  assert(type(init.states) == "table", "init.states variable is expecting a states table")

  self._node = njli.Node.create()
  if init.name ~= nil then
      self:getNode():setName(init.name)
  else
      self:getNode():setName("NJLI.STATEMACHINE.NodeEntity")
  end
  self._entityName = self:getNode():getName()

  local startState = nil

  self._stateEntityTable = {}
  self._localStateEntityTable = {}

  for k,v in pairs(init.states) do

    --create a NodeEntityState
    local stateEntity = v.class({
        name = v.name,
        entityOwner = self
    })
  
    local key = stateEntity:getEntityName()
    assert(self._localStateEntityTable[key] == nil, "Cannot have duplicate stateEntity names.")
    self._localStateEntityTable[key] = stateEntity

    if nil == startState then
      startState = stateEntity
    end

    self:__addEntityState(stateEntity)
  end

  self._entityOwner = init.entityOwner

  assert(startState, "No start state was defined for " .. self:getNode():getName())

  Interface:getStateMachine():getEntityManager():addNodeEntity(self)

  self._startStateName = startState:getNodeState():getName()
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeNodeEntity(self)

  self._localStateEntityTable = nil
  self._stateEntityTable = nil

  njli.Node.destroy(self:getNode())
  self._node = nil

end

local __load = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getNode():getName()):load()
    end
end

local __unLoad = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getNode():getName()):unLoad()
    end
end

--#############################################################################
--Private
--#############################################################################

function NodeEntity:__addEntityState(entityState)
    table.insert(self._stateEntityTable, entityState)
end

function NodeEntity:__removeEntityState(stateName)
    local has, index, entityState = self:hasEntityState(stateName)
    if has then
      self._localStateEntityTable[entityState:getEntityName()] = nil
      table.remove(self._stateEntityTable, index)
    end
end

function NodeEntity:__getEntityState(stateName)
  local nodeEntityState = self._localStateEntityTable[stateName]
  
  if nil == nodeEntityState then
    return Interface:getStateMachine():getEntityManager():getNodeEntityState(stateName)
  end
  
  return nodeEntityState
end

function NodeEntity:_getCurrentEntityState()
  assert(self:getNode():getStateMachine(), "message")
  assert(self:getNode():getStateMachine():getState(), "message")
  assert(self:getNode():getStateMachine():getState():getName(), "message")

  return self:__getEntityState(self:getNode():getStateMachine():getState():getName())
end

--#############################################################################
--General
--#############################################################################

function NodeEntity:getEntityName()
  return self._entityName
end

function NodeEntity:getNode()
  return self._node
end

function NodeEntity:hasEntityState(stateName)
    for index,value in ipairs(self._stateEntityTable) do 
        if stateName == value:getNodeState():getName() then
            return true, index, value
        end
    end
    return false
end

function NodeEntity:hasState()
  return self:getNode():getStateMachine():getState() ~= nil
end

function NodeEntity:getOwner()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function NodeEntity:pushState(stateName)
  self:__getEntityState(stateName):push()
end

function NodeEntity:getStartStateEntity()
  return self:__getEntityState(self._startStateName)
end

function NodeEntity:startStateMachine()
  --print(self:getNode():getName() .. " :startStateMachine()")

  self:pushState(self._startStateName)
end

function NodeEntity:enter()
  --print(self:getNode():getName() .. " :enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:update(timeStep)
  --print(self:getNode():getName() .. " :update(" .. timeStep .. ")")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function NodeEntity:exit()
  --print(self:getNode():getName() .. " :exit()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function NodeEntity:onMessage()
  --print(self:getNode():getName() .. " :onMessage()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():onMessage()
end

function NodeEntity:rayTouchDown(rayContact)
  --print(self:getNode():getName() .. " :rayTouchDown()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchDown(rayContact)
end

function NodeEntity:rayTouchUp(rayContact)
  --print(self:getNode():getName() .. " :rayTouchUp()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchUp(rayContact)
end

function NodeEntity:rayTouchMove(rayContact)
  --print(self:getNode():getName() .. " :rayTouchMove()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchMove(rayContact)
end

function NodeEntity:rayTouchCancelled(rayContact)
  --print(self:getNode():getName() .. " :rayTouchCancelled()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchMove(rayContact)
end

function NodeEntity:rayTouchMissed(node)
  --print(self:getNode():getName() .. " :rayTouchMissed()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchMissed(node)
end

function NodeEntity:collide(otherNode, collisionPoint)
  --print(self:getNode():getName() .. " :collide()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():rayTouchMovecollide(otherNode, collisionPoint)
end

function NodeEntity:near(otherNode)
  --print(self:getNode():getName() .. " :near()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():otherNode(otherNode)
end

function NodeEntity:actionUpdate(action, timeStep)
  --print(self:getNode():getName() .. " :actionUpdate()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():actionUpdate(action, timeStep)
end

function NodeEntity:actionComplete(action)
  --print(self:getNode():getName() .. " :actionComplete()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():actionComplete(action)
end

function NodeEntity:keyboardShow()
  --print(self:getNode():getName() .. " :keyboardShow()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():keyboardShow()
end

function NodeEntity:keyboardCancel()
  --print(self:getNode():getName() .. " :keyboardCancel()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():keyboardCancel()
end

function NodeEntity:keyboardReturn()
  --print(self:getNode():getName() .. " :keyboardReturn()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():keyboardReturn()
end

function NodeEntity:renderHUD()
  --print(self:getNode():getName() .. " :renderHUD()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function NodeEntity:gamePause()
  --print(self:getNode():getName() .. " :gamePause()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():gamePause()
end

function NodeEntity:gameUnPause()
  --print(self:getNode():getName() .. " :gameUnPause()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():actionComplete()
end

function NodeEntity:touchDown(touches)
  --print(self:getNode():getName() .. " :actionComplete()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function NodeEntity:touchUp(touches)
  --print(self:getNode():getName() .. " :touchUp()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function NodeEntity:touchMove(touches)
  --print(self:getNode():getName() .. " :touchMove()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function NodeEntity:touchCancelled(touches)
    --print(self:getNode():getName() .. " :touchCancelled()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(NodeEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
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

function NodeEntity:__gc()
  NodeEntity._destroy(self)
end

function NodeEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntity:_destroy()
  assert(not self.__NodeEntityCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function NodeEntity:_create(init)
  self.__NodeEntityCalledLoad = false

  __ctor(self, init)
end

function NodeEntity:load()
  __load(self)

  self.__NodeEntityCalledLoad = true
end

function NodeEntity:unLoad()
  assert(self.__NodeEntityCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__NodeEntityCalledLoad = false
end

return NodeEntity
