local WorldEntityState = require "njli.statemachine.worldentitystate"

local ResultsWorldEntityState = {}
ResultsWorldEntityState.__index = ResultsWorldEntityState

local json = require('json')

setmetatable(ResultsWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function ResultsWorldEntityState:className()
  return "ResultsWorldEntityState"
end

function ResultsWorldEntityState:class()
  return self
end

function ResultsWorldEntityState:superClass()
  return WorldEntityState
end

function ResultsWorldEntityState:isa(theClass)
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

function ResultsWorldEntityState:destroy()
  ResultsWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)
end

function ResultsWorldEntityState:create(init)

  print("ResultsWorldEntityState:create(init)")

  WorldEntityState.create(self, init)

  local sceneInit =
  {
    name = "ResultsScene",
    module = require "yappybirds.scenes.ResultsScene.ResultsSceneEntity",
    gameInstance = self:getEntityOwner():getGameInstance()
  }

  local sceneEntity = sceneInit.module(sceneInit)
  self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(sceneEntity)
  self:setSceneEntity(sceneEntity)

  sceneEntity:load()

end

function ResultsWorldEntityState:__gc()
  self:unLoad()
end

function ResultsWorldEntityState:__tostring()

  return json:stringify(self)
end

function ResultsWorldEntityState:getWorldState()
  return WorldEntityState.getWorldState(self)
end

function ResultsWorldEntityState:getEntityOwner()
  return WorldEntityState.getEntityOwner(self)
end

function ResultsWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function ResultsWorldEntityState:load()
  WorldEntityState.load(self)

  print("ResultsWorldEntityState:load()")
end

function ResultsWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

  print("ResultsWorldEntityState:unLoad()")
end

function ResultsWorldEntityState:push()
  WorldEntityState.push(self)
end

function ResultsWorldEntityState:isIn()
  return WorldEntityState.isIn(self)
end

function ResultsWorldEntityState:getSceneEntity()
  return WorldEntityState.getSceneEntity(self)
end

function ResultsWorldEntityState:setSceneEntity(sceneEntity)
  WorldEntityState.getSceneEntity(self, sceneEntity)
end

function ResultsWorldEntityState:enter()

  print("ResultsWorldEntityState:enter()")
end

function ResultsWorldEntityState:update(timeStep)

  print("ResultsWorldEntityState:update("..timeStep..")")
end

function ResultsWorldEntityState:exit()

  print("ResultsWorldEntityState:exit()")
end

function ResultsWorldEntityState:onMessage(message)
  print("ResultsWorldEntityState:onMessage("..tostring(message)..")")
end

function ResultsWorldEntityState:touchDown(touches)
  print("ResultsWorldEntityState:touchDown("..tostring(touches)..")")
end

function ResultsWorldEntityState:touchUp(touches)
  print("ResultsWorldEntityState:touchUp("..tostring(touches)..")")
end

function ResultsWorldEntityState:touchMove(touches)
  print("ResultsWorldEntityState:touchMove("..tostring(touches)..")")
end

function ResultsWorldEntityState:touchCancelled(touches)
  print("ResultsWorldEntityState:touchCancelled("..tostring(touches)..")")
end

function ResultsWorldEntityState:renderHUD()
  print("ResultsWorldEntityState:renderHUD()")
end

function ResultsWorldEntityState:keyboardShow()
  print("ResultsWorldEntityState:keyboardShow()")
end

function ResultsWorldEntityState:keyboardCancel()
  print("ResultsWorldEntityState:keyboardCancel()")
end

function ResultsWorldEntityState:keyboardReturn(text)
  print("ResultsWorldEntityState:keyboardReturn("..tostring(text)..")")
end

function ResultsWorldEntityState:receivedMemoryWarning()
  print("ResultsWorldEntityState:receivedMemoryWarning()")
end

function ResultsWorldEntityState:pause()
  print("ResultsWorldEntityState:pause()")
end

function ResultsWorldEntityState:unPause()
  print("ResultsWorldEntityState:unPause()")
end

return ResultsWorldEntityState

