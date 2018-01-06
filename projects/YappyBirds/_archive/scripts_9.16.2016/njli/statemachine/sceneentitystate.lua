local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState

local json = require('json')

setmetatable(SceneEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function SceneEntityState:destroy()
  SceneEntityState.__gc(self)
end

function SceneEntityState:create(init)

  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.entityOwner, "Init variable is expecting a entityOwner value")

  self._entityOwner = init.entityOwner
  self._sceneState = njli.SceneState.create()

  self:getSceneState():setName(init.name)
end

function SceneEntityState:__gc()
  self:unLoad()
end

function SceneEntityState:__tostring()

  return json:stringify(self)
end

function SceneEntityState:getSceneState()
  return self._sceneState
end

function SceneEntityState:getEntityOwner()
  return self._entityOwner
end

function SceneEntityState:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function SceneEntityState:load()
   print("SceneEntityState:load()")

  self.loaded = true
end

function SceneEntityState:unLoad()
  if self:getSceneState() then
    njli.SceneState.destroy(self:getSceneState())
  end
  self._sceneState = nil

  self._entityOwner = nil

  self.loaded = false
  
  print("SceneEntityState:unLoad()")
end

function SceneEntityState:pushState(stateName)
  self:getEntityOwner():pushState(stateName)
end

function SceneEntityState:push()
  self:getEntityOwner():getScene():getStateMachine():pushState(self:getSceneState())
end

function SceneEntityState:isIn()
  return self:getSceneState():getName() == self:getEntityOwner():getScene():getStateMachine():getState():getName()
end

function SceneEntityState:enter() print("SceneEntityState:enter") end
function SceneEntityState:update(timeStep) print("SceneEntityState:update") end
function SceneEntityState:exit() print("SceneEntityState:exit") end
function SceneEntityState:onMessage(message) print("SceneEntityState:onMessage") end
function SceneEntityState:touchDown(touches) print("SceneEntityState:touchDown") end
function SceneEntityState:touchUp(touches) print("SceneEntityState:touchUp") end
function SceneEntityState:touchMove(touches) print("SceneEntityState:touchMove") end
function SceneEntityState:touchCancelled(touches) print("SceneEntityState:touchCancelled") end
function SceneEntityState:renderHUD() print("SceneEntityState:renderHUD") end
function SceneEntityState:pause() print("SceneEntityState:pause") end
function SceneEntityState:unPause() print("SceneEntityState:unPause") end
function SceneEntityState:willResignActive() print("SceneEntityState:willResignActive") end
function SceneEntityState:didBecomeActive() print("SceneEntityState:didBecomeActive") end
function SceneEntityState:didEnterBackground() print("SceneEntityState:didEnterBackground") end
function SceneEntityState:willEnterForeground() print("SceneEntityState:willEnterForeground") end
function SceneEntityState:willTerminate() print("SceneEntityState:willTerminate") end
function SceneEntityState:interrupt() print("SceneEntityState:interrupt") end
function SceneEntityState:resumeInterrupt() print("SceneEntityState:resumeInterrupt") end
function SceneEntityState:receivedMemoryWarning() print("SceneEntityState:receivedMemoryWarning") end

return SceneEntityState
