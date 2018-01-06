local SceneEntity = require "njli.statemachine.sceneentity"

local GameplaySceneEntity = {}
GameplaySceneEntity.__index = GameplaySceneEntity

local json = require('json')

setmetatable(GameplaySceneEntity, {
    __index = SceneEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function GameplaySceneEntity:className()
  return "GameplaySceneEntity"
end

function GameplaySceneEntity:class()
  return self
end

function GameplaySceneEntity:superClass()
  return SceneEntity
end

function GameplaySceneEntity:isa(theClass)
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

function GameplaySceneEntity:destroy()
  print(" GameplaySceneEntity:destroy()")

  GameplaySceneEntity.__gc(self)
  SceneEntity.destroy(self)
end

function GameplaySceneEntity:create(init)
  
  local sceneEntityInit =
  {
    name = init.name,
    states =
    {
      {
        name = "LoadingGameplaySceneEntityState",
        module = require "yappybirds.scenes.GameplayScene.states.LoadingGameplaySceneEntityState"
      },
      {
        name = "LoseSceneEntityState",
        module = require "yappybirds.scenes.GameplayScene.states.LoseSceneEntityState"
      },
      {
        name = "PauseSceneEntityState",
        module = require "yappybirds.scenes.GameplayScene.states.PauseSceneEntityState"
      },
      {
        name = "PlayingSceneEntityState",
        module = require "yappybirds.scenes.GameplayScene.states.PlayingSceneEntityState"
      },
      {
        name = "WinSceneEntityState",
        module = require "yappybirds.scenes.GameplayScene.states.WinSceneEntityState"
      },
    },

    startStateName = "LoadingGameplaySceneEntityState",
    gameInstance = init.gameInstance
  }
  
  SceneEntity.create(self, sceneEntityInit)

  print(" GameplaySceneEntity:create(init)")
end

function GameplaySceneEntity:__gc()
end

function GameplaySceneEntity:__tostring()
  return json:stringify(self)
end

function GameplaySceneEntity:hasState()
  return SceneEntity.hasState(self)
end

function GameplaySceneEntity:getCurrentEntityState()
  return SceneEntity.getCurrentEntityState(self)
end

function GameplaySceneEntity:pushState(stateName)
  SceneEntity.pushState(self, stateName)
end

function GameplaySceneEntity:getStartSceneName()
  return SceneEntity.getStartSceneName(self)
end

function GameplaySceneEntity:getScene()
  return SceneEntity.getScene(self)
end

function GameplaySceneEntity:isLoaded()
  return SceneEntity.isLoaded(self)
end

function GameplaySceneEntity:load()
  SceneEntity.load(self)
  
  print("GameplaySceneEntity:load()")
end

function GameplaySceneEntity:unLoad()
  SceneEntity.unLoad(self)
  
  print("GameplaySceneEntity:unLoad()")
end

function GameplaySceneEntity:startStateMachine()
  SceneEntity.startStateMachine(self)
  
  print("GameplaySceneEntity:startStateMachine()")
end

function GameplaySceneEntity:enter()
  SceneEntity.enter(self)
  
  print("GameplaySceneEntity:enter()")
end

function GameplaySceneEntity:update(timeStep)
  SceneEntity.update(self, timeStep)
  
--  print("GameplaySceneEntity:update("..timeStep..")")
end

function GameplaySceneEntity:exit()
  SceneEntity.exit(self)
  
  print("GameplaySceneEntity:exit()")
end

function GameplaySceneEntity:onMessage(message)
  SceneEntity.onMessage(self, message)
  
  print("GameplaySceneEntity:message("..tostring(message)..")")
end

function GameplaySceneEntity:touchDown(touches)
  SceneEntity.touchDown(self, touches)
  
  print("GameplaySceneEntity:touchDown("..tostring(touches)..")")
end

function GameplaySceneEntity:touchUp(touches)
  SceneEntity.touchUp(self, touches)
  
  print("GameplaySceneEntity:touchUp("..tostring(touches)..")")
end

function GameplaySceneEntity:touchMove(touches)
  SceneEntity.touchMove(self, touches)
  
  print("GameplaySceneEntity:touchMove("..tostring(touches)..")")
end

function GameplaySceneEntity:touchCancelled(touches)
  SceneEntity.touchCancelled(self, touches)
  
  print("GameplaySceneEntity:touchCancelled("..tostring(touches)..")")
end

function GameplaySceneEntity:renderHUD()
  SceneEntity.renderHUD(self)
  
--  print("GameplaySceneEntity:renderHUD()")
end

function GameplaySceneEntity:pause()
  SceneEntity.pause(self)
  
  print("GameplaySceneEntity:pause()")
end

function GameplaySceneEntity:unPause()
  SceneEntity.unPause(self)
  
  print("GameplaySceneEntity:unPause()")
end

return GameplaySceneEntity

