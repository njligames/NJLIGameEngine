local SceneEntityState = require "njli.statemachine.sceneentitystate"

local SettingsSceneEntityState = {}
SettingsSceneEntityState.__index = SettingsSceneEntityState

local json = require('json')

setmetatable(SettingsSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function SettingsSceneEntityState:className()
  return "SettingsSceneEntityState"
end

function SettingsSceneEntityState:class()
  return self
end

function SettingsSceneEntityState:superClass()
  return SceneEntityState
end

function SettingsSceneEntityState:isa(theClass)
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

function SettingsSceneEntityState:destroy()
  print("SettingsSceneEntityState:load()")

  SettingsSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function SettingsSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("SettingsSceneEntityState:load()")
end

function SettingsSceneEntityState:__gc()
end

function SettingsSceneEntityState:__tostring()
  return json:stringify(self)
end

function SettingsSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function SettingsSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function SettingsSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function SettingsSceneEntityState:load()
  SceneEntityState.load(self)

  print("SettingsSceneEntityState:load()")
end

function SettingsSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("SettingsSceneEntityState:load()")
end

function SettingsSceneEntityState:push()
  SceneEntityState.push(self)
end

function SettingsSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function SettingsSceneEntityState:enter()
  print("SettingsSceneEntityState:enter()")
end

function SettingsSceneEntityState:update(timeStep)
  print("SettingsSceneEntityState:update("..timeStep..")")
end

function SettingsSceneEntityState:exit()
  print("SettingsSceneEntityState:exit()")
end

function SettingsSceneEntityState:onMessage(message)
  print("SettingsSceneEntityState:onMessage("..tostring(message)..")")
end

function SettingsSceneEntityState:touchDown(touches)
  print("SettingsSceneEntityState:touchDown("..tostring(touches)..")")
end

function SettingsSceneEntityState:touchUp(touches)
  print("SettingsSceneEntityState:touchUp("..tostring(touches)..")")
end

function SettingsSceneEntityState:touchMove(touches)
  print("SettingsSceneEntityState:touchMove("..tostring(touches)..")")
end

function SettingsSceneEntityState:touchCancelled(touches)
  print("SettingsSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function SettingsSceneEntityState:renderHUD()
  print("SettingsSceneEntityState:renderHUD()")
end

function SettingsSceneEntityState:pause()
  print("SettingsSceneEntityState:pause()")
end

function SettingsSceneEntityState:unPause()
  print("SettingsSceneEntityState:unPause()")
end

return SettingsSceneEntityState

