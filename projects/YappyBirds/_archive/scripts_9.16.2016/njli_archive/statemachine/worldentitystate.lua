local WorldEntityState = {}
WorldEntityState.__index = WorldEntityState

local json = require('json')

setmetatable(WorldEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function WorldEntityState:destroy()
  WorldEntityState.__gc(self)
end

function WorldEntityState:create(init)

  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.entityOwner, "Init variable is expecting a entityOwner value")

  self._entityOwner = init.entityOwner

  self._worldState = njli.WorldState.create()
  self:getWorldState():setName(init.name)
end

function WorldEntityState:__gc()
  self:unLoad()
end

function WorldEntityState:__tostring()

  return json:stringify(self)
end

function WorldEntityState:getWorldState()
  return self._worldState
end

function WorldEntityState:getEntityOwner()
  return self._entityOwner
end

function WorldEntityState:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function WorldEntityState:load()
   print("WorldEntityState:load()")
   
  self.loaded = true
end

function WorldEntityState:unLoad()
  if self:getWorldState() then
    njli.WorldState.destroy(self:getWorldState())
  end
  self._worldState = nil

  self._entityOwner = nil

  self.loaded = false
  
  print("WorldEntityState:unLoad()")
end

function WorldEntityState:pushState(stateName)
  self:getEntityOwner():pushState(stateName)
end

function WorldEntityState:push()
  self:getEntityOwner():getWorld():getStateMachine():pushState(self:getWorldState())
end

function WorldEntityState:isIn()
  return self:getWorldState():getName() == self:getEntityOwner():getWorld():getStateMachine():getState():getName()
end

function WorldEntityState:getSceneEntity()
  return self._sceneEntity
end

function WorldEntityState:setSceneEntity(sceneEntity)
  self._sceneEntity = sceneEntity
end

function WorldEntityState:enter() print("WorldEntityState:enter") end
function WorldEntityState:update(timeStep) print("WorldEntityState:update") end
function WorldEntityState:exit() print("WorldEntityState:exit") end
function WorldEntityState:onMessage(message) print("WorldEntityState:onMessage") end
function WorldEntityState:touchDown(touches) print("WorldEntityState:touchDown") end
function WorldEntityState:touchUp(touches) print("WorldEntityState:touchUp") end
function WorldEntityState:touchMove(touches) print("WorldEntityState:touchMove") end
function WorldEntityState:touchCancelled(touches) print("WorldEntityState:touchCancelled") end
function WorldEntityState:renderHUD() print("WorldEntityState:renderHUD") end
function WorldEntityState:keyboardShow() print("WorldEntityState:keyboardShow") end
function WorldEntityState:keyboardCancel() print("WorldEntityState:keyboardCancel") end
function WorldEntityState:keyboardReturn(text) print("WorldEntityState:keyboardReturn") end
function WorldEntityState:receivedMemoryWarning() print("WorldEntityState:receivedMemoryWarning") end
function WorldEntityState:pause() print("WorldEntityState:pause") end
function WorldEntityState:unPause() print("WorldEntityState:unPause") end

function WorldEntityState:willResignActive() print("WorldEntityState:willResignActive") end
function WorldEntityState:didBecomeActive() print("WorldEntityState:didBecomeActive") end
function WorldEntityState:didEnterBackground() print("WorldEntityState:didEnterBackground") end
function WorldEntityState:willEnterForeground() print("WorldEntityState:willEnterForeground") end
function WorldEntityState:willTerminate() print("WorldEntityState:willTerminate") end
function WorldEntityState:interrupt() print("WorldEntityState:interrupt") end
function WorldEntityState:resumeInterrupt() print("WorldEntityState:resumeInterrupt") end

return WorldEntityState
