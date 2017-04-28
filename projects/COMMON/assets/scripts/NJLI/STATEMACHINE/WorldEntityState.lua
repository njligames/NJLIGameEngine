local WorldEntityState = {}
WorldEntityState.__index = WorldEntityState

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
  assert(type(init) == "table", "init variable is expecting a table")
  assert(init.entityOwner ~= nil, "The init.entityOwner is nil for " .. self:className())
  assert(init.scene, "init.scene variable is nil.")
  assert(type(init.scene) == "table", "init.scene variable is expecting a table")

  self._entityOwner = init.entityOwner

  self._worldState = njli.WorldState.create()
  if init.name ~= nil then
      self:getWorldState():setName(init.name)
  else
      self:getWorldState():setName("NJLI.STATEMACHINE.WorldEntityState")
  end
  
  self._entityName = self:getWorldState():getName()

  assert(init.scene.class ~= nil, "The init.scene.class is nil for the world entity state: " .. self:className())

  assert(init.scene.states ~= nil, "The init.scene.states is nil for the world entity state: " .. self:className())
  assert(type(init.scene.states) == "table", "init.scene.states variable is expecting a states table")

  assert(init.scene.nodes ~= nil, "The init.scene.nodes is nil for the world entity state: " .. self:className())
  assert(type(init.scene.nodes) == "table", "init.scene.nodes variable is expecting a states table")

  -- Create the Entity
  self._sceneEntity = init.scene.class({
      name = init.scene.name,
      states = init.scene.states,
      entityOwner = self,
      nodes = init.scene.nodes,
    })

  Interface:getStateMachine():getEntityManager():addWorldEntityState(self)
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeWorldEntityState(self)

  self._sceneEntity = nil

  njli.WorldState.destroy(self:getWorldState())
  self._worldState = nil

  self._entityOwner = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function WorldEntityState:getEntityName()
  return self._entityName
end

function WorldEntityState:getWorldState()
  return self._worldState
end

function WorldEntityState:getWorldEntity()
  return self._entityOwner
end

function WorldEntityState:getSceneEntity()
  return self._sceneEntity
end

--#############################################################################
--Statemachine code...
--#############################################################################

function WorldEntityState:pushState(stateName)
  self:getWorldEntity():pushState(stateName)
end

function WorldEntityState:push()
  self:getWorldEntity():getWorld():getStateMachine():pushState(self:getWorldState())
end

function WorldEntityState:isIn()
  return self:getWorldState():getName() == self:getWorldEntity():getWorld():getStateMachine():getState():getName()
end

function WorldEntityState:enter()
  --print(self:getWorldState():getName() .. " :enter()")

  self:getSceneEntity():startStateMachine()
end

function WorldEntityState:update(timeStep)
  --print(self:getWorldState():getName() .. " :update(" .. timeStep .. ")")
end

function WorldEntityState:exit()
  --print(self:getWorldState():getName() .. " :exit()")

end

function WorldEntityState:onMessage(message)
  --print(self:getWorldState():getName() .. " :onMessage(message)")
end

function WorldEntityState:renderHUD()
  --print(self:getWorldState():getName() .. " :renderHUD()")
end

function WorldEntityState:touchDown(touches)
  --print(self:getWorldState():getName() .. " :touchDown(" .. #touches .. ")")
end

function WorldEntityState:touchUp(touches)
  --print(self:getWorldState():getName() .. " :touchUp(" .. #touches .. ")")
end

function WorldEntityState:touchMove(touches)
  --print(self:getWorldState():getName() .. " :touchMove(" .. #touches .. ")")
end

function WorldEntityState:touchCancelled(touches)
  --print(self:getWorldState():getName() .. " :touchCancelled(" .. #touches .. ")")
end

function WorldEntityState:pause()
  --print(self:getWorldState():getName() .. " :pause()")
end

function WorldEntityState:unPause()
  --print(self:getWorldState():getName() .. " :unPause()")
end

function WorldEntityState:keyboardShow()
  --print(self:getWorldState():getName() .. " :keyboardShow()")
end

function WorldEntityState:keyboardCancel()
  --print(self:getWorldState():getName() .. " :keyboardCancel()")
end

function WorldEntityState:keyboardReturn(text)
  --print(self:getWorldState():getName() .. " :keyboardReturn(" .. text .. ")")
end

function WorldEntityState:willResignActive()
  --print(self:getWorldState():getName() .. " :willResignActive()")
end

function WorldEntityState:didBecomeActive()
  --print(self:getWorldState():getName() .. " :didBecomeActive()")
end

function WorldEntityState:didEnterBackground()
  --print(self:getWorldState():getName() .. " :didEnterBackground()")
end

function WorldEntityState:willEnterForeground()
  --print(self:getWorldState():getName() .. " :willEnterForeground()")
end

function WorldEntityState:willTerminate()
  --print(self:getWorldState():getName() .. " :willTerminate()")
end

function WorldEntityState:interrupt()
  --print(self:getWorldState():getName() .. " :interrupt()")
end

function WorldEntityState:resumeInterrupt()
  --print(self:getWorldState():getName() .. " :resumeInterrupt()")
end

function WorldEntityState:receivedMemoryWarning()
  --print(self:getWorldState():getName() .. " :receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(WorldEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function WorldEntityState:className()
  return "WorldEntityState"
end

function WorldEntityState:class()
  return self
end

function WorldEntityState:superClass()
  return nil
end

function WorldEntityState:isa(theClass)
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

function WorldEntityState:__gc()
  WorldEntityState._destroy(self)
end

function WorldEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntityState:_destroy()
  assert(not self.__WorldEntityStateCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function WorldEntityState:_create(init)
  self.__WorldEntityStateCalledLoad = false

  __ctor(self, init)
end

function WorldEntityState:load()
  __load(self)

  self.__WorldEntityStateCalledLoad = true
end

function WorldEntityState:unLoad()
  assert(self.__WorldEntityStateCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__WorldEntityStateCalledLoad = false
end

return WorldEntityState
