local SceneEntity = require "njli.statemachine.sceneentity"

local ResultsSceneEntity = {}
ResultsSceneEntity.__index = ResultsSceneEntity

local json = require('json')

setmetatable(ResultsSceneEntity, {
    __index = SceneEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function ResultsSceneEntity:className()
  return "ResultsSceneEntity"
end

function ResultsSceneEntity:class()
  return self
end

function ResultsSceneEntity:superClass()
  return SceneEntity
end

function ResultsSceneEntity:isa(theClass)
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

function ResultsSceneEntity:destroy()
  print(" ResultsSceneEntity:destroy()")

  ResultsSceneEntity.__gc(self)
  SceneEntity.destroy(self)
end

function ResultsSceneEntity:create(init)

  print(" ResultsSceneEntity:create(init)")

  local sceneEntityInit =
  {
    name = init.name,
    states =
    {
      {
        name = "LoadingResultSceneEntityState",
        module = require "yappybirds.scenes.ResultsScene.states.LoadingResultSceneEntityState"
      },
      {
        name = "LoseResultSceneEntityState",
        module = require "yappybirds.scenes.ResultsScene.states.LoseResultSceneEntityState"
      },
      {
        name = "WinResultSceneEntityState",
        module = require "yappybirds.scenes.ResultsScene.states.WinResultSceneEntityState"
      },
    },

    startStateName = "LoadingResultSceneEntityState",
    gameInstance = init.gameInstance
  }

  SceneEntity.create(self, sceneEntityInit)

end

function ResultsSceneEntity:__gc()
end

function ResultsSceneEntity:__tostring()
  return json:stringify(self)
end

function ResultsSceneEntity:hasState()
  return SceneEntity.hasState(self)
end

function ResultsSceneEntity:getCurrentEntityState()
  return SceneEntity.getCurrentEntityState(self)
end

function ResultsSceneEntity:pushState(stateName)
  SceneEntity.pushState(self, stateName)
end

function ResultsSceneEntity:getStartSceneName()
  return SceneEntity.getStartSceneName(self)
end

function ResultsSceneEntity:getScene()
  return SceneEntity.getScene(self)
end

function ResultsSceneEntity:isLoaded()
  return SceneEntity.isLoaded(self)
end

function ResultsSceneEntity:load()
  SceneEntity.load(self)
  
  print("ResultsSceneEntity:load()")
end

function ResultsSceneEntity:unLoad()
  SceneEntity.unLoad(self)
  
  print("ResultsSceneEntity:unLoad()")
end

function ResultsSceneEntity:startStateMachine()
  SceneEntity.startStateMachine(self)
  
  print("ResultsSceneEntity:startStateMachine()")
end

function ResultsSceneEntity:enter()
  SceneEntity.enter(self)
  
  print("ResultsSceneEntity:enter()")
end

function ResultsSceneEntity:update(timeStep)
  SceneEntity.update(self, timeStep)
  
  print("ResultsSceneEntity:update("..timeStep..")")
end

function ResultsSceneEntity:exit()
  SceneEntity.exit(self)
  
  print("ResultsSceneEntity:exit()")
end

function ResultsSceneEntity:onMessage(message)
  SceneEntity.onMessage(self, message)
  
  print("ResultsSceneEntity:message("..tostring(message)..")")
end

function ResultsSceneEntity:touchDown(touches)
  SceneEntity.touchDown(self, touches)
  
  print("ResultsSceneEntity:touchDown("..tostring(touches)..")")
end

function ResultsSceneEntity:touchUp(touches)
  SceneEntity.touchUp(self, touches)
  
  print("ResultsSceneEntity:touchUp("..tostring(touches)..")")
end

function ResultsSceneEntity:touchMove(touches)
  SceneEntity.touchMove(self, touches)
  
  print("ResultsSceneEntity:touchMove("..tostring(touches)..")")
end

function ResultsSceneEntity:touchCancelled(touches)
  SceneEntity.touchCancelled(self, touches)
  
  print("ResultsSceneEntity:touchCancelled("..tostring(touches)..")")
end

function ResultsSceneEntity:renderHUD()
  SceneEntity.renderHUD(self)
  
  print("ResultsSceneEntity:renderHUD()")
end

function ResultsSceneEntity:pause()
  SceneEntity.pause(self)
  
  print("ResultsSceneEntity:pause()")
end

function ResultsSceneEntity:unPause()
  SceneEntity.unPause(self)
  
  print("ResultsSceneEntity:unPause()")
end

return ResultsSceneEntity
