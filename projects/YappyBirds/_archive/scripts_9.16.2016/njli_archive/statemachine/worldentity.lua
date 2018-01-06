local WorldEntity = {}
WorldEntity.__index = WorldEntity

local json = require('json')

setmetatable(WorldEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function WorldEntity:destroy()
  WorldEntity.__gc(self)
end

function WorldEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")
  assert(init.startStateName, "Init variable is expecting a startStateName value")
  assert(init.gameInstance, "Init variable is expecting a gameInstance value")

  self._gameInstance = init.gameInstance
  self._startStateName = init.startStateName

  self._world = njli.World.getInstance()

  self:getWorld():setName(init.name)

  self._stateEntityTable = {}
  if init then
    for k,v in pairs(init.states) do
      self:_addEntityState(v.name, v.module)
    end
  end

end

function WorldEntity:__gc()
  self:unLoad()
end

function WorldEntity:__tostring()

  return json:stringify(self)
end

function WorldEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function WorldEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function WorldEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: \"" .. stateName .. "\"")

  return self._stateEntityTable[stateName]
end

function WorldEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function WorldEntity:_hasState()
  return self:getWorld():getStateMachine():getState() ~= nil
end

function WorldEntity:_getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "message")
  assert(self:getWorld():getStateMachine():getState(), "There is no current World State")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

function WorldEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function WorldEntity:getStartStateName()
  return self._startStateName
end

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:getGameInstance()
  return self._gameInstance
end

function WorldEntity:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function WorldEntity:load()
  print("WorldEntity:load()")
  
  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
  self.loaded = true
end

function WorldEntity:unLoad()
  self._world = nil

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
  
  print("WorldEntity:unLoad()")
end

function WorldEntity:startStateMachine()
  print("WorldEntity:startStateMachine()")
  if self:_getEntityState(self:getStartStateName()) then
    self:_getEntityState(self:getStartStateName()):push()
  else
    error("self:getStartStateName() is not found.")
  end
end

function WorldEntity:enter()
  print("WorldEntity:enter()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function WorldEntity:update(timeStep)
--  print("WorldEntity:update("..timeStep..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  if self:_hasState() then
    if not self:_getCurrentEntityState():getSceneEntity():_hasState() then
      self:_getCurrentEntityState():getSceneEntity():startStateMachine()
    end
  end
  self:_getCurrentEntityState():update(timeStep)
end

function WorldEntity:exit()
  print("WorldEntity:exit()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function WorldEntity:onMessage(message)
  print("WorldEntity:onMessage("..tostring(message)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():onMessage(message)
end

function WorldEntity:touchDown(touches)
--  print("WorldEntity:touchDown("..tostring(touches)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function WorldEntity:touchUp(touches)
--  print("WorldEntity:touchUp("..tostring(touches)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function WorldEntity:touchMove(touches)
--  print("WorldEntity:touchMove("..tostring(touches)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function WorldEntity:touchCancelled(touches)
--  print("WorldEntity:touchCancelled("..tostring(touches)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

function WorldEntity:renderHUD()
--  print("WorldEntity:renderHUD()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function WorldEntity:keyboardShow()
--  print("WorldEntity:keyboardShow()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardShow()
end

function WorldEntity:keyboardCancel()
  print("WorldEntity:keyboardCancel()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardCancel()
end

function WorldEntity:keyboardReturn(text)
--  print("WorldEntity:keyboardReturn("..tostring(text)..")")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardReturn(text)
end

function WorldEntity:receivedMemoryWarning()
  print("WorldEntity:receivedMemoryWarning()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
end

function WorldEntity:pause()
  print("WorldEntity:pause()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function WorldEntity:unPause()
  print("WorldEntity:unPause()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function WorldEntity:willResignActive()
--  print("WorldEntity:willResignActive()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function WorldEntity:didBecomeActive()
--  print("WorldEntity:didBecomeActive()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function WorldEntity:didEnterBackground()
--  print("WorldEntity:didEnterBackground()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function WorldEntity:willEnterForeground()
--  print("WorldEntity:willEnterForeground()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function WorldEntity:willTerminate()
--  print("WorldEntity:willTerminate()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function WorldEntity:interrupt()
--  print("WorldEntity:interrupt()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function WorldEntity:resumeInterrupt()
--  print("WorldEntity:resumeInterrupt()")
  assert(self:_hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

return WorldEntity
