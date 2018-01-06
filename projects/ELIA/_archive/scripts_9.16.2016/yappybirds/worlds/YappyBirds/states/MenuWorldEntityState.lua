local WorldEntityState = require "njli.statemachine.worldentitystate"

local MenuWorldEntityState = {}
MenuWorldEntityState.__index = MenuWorldEntityState

local json = require('json')

setmetatable(MenuWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function MenuWorldEntityState:className()
  return "MenuWorldEntityState"
end

function MenuWorldEntityState:class()
  return self
end

function MenuWorldEntityState:superClass()
  return WorldEntityState
end

function MenuWorldEntityState:isa(theClass)
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

function MenuWorldEntityState:destroy()
  MenuWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)
end

function MenuWorldEntityState:create(init)
  print("MenuWorldEntityState:create(init)")

  WorldEntityState.create(self, init)

  local sceneInit =
  {
    name = "MenuScene",
    module = require "yappybirds.scenes.MenuScene.MenuSceneEntity",
    gameInstance = self:getEntityOwner():getGameInstance()
  }
  
  local sceneEntity = sceneInit.module(sceneInit)
  self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(sceneEntity)
  self:setSceneEntity(sceneEntity)
  
  sceneEntity:load()
  
end

function MenuWorldEntityState:__gc()
  self:unLoad()
end

function MenuWorldEntityState:__tostring()

  return json:stringify(self)
end

function MenuWorldEntityState:getWorldState()
  return WorldEntityState.getWorldState(self)
end

function MenuWorldEntityState:getEntityOwner()
  return WorldEntityState.getEntityOwner(self)
end

function MenuWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function MenuWorldEntityState:load()
  WorldEntityState.load(self)

  print("MenuWorldEntityState:load()")
end

function MenuWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

  print("MenuWorldEntityState:unLoad()")
end

function MenuWorldEntityState:push()
  WorldEntityState.push(self)
end

function MenuWorldEntityState:isIn()
  return WorldEntityState.isIn(self)
end

function MenuWorldEntityState:getSceneEntity()
  return WorldEntityState.getSceneEntity(self)
end

function MenuWorldEntityState:setSceneEntity(sceneEntity)
  WorldEntityState.getSceneEntity(self, sceneEntity)
end

function MenuWorldEntityState:enter()

  print("MenuWorldEntityState:enter()")
end

function MenuWorldEntityState:update(timeStep)

  print("MenuWorldEntityState:update("..timeStep..")")
end

function MenuWorldEntityState:exit()

  print("MenuWorldEntityState:exit()")
end

function MenuWorldEntityState:onMessage(message)
  print("MenuWorldEntityState:onMessage("..tostring(message)..")")
end

function MenuWorldEntityState:touchDown(touches)
  print("MenuWorldEntityState:touchDown("..tostring(touches)..")")
end

function MenuWorldEntityState:touchUp(touches)
  print("MenuWorldEntityState:touchUp("..tostring(touches)..")")
end

function MenuWorldEntityState:touchMove(touches)
  print("MenuWorldEntityState:touchMove("..tostring(touches)..")")
end

function MenuWorldEntityState:touchCancelled(touches)
  print("MenuWorldEntityState:touchCancelled("..tostring(touches)..")")
end

function MenuWorldEntityState:renderHUD()
  print("MenuWorldEntityState:renderHUD()")
end

function MenuWorldEntityState:keyboardShow()
  print("MenuWorldEntityState:keyboardShow()")
end

function MenuWorldEntityState:keyboardCancel()
  print("MenuWorldEntityState:keyboardCancel()")
end

function MenuWorldEntityState:keyboardReturn(text)
  print("MenuWorldEntityState:keyboardReturn("..tostring(text)..")")
end

function MenuWorldEntityState:receivedMemoryWarning()
  print("MenuWorldEntityState:receivedMemoryWarning()")
end

function MenuWorldEntityState:pause()
  print("MenuWorldEntityState:pause()")
end

function MenuWorldEntityState:unPause()
  print("MenuWorldEntityState:unPause()")
end

return MenuWorldEntityState

