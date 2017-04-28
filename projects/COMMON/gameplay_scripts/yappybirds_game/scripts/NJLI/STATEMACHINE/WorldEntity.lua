local WorldEntity = {}
WorldEntity.__index = WorldEntity

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
  assert(nil ~= init.states, "init.states variable is nil.")
  assert(type(init.states) == "table", "not a table")
  assert(nil ~= init.entityOwner, "entityOwner variable is nil.")

  self._entityOwner = init.entityOwner

  self._world = njli.World.getInstance()
  if init.name ~= nil then
      self:getWorld():setName(init.name)
  else
      self:getWorld():setName("NJLI.STATEMACHINE.WorldEntity")
  end
  
  self._entityName = self:getWorld():getName()

  local startState = nil

  self._stateEntityTable = {}
  self._localStateEntityTable = {}
  
  for k,v in pairs(init.states) do
    assert(v.class ~= nil, "")
    assert(v.scene ~= nil, "is nil")
    assert(type(v.scene) == "table", "not a table")

    --Create a WorldEntityState...
    local stateEntity = v.class({
        name = v.name,
        entityOwner = self,
        scene = v.scene
      })
    
    local key = stateEntity:getEntityName()
    assert(self._localStateEntityTable[key] == nil, "Cannot have duplicate stateEntity names.")
    self._localStateEntityTable[key] = stateEntity

    if startState == nil then
      startState = stateEntity
    end

    self:__addEntityState(stateEntity)
  end

  assert(startState, "No start state was defined for " .. self:getWorld():getName())

  Interface:getStateMachine():getEntityManager():addWorldEntity(self)

  self._startStateName = startState:getWorldState():getName()
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeWorldEntity(self)

  self._localStateEntityTable = nil
  self._stateEntityTable = nil

  self._world = nil
end

local __load = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getWorldState():getName()):load()
    end
end

local __unLoad = function(self)
    for index,value in ipairs(self._stateEntityTable) do 
        self:__getEntityState(value:getWorldState():getName()):unLoad()
    end
end

--#############################################################################
--Private
--#############################################################################

function WorldEntity:__addEntityState(entityState)
    table.insert(self._stateEntityTable, entityState)
end

function WorldEntity:__removeEntityState(stateName)
    local has, index, entityState = self:hasEntityState(stateName)
    if has then
        self._localStateEntityTable[entityState:getEntityName()] = nil
        table.remove(self._stateEntityTable, index)
    end
end

function WorldEntity:__getEntityState(stateName)
  local nodeEntityState = self._localStateEntityTable[stateName]
  
  if nil == nodeEntityState then
    return Interface:getStateMachine():getEntityManager():getWorldEntityState(stateName)
  end
  
  return nodeEntityState
end

function WorldEntity:_getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "There is no state machine")
  assert(self:getWorld():getStateMachine():getState(), "There is no current World State")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:__getEntityState(self:getWorld():getStateMachine():getState():getName())
end

--#############################################################################
--General
--#############################################################################

function WorldEntity:getEntityName()
  return self._entityName
end

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:hasEntityState(stateName)
    for index,value in ipairs(self._stateEntityTable) do 
        if stateName == value:getWorldState():getName() then
            return true, index, value
        end
    end
    return false
end

function WorldEntity:hasState()
  return self:getWorld():getStateMachine():getState() ~= nil
end

function WorldEntity:getGameEntity()
  return self._entityOwner
end

function WorldEntity:getScene()
    return self:_getCurrentEntityState():getSceneEntity():getScene()
end


--#############################################################################
--Statemachine code...
--#############################################################################

function WorldEntity:pushState(stateName)
  self:__getEntityState(stateName):push()
end

function WorldEntity:getStartStateEntity()
  return self:__getEntityState(self._startStateName)
end

function WorldEntity:startStateMachine()
  --print(self:getWorld():getName() .. " :startStateMachine()")

  self:pushState(self._startStateName)
end

function WorldEntity:enter()
  --print(self:getWorld():getName() .. " :enter()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function WorldEntity:update(timeStep)
  --print(self:getWorld():getName() .. " :update(" .. timeStep .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function WorldEntity:exit()
  --print(self:getWorld():getName() .. " :exit()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function WorldEntity:onMessage()
  --print(self:getWorld():getName() .. " :onMessage()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():onMessage()
end

function WorldEntity:renderHUD()
  --print(self:getWorld():getName() .. " :renderHUD()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function WorldEntity:touchDown(touches)
  --print(self:getWorld():getName() .. " :touchDown(" .. #touches .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function WorldEntity:touchUp(touches)
  --print(self:getWorld():getName() .. " :touchUp(" .. #touches .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function WorldEntity:touchMove(touches)
  --print(self:getWorld():getName() .. " :touchMove(" .. #touches .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function WorldEntity:touchCancelled(touches)
  --print(self:getWorld():getName() .. " :touchCancelled(" .. #touches .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

function WorldEntity:pause()
  --print(self:getWorld():getName() .. " :pause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function WorldEntity:unPause()
  --print(self:getWorld():getName() .. " :unPause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function WorldEntity:keyboardShow()
  --print(self:getWorld():getName() .. " :keyboardShow()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardShow()
end

function WorldEntity:keyboardCancel()
  --print(self:getWorld():getName() .. " :keyboardCancel()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardCancel()
end

function WorldEntity:keyboardReturn(text)
  --print(self:getWorld():getName() .. " :keyboardReturn(" .. text .. ")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardReturn(text)
end

function WorldEntity:willResignActive()
  --print(self:getWorld():getName() .. " :willResignActive()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function WorldEntity:didBecomeActive()
  --print(self:getWorld():getName() .. " :didBecomeActive()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function WorldEntity:didEnterBackground()
  --print(self:getWorld():getName() .. " :didEnterBackground()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function WorldEntity:willEnterForeground()
  --print(self:getWorld():getName() .. " :willEnterForeground()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function WorldEntity:willTerminate()
  --print(self:getWorld():getName() .. " :willTerminate()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function WorldEntity:interrupt()
  --print(self:getWorld():getName() .. " :interrupt()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function WorldEntity:resumeInterrupt()
  --print(self:getWorld():getName() .. " :resumeInterrupt()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

function WorldEntity:receivedMemoryWarning()
  --print(self:getWorld():getName() .. " :receivedMemoryWarning()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
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
