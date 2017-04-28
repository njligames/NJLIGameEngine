local SceneEntityState = require "njli.statemachine.sceneentitystate"

local LoadingGameplaySceneEntityState = {}
LoadingGameplaySceneEntityState.__index = LoadingGameplaySceneEntityState

local json = require('json')

setmetatable(LoadingGameplaySceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function LoadingGameplaySceneEntityState:className()
  return "LoadingGameplaySceneEntityState"
end

function LoadingGameplaySceneEntityState:class()
  return self
end

function LoadingGameplaySceneEntityState:superClass()
  return SceneEntityState
end

function LoadingGameplaySceneEntityState:isa(theClass)
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

function LoadingGameplaySceneEntityState:destroy()
  print(" LoadingGameplaySceneEntityState:destroy()")

  LoadingGameplaySceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function LoadingGameplaySceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("LoadingGameplaySceneEntityState:create(init)")
end

function LoadingGameplaySceneEntityState:__gc()
end

function LoadingGameplaySceneEntityState:__tostring()
  return json:stringify(self)
end

function LoadingGameplaySceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function LoadingGameplaySceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function LoadingGameplaySceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LoadingGameplaySceneEntityState:load()
  SceneEntityState.load(self)

  print("LoadingGameplaySceneEntityState:load()")
end

function LoadingGameplaySceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("LoadingGameplaySceneEntityState:load()")
end

function LoadingGameplaySceneEntityState:push()
  SceneEntityState.push(self)
end

function LoadingGameplaySceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function LoadingGameplaySceneEntityState:enter()
  print("LoadingGameplaySceneEntityState:enter()")
  
  self._countdown = 5.0
end

function LoadingGameplaySceneEntityState:update(timeStep)
--  print("LoadingGameplaySceneEntityState:update("..timeStep..")")

  --self._countdown = self._countdown - timeStep
  
  if self._countdown <= 0 then
    self:pushState("PlayingSceneEntityState")
  end
  
  
end

function LoadingGameplaySceneEntityState:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function LoadingGameplaySceneEntityState:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage("..tostring(message)..")")
end

function LoadingGameplaySceneEntityState:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown("..tostring(touches)..")")
end

function LoadingGameplaySceneEntityState:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp("..tostring(touches)..")")
end

function LoadingGameplaySceneEntityState:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove("..tostring(touches)..")")
end

function LoadingGameplaySceneEntityState:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled("..tostring(touches)..")")
end

function LoadingGameplaySceneEntityState:renderHUD()
--  print("LoadingGameplaySceneEntityState:renderHUD()")
end

function LoadingGameplaySceneEntityState:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function LoadingGameplaySceneEntityState:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return LoadingGameplaySceneEntityState

