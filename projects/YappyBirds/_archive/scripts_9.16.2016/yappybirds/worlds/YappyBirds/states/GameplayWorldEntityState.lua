local WorldEntityState = require "njli.statemachine.worldentitystate"

local GameplayWorldEntityState = {}
GameplayWorldEntityState.__index = GameplayWorldEntityState

local json = require('json')

setmetatable(GameplayWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function GameplayWorldEntityState:className()
  return "GameplayWorldEntityState"
end

function GameplayWorldEntityState:class()
  return self
end

function GameplayWorldEntityState:superClass()
  return WorldEntityState
end

function GameplayWorldEntityState:isa(theClass)
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

function GameplayWorldEntityState:destroy()
  GameplayWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)
end

function GameplayWorldEntityState:create(init)
  print(" GameplayWorldEntityState:create(init)")

  WorldEntityState.create(self, init)

  local sceneInit =
  {
    name = "GameplayScene",
    module = require "yappybirds.scenes.GameplayScene.GameplaySceneEntity",
    gameInstance = self:getEntityOwner():getGameInstance()
  }

  local sceneEntity = sceneInit.module(sceneInit)
  self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(sceneEntity)
  self:setSceneEntity(sceneEntity)

  sceneEntity:load()

end

function GameplayWorldEntityState:__gc()
  self:unLoad()
end

function GameplayWorldEntityState:__tostring()

  return json:stringify(self)
end

function GameplayWorldEntityState:getWorldState()
  return WorldEntityState.getWorldState(self)
end

function GameplayWorldEntityState:getEntityOwner()
  return WorldEntityState.getEntityOwner(self)
end

function GameplayWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function GameplayWorldEntityState:load()
  WorldEntityState.load(self)

  print("GameplayWorldEntityState:load()")
end

function GameplayWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

  print("GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:push()
  WorldEntityState.push(self)
end

function GameplayWorldEntityState:isIn()
  return WorldEntityState.isIn(self)
end

--function GameplayWorldEntityState:getSceneEntity()
--  return WorldEntityState.getSceneEntity(self)
--end

--function GameplayWorldEntityState:setSceneEntity(sceneEntity)
--  WorldEntityState.getSceneEntity(self, sceneEntity)
--end

function GameplayWorldEntityState:enter()

  print("GameplayWorldEntityState:enter()")
end

function GameplayWorldEntityState:update(timeStep)

--  print("GameplayWorldEntityState:update("..timeStep..")")
end

function GameplayWorldEntityState:exit()

  print("GameplayWorldEntityState:exit()")
end

function GameplayWorldEntityState:onMessage(message)
  print("GameplayWorldEntityState:onMessage("..tostring(message)..")")
end

function GameplayWorldEntityState:touchDown(touches)
  print("GameplayWorldEntityState:touchDown("..tostring(touches)..")")
end

function GameplayWorldEntityState:touchUp(touches)
  print("GameplayWorldEntityState:touchUp("..tostring(touches)..")")
end

function GameplayWorldEntityState:touchMove(touches)
  print("GameplayWorldEntityState:touchMove("..tostring(touches)..")")
end

function GameplayWorldEntityState:touchCancelled(touches)
  print("GameplayWorldEntityState:touchCancelled("..tostring(touches)..")")
end

function GameplayWorldEntityState:renderHUD()
--  print("GameplayWorldEntityState:renderHUD()")
end

function GameplayWorldEntityState:keyboardShow()
  print("GameplayWorldEntityState:keyboardShow()")
end

function GameplayWorldEntityState:keyboardCancel()
  print("GameplayWorldEntityState:keyboardCancel()")
end

function GameplayWorldEntityState:keyboardReturn(text)
  print("GameplayWorldEntityState:keyboardReturn("..tostring(text)..")")
end

function GameplayWorldEntityState:receivedMemoryWarning()
  print("GameplayWorldEntityState:receivedMemoryWarning()")
end

function GameplayWorldEntityState:pause()
  print("GameplayWorldEntityState:pause()")
end

function GameplayWorldEntityState:unPause()
  print("GameplayWorldEntityState:unPause()")
end

return GameplayWorldEntityState

