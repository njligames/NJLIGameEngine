local WorldEntity = require "njli.statemachine.worldentity"

local YappyBirdWorldEntity = {}
YappyBirdWorldEntity.__index = YappyBirdWorldEntity

local json = require('json')

setmetatable(YappyBirdWorldEntity, {
    __index = WorldEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function YappyBirdWorldEntity:className()
  return "YappyBirdWorldEntity"
end

function YappyBirdWorldEntity:class()
  return self
end

function YappyBirdWorldEntity:superClass()
  return WorldEntity
end

function YappyBirdWorldEntity:isa(theClass)
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

function YappyBirdWorldEntity:destroy()
  YappyBirdWorldEntity.__gc(self)
  WorldEntity.destroy(self)
  
  print("YappyBirdWorldEntity:destroy()")
end

function YappyBirdWorldEntity:create(init)
  print("YappyBirdWorldEntity:create(init)")

  local worldEntityInit =
  {
    name = init.name,
    states =
    {
      {
        name = "GameplayWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.GameplayWorldEntityState"
      },
      {
        name = "MenuWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.MenuWorldEntityState"
      },
      {
        name = "ResultsWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.ResultsWorldEntityState"
      },
    },

    startStateName = "GameplayWorldEntityState",
    gameInstance = init.gameInstance,
  }

  WorldEntity.create(self, worldEntityInit)

end

function YappyBirdWorldEntity:__gc()
  self:unLoad()
end

function YappyBirdWorldEntity:__tostring()

  return json:stringify(self)
end

function YappyBirdWorldEntity:hasState()
  return WorldEntity.hasState(self)
end

function YappyBirdWorldEntity:getCurrentEntityState()
  return WorldEntity.getCurrentEntityState(self)
end

function YappyBirdWorldEntity:pushState(stateName)
  WorldEntity.pushState(self, stateName)
end

function YappyBirdWorldEntity:getStartSceneName()
  return WorldEntity.getStartSceneName(self)
end

function YappyBirdWorldEntity:getWorld()
  return WorldEntity.getWorld(self)
end

function YappyBirdWorldEntity:getGameInstance()
  return WorldEntity.getGameInstance(self)
end

function YappyBirdWorldEntity:isLoaded()
  return WorldEntity.isLoaded(self)
end

function YappyBirdWorldEntity:load()
  WorldEntity.load(self)
  
  print("YappyBirdWorldEntity:load()")
end

function YappyBirdWorldEntity:unLoad()
  WorldEntity.unLoad(self)
  
  print("YappyBirdWorldEntity:unLoad()")
end

function YappyBirdWorldEntity:startStateMachine()
  WorldEntity.startStateMachine(self)
  
  print("YappyBirdWorldEntity:startStateMachine()")
end

function YappyBirdWorldEntity:enter()
  WorldEntity.enter(self)
  
  print("YappyBirdWorldEntity:enter()")
end

function YappyBirdWorldEntity:update(timeStep)
  WorldEntity.update(self, timeStep)
  
--  print("YappyBirdWorldEntity:update("..timeStep..")")
end

function YappyBirdWorldEntity:exit()
  WorldEntity.exit(self)
  
  print("YappyBirdWorldEntity:exit()")
end

function YappyBirdWorldEntity:onMessage(message)
  WorldEntity.onMessage(self, message)
  
  print("YappyBirdWorldEntity:onMessage("..tostring(message)..")")
end

function YappyBirdWorldEntity:touchDown(touches)
  WorldEntity.touchDown(self, touches)
  
  print("YappyBirdWorldEntity:touchDown("..tostring(touches)..")")
end

function YappyBirdWorldEntity:touchUp(touches)
  WorldEntity.touchUp(self, touches)
  
  print("YappyBirdWorldEntity:touchUp("..tostring(touches)..")")
end

function YappyBirdWorldEntity:touchMove(touches)
  WorldEntity.touchMove(self, touches)
  
  print("YappyBirdWorldEntity:touchMove("..tostring(touches)..")")
end

function YappyBirdWorldEntity:touchCancelled(touches)
  WorldEntity.touchCancelled(self, touches)
  
  print("YappyBirdWorldEntity:touchCancelled()")
end

function YappyBirdWorldEntity:renderHUD()
  WorldEntity.renderHUD(self)
  
--  print("YappyBirdWorldEntity:renderHUD()")
end

function YappyBirdWorldEntity:keyboardShow()
  WorldEntity.keyboardShow(self)
end

function YappyBirdWorldEntity:keyboardCancel()
  WorldEntity.keyboardCancel(self)
end

function YappyBirdWorldEntity:keyboardReturn(text)
  WorldEntity.keyboardCancel(self, text)
end

function YappyBirdWorldEntity:receivedMemoryWarning()
  WorldEntity.receivedMemoryWarning(self)
end

function YappyBirdWorldEntity:pause()
  WorldEntity.pause(self)
end

function YappyBirdWorldEntity:unPause()
  WorldEntity.unPause(self)
end

return YappyBirdWorldEntity
