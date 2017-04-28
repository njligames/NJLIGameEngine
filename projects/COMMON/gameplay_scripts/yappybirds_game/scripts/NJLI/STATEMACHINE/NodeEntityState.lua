local NodeEntityState = {}
NodeEntityState.__index = NodeEntityState

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
  assert(init.entityOwner, "Init variable is expecting a entityOwner")

  self._entityOwner = init.entityOwner
  self._nodeState = njli.NodeState.create()

  if init.name ~= nil then
      self:getNodeState():setName(init.name)
  else
      self:getNodeState():setName("NJLI.STATEMACHINE.NodeEntityState")
  end
  
  self._entityName = self:getNodeState():getName()

  Interface:getStateMachine():getEntityManager():addNodeEntityState(self)
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeNodeEntityState(self)

  njli.NodeState.destroy(self:getNodeState())
  self._nodeState = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--General
--#############################################################################

function NodeEntityState:getEntityName()
  return self._entityName
end

function NodeEntityState:getNodeState()
  return self._nodeState
end

function NodeEntityState:getNodeEntity()
  return self._entityOwner
end

function NodeEntityState:pushState(stateName)
  self:getNodeEntity():pushState(stateName)
end

--#############################################################################
--Statemachine code...
--#############################################################################

--function NodeEntityState:pushState(stateName)
  --self:getNodeEntity():pushState(stateName)
--end

function NodeEntityState:push()
  self:getNodeEntity():getNode():getStateMachine():pushState(self:getNodeState())
end

function NodeEntityState:isIn()
  return self:getNodeState():getName() == self:getNodeEntity():getNode():getStateMachine():getState():getName()
end

function NodeEntityState:enter()
  --print(self:getNodeState():getName() .. " :enter()")
end

function NodeEntityState:update(timeStep)
  --print(self:getNodeState():getName() .. " :update(" .. timeStep .. ")")
end

function NodeEntityState:exit()
  --print(self:getNodeState():getName() .. " :exit()")
end

function NodeEntityState:onMessage()
  --print(self:getNodeState():getName() .. " :onMessage()")
end

function NodeEntityState:rayTouchDown(rayContact)
  --print(self:getNodeState():getName() .. " :touchDown(rayContact)")
end

function NodeEntityState:rayTouchUp(rayContact)
  --print(self:getNodeState():getName() .. " :touchUp(rayContact)")
end

function NodeEntityState:rayTouchMove(rayContact)
  --print(self:getNodeState():getName() .. " :touchMove(rayContact)")
end

function NodeEntityState:rayTouchCancelled(rayContact)
  --print(self:getNodeState():getName() .. " :touchCancelled(rayContact)")
end

function NodeEntityState:rayTouchMissed(node)
  --print(self:getNodeState():getName() .. " :rayTouchMissed(node)")
end

function NodeEntityState:collide(otherNode, collisionPoint)
  --print(self:getNodeState():getName() .. " :collide(otherNode, collisionPoint)")
end

function NodeEntityState:near(otherNode)
  --print(self:getNodeState():getName() .. " :near(otherNode)")
end

function NodeEntityState:actionUpdate(action, timeStep)
  --print(self:getNodeState():getName() .. " :actionUpdate(action, timeStep)")
end

function NodeEntityState:actionComplete(action)
  --print(self:getNodeState():getName() .. " :actionComplete(action)")
end

function NodeEntityState:keyboardShow()
  --print(self:getNodeState():getName() .. " :keyboardShow()")
end

function NodeEntityState:keyboardCancel()
  --print(self:getNodeState():getName() .. " :keyboardCancel()")
end

function NodeEntityState:keyboardReturn()
  --print(self:getNodeState():getName() .. " :keyboardReturn()")
end

function NodeEntityState:renderHUD()
  --print(self:getNodeState():getName() .. " :renderHUD()")
end

function NodeEntityState:gamePause()
  --print(self:getNodeState():getName() .. " :gamePause()")
end

function NodeEntityState:gameUnPause()
  --print(self:getNodeState():getName() .. " :gameUnPause()")
end

function NodeEntityState:touchDown(touches)
  --print(self:getNodeState():getName() .. " :actionComplete()")
end

function NodeEntityState:touchUp(touches)
  --print(self:getNodeState():getName() .. " :touchUp()")
end

function NodeEntityState:touchMove(touches)
  --print(self:getNodeState():getName() .. " :touchMove()")
end

function NodeEntityState:touchCancelled(touches)
    --print(self:getNodeState():getName() .. " :touchCancelled()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(NodeEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function NodeEntityState:className()
  return "NodeEntityState"
end

function NodeEntityState:class()
  return self
end

function NodeEntityState:superClass()
  return nil
end

function NodeEntityState:isa(theClass)
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

function NodeEntityState:__gc()
  NodeEntityState._destroy(self)
end

function NodeEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntityState:_destroy()
  assert(not self.__NodeEntityStateCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function NodeEntityState:_create(init)
  self.__NodeEntityStateCalledLoad = false

  __ctor(self, init)
end

function NodeEntityState:load()
  __load(self)

  self.__NodeEntityStateCalledLoad = true
end

function NodeEntityState:unLoad()
  assert(self.__NodeEntityStateCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__NodeEntityStateCalledLoad = false
end

return NodeEntityState
