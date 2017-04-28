local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState

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
    assert(init.entityOwner, "Init variable is expecting a entityOwner value")
    assert(init.nodes, "init.nodes variable is nil.")
    assert(type(init.nodes) == "table", "init.nodes variable is expecting a table")

    self._entityOwner = init.entityOwner

    self._sceneState = njli.SceneState.create()
    if init.name ~= nil then
        self:getSceneState():setName(init.name)
    else
        self:getSceneState():setName("NJLI.STATEMACHINE.SceneEntityState")
    end
    
    self._entityName = self:getSceneState():getName()

    --Create the NodeEntities for this SceneEntityState
    self:getSceneEntity():addNodeEntities(init.nodes, self)

    self._nodes = init.nodes

    Interface:getStateMachine():getEntityManager():addSceneEntityState(self)
end

local __dtor = function(self)
  Interface:getStateMachine():getEntityManager():removeSceneEntityState(self)

    for k, v in pairs(self._nodes) do
        self:getSceneEntity():removeNodeEntity(k)
    end

    self._nodes = nil

    njli.SceneState.destroy(self:getSceneState())
    self._sceneState = nil
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

function SceneEntityState:getEntityName()
  return self._entityName
end

function SceneEntityState:getSceneState()
  return self._sceneState
end

function SceneEntityState:getSceneEntity()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function SceneEntityState:pushState(stateName)
  self:getSceneEntity():pushState(stateName)
end

function SceneEntityState:push()
    --njli.World.getInstance():setScene(self:getSceneEntity():getScene())
  self:getSceneEntity():getScene():getStateMachine():pushState(self:getSceneState())
  
end

function SceneEntityState:isIn()
  return self:getSceneState():getName() == self:getSceneEntity():getScene():getStateMachine():getState():getName()
end

function SceneEntityState:enter()
  --print(self:getSceneState():getName() .. " :enter()")

  self:getSceneEntity():startNodeEntities()
end

function SceneEntityState:update(timeStep)
  --print(self:getSceneState():getName() .. " :update(timeStep)")
end

function SceneEntityState:exit()
  --print(self:getSceneState():getName() .. " :exit()")
end

function SceneEntityState:onMessage(message)
  --print(self:getSceneState():getName() .. " :onMessage(message)")
end

function SceneEntityState:renderHUD()
  --print(self:getSceneState():getName() .. " :renderHUD()")
end

function SceneEntityState:touchDown(touches)
  --print(self:getSceneState():getName() .. " :touchDown(" .. #touches .. ")")
end

function SceneEntityState:touchUp(touches)
  --print(self:getSceneState():getName() .. " :touchUp(" .. #touches .. ")")
end

function SceneEntityState:touchMove(touches)
  --print(self:getSceneState():getName() .. " :touchMove(" .. #touches .. ")")
end

function SceneEntityState:touchCancelled(touches)
  --print(self:getSceneState():getName() .. " :touchCancelled(" .. #touches .. ")")
end

function SceneEntityState:pause()
  --print(self:getSceneState():getName() .. " :pause()")
end

function SceneEntityState:unPause()
  --print(self:getSceneState():getName() .. " :unPause()")
end

function SceneEntityState:keyboardShow()
  --print(self:getSceneState():getName() .. " :keyboardShow()")
end

function SceneEntityState:keyboardCancel()
  --print(self:getSceneState():getName() .. " :keyboardCancel()")
end

function SceneEntityState:keyboardReturn(text)
  --print(self:getSceneState():getName() .. " :keyboardReturn(text)")
end

function SceneEntityState:willResignActive()
  --print(self:getSceneState():getName() .. " :willResignActive()")
end

function SceneEntityState:didBecomeActive()
  --print(self:getSceneState():getName() .. " :didBecomeActive()")
end

function SceneEntityState:didEnterBackground()
  --print(self:getSceneState():getName() .. " :didEnterBackground()")
end

function SceneEntityState:willEnterForeground()
  --print(self:getSceneState():getName() .. " :willEnterForeground()")
end

function SceneEntityState:willTerminate()
  --print(self:getSceneState():getName() .. " :willTerminate()")
end

function SceneEntityState:interrupt()
  --print(self:getSceneState():getName() .. " :interrupt()")
end

function SceneEntityState:resumeInterrupt()
  --print(self:getSceneState():getName() .. " :resumeInterrupt()")
end

function SceneEntityState:receivedMemoryWarning()
  --print(self:getSceneState():getName() .. " :receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SceneEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function SceneEntityState:className()
  return "SceneEntityState"
end

function SceneEntityState:class()
  return self
end

function SceneEntityState:superClass()
  return nil
end

function SceneEntityState:isa(theClass)
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

function SceneEntityState:__gc()
  SceneEntityState._destroy(self)
end

function SceneEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntityState:_destroy()
  assert(not self.__SceneEntityStateCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function SceneEntityState:_create(init)
  self.__SceneEntityStateCalledLoad = false

  __ctor(self, init)
end

function SceneEntityState:load()
  __load(self)

  self.__SceneEntityStateCalledLoad = true
end

function SceneEntityState:unLoad()
  assert(self.__SceneEntityStateCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__SceneEntityStateCalledLoad = false
end

return SceneEntityState
