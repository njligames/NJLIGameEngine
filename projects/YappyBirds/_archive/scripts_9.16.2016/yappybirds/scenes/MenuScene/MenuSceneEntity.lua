local SceneEntity = require "njli.statemachine.sceneentity"

local MenuSceneEntity = {}
MenuSceneEntity.__index = MenuSceneEntity

local json = require('json')

setmetatable(MenuSceneEntity, {
    __index = SceneEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function MenuSceneEntity:className()
  return "MenuSceneEntity"
end

function MenuSceneEntity:class()
  return self
end

function MenuSceneEntity:superClass()
  return SceneEntity
end

function MenuSceneEntity:isa(theClass)
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

function MenuSceneEntity:destroy()
  MenuSceneEntity.__gc(self)
  SceneEntity.destroy(self)
  
  print(" MenuSceneEntity:destroy()")
end

function MenuSceneEntity:create(init)
  
  print(" MenuSceneEntity:create(init)")

  local sceneEntityInit =
  {
    name = init.name,
    states =
    {
      {
        name = "AboutSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.AboutSceneEntityState"
      },
      {
        name = "AchievementsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.AchievementsSceneEntityState"
      },
      {
        name = "BoardselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.BoardselectSceneEntityState"
      },
      {
        name = "CharactersSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.CharactersSceneEntityState"
      },
      {
        name = "HighScoresSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.HighScoresSceneEntityState"
      },
      {
        name = "LeaderboardsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LeaderboardsSceneEntityState"
      },
      {
        name = "LevelselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LevelselectSceneEntityState"
      },
      {
        name = "LoadingMenuSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LoadingMenuSceneEntityState"
      },
      {
        name = "MainMenuSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.MainMenuSceneEntityState"
      },
      {
        name = "ModeselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.ModeselectSceneEntityState"
      },
      {
        name = "SettingsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.SettingsSceneEntityState"
      },
    },

    startStateName = "LoadingMenuSceneEntityState",
    gameInstance = init.gameInstance
  }

  SceneEntity.create(self, sceneEntityInit)

   
end

function MenuSceneEntity:__gc()
end

function MenuSceneEntity:__tostring()
  return json:stringify(self)
end

function MenuSceneEntity:hasState()
  return SceneEntity.hasState(self)
end

function MenuSceneEntity:getCurrentEntityState()
  return SceneEntity.getCurrentEntityState(self)
end

function MenuSceneEntity:pushState(stateName)
  SceneEntity.pushState(self, stateName)
end

function MenuSceneEntity:getStartSceneName()
  return SceneEntity.getStartSceneName(self)
end

function MenuSceneEntity:getScene()
  return SceneEntity.getScene(self)
end

function MenuSceneEntity:isLoaded()
  return SceneEntity.isLoaded(self)
end

function MenuSceneEntity:load()
  SceneEntity.load(self)
  
  print("MenuSceneEntity:load()")
end

function MenuSceneEntity:unLoad()
  SceneEntity.unLoad(self)
  
  print("MenuSceneEntity:unLoad()")
end

function MenuSceneEntity:startStateMachine()
  SceneEntity.startStateMachine(self)
  
  print("MenuSceneEntity:startStateMachine()")
end

function MenuSceneEntity:enter()
  SceneEntity.enter(self)
  
  print("MenuSceneEntity:enter()")
end

function MenuSceneEntity:update(timeStep)
  SceneEntity.update(self, timeStep)
  
  print("MenuSceneEntity:update("..timeStep..")")
end

function MenuSceneEntity:exit()
  SceneEntity.exit(self)
  
  print("MenuSceneEntity:exit()")
end

function MenuSceneEntity:onMessage(message)
  SceneEntity.onMessage(self, message)
  
  print("MenuSceneEntity:message("..tostring(message)..")")
end

function MenuSceneEntity:touchDown(touches)
  SceneEntity.touchDown(self, touches)
  
  print("MenuSceneEntity:touchDown("..tostring(touches)..")")
end

function MenuSceneEntity:touchUp(touches)
  SceneEntity.touchUp(self, touches)
  
  print("MenuSceneEntity:touchUp("..tostring(touches)..")")
end

function MenuSceneEntity:touchMove(touches)
  SceneEntity.touchMove(self, touches)
  
  print("MenuSceneEntity:touchMove("..tostring(touches)..")")
end

function MenuSceneEntity:touchCancelled(touches)
  SceneEntity.touchCancelled(self, touches)
  
  print("MenuSceneEntity:touchCancelled("..tostring(touches)..")")
end

function MenuSceneEntity:renderHUD()
  SceneEntity.renderHUD(self)
  
  print("MenuSceneEntity:renderHUD()")
end

function MenuSceneEntity:pause()
  SceneEntity.pause(self)
  
  print("MenuSceneEntity:pause()")
end

function MenuSceneEntity:unPause()
  SceneEntity.unPause(self)
  
  print("MenuSceneEntity:unPause()")
end

return MenuSceneEntity

