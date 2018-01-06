local SceneEntity = {}
SceneEntity.__index = SceneEntity

local json = require('json')

setmetatable(SceneEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function SceneEntity:destroy()
  SceneEntity.__gc(self)
end

function SceneEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value when creating " .. self:className())
  assert(init.states, "Init variable is expecting a states table when creating " .. self:className())
  assert(type(init.states) == "table", "Init variable is expecting a states table when creating " .. self:className())
  assert(init.startStateName, "Init variable is expecting a startStateName value when creating " .. self:className())

  self._startStateName = init.startStateName

  self._scene = njli.Scene.create()

  self:getScene():setName(init.name)

  self._stateEntityTable = {}
  if init then
    for k,v in pairs(init.states) do
      self:_addEntityState(v.name, v.module)
    end
  end

end

function SceneEntity:__gc()
  if self:getScene() then
    njli.Scene.destroy(self:getScene())
    self._scene = nil
  end
end

function SceneEntity:__tostring()

  return json:stringify(self)
  
end

function SceneEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function SceneEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function SceneEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function SceneEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function SceneEntity:hasState()
  return self:getScene():getStateMachine():getState() ~= nil
end

function SceneEntity:getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getScene():getStateMachine():getState():getName())
end

function SceneEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function SceneEntity:getStartSceneName()
  return self._startStateName
end

function SceneEntity:getScene()
  return self._scene
end

function SceneEntity:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function SceneEntity:load()
  print("SceneEntity:load()")

  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
  self.loaded = true
end

function SceneEntity:unLoad()

  

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
  
  print("SceneEntity:unLoad()")
end

function SceneEntity:startStateMachine()
  print("SceneEntity:startStateMachine()")

  if self:_getEntityState(self:getStartSceneName()) then

    njli.World.getInstance():addScene(self:getScene())
    self:_getEntityState(self:getStartSceneName()):push()

  else
    error(self:getStartSceneName() .. " is not found.")
  end
end

function SceneEntity:enter()
  print("SceneEntity:enter()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
--  print("SceneEntity:update("..timeStep..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  print("SceneEntity:exit()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():exit()
end

function SceneEntity:onMessage(message)
  print("SceneEntity:onMessage("..tostring(message)")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():onMessage(touches)
end

function SceneEntity:touchDown(touches)
--  print("SceneEntity:touchDown("..tostring(touches) .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():touchDown(touches)
end

function SceneEntity:touchUp(touches)
--  print("SceneEntity:touchUp("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():touchUp(touches)
end

function SceneEntity:touchMove(touches)
--  print("SceneEntity:touchMove("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():touchMove(touches)
end

function SceneEntity:touchCancelled(touches)
--  print("SceneEntity:touchCancelled("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():touchCancelled(touches)
end

function SceneEntity:renderHUD()
--  print("SceneEntity:renderHUD()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():renderHUD()
end

function SceneEntity:pause()
  print("SceneEntity:pause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():pause()
end

function SceneEntity:unPause()
  print("SceneEntity:unPause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():unPause()
end

function SceneEntity:willResignActive()
--  print("SceneEntity:willResignActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():willResignActive()
end

function SceneEntity:didBecomeActive()
--  print("SceneEntity:didBecomeActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():didBecomeActive()
end

function SceneEntity:didEnterBackground()
--  print("SceneEntity:didEnterBackground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():didEnterBackground()
end

function SceneEntity:willEnterForeground()
--  print("SceneEntity:willEnterForeground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():willEnterForeground()
end

function SceneEntity:willTerminate()
--  print("SceneEntity:willTerminate()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():willTerminate()
end

function SceneEntity:interrupt()
--  print("SceneEntity:interrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():interrupt()
end

function SceneEntity:resumeInterrupt()
--  print("SceneEntity:resumeInterrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():resumeInterrupt()
end

function SceneEntity:receivedMemoryWarning()
--  print("SceneEntity:receivedMemoryWarning()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:getCurrentEntityState():receivedMemoryWarning()
end

return SceneEntity
