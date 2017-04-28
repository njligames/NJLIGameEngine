local SceneEntityState = require "njli.statemachine.sceneentitystate"

local AchievementsSceneEntityState = {}
AchievementsSceneEntityState.__index = AchievementsSceneEntityState

local json = require('json')

setmetatable(AchievementsSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function AchievementsSceneEntityState:className()
  return "AchievementsSceneEntityState"
end

function AchievementsSceneEntityState:class()
  return self
end

function AchievementsSceneEntityState:superClass()
  return SceneEntityState
end

function AchievementsSceneEntityState:isa(theClass)
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

function AchievementsSceneEntityState:destroy()
  print("AchievementsSceneEntityState:load()")

  AchievementsSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function AchievementsSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("AchievementsSceneEntityState:load()")
end

function AchievementsSceneEntityState:__gc()
end

function AchievementsSceneEntityState:__tostring()
  return json:stringify(self)
end

function AchievementsSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function AchievementsSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function AchievementsSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function AchievementsSceneEntityState:load()
  SceneEntityState.load(self)

  print("AchievementsSceneEntityState:load()")
end

function AchievementsSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("AchievementsSceneEntityState:load()")
end

function AchievementsSceneEntityState:push()
  SceneEntityState.push(self)
end

function AchievementsSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function AchievementsSceneEntityState:enter()
  print("AchievementsSceneEntityState:enter()")
end

function AchievementsSceneEntityState:update(timeStep)
  print("AchievementsSceneEntityState:update("..timeStep..")")
end

function AchievementsSceneEntityState:exit()
  print("AchievementsSceneEntityState:exit()")
end

function AchievementsSceneEntityState:onMessage(message)
  print("AchievementsSceneEntityState:onMessage("..tostring(message)..")")
end

function AchievementsSceneEntityState:touchDown(touches)
  print("AchievementsSceneEntityState:touchDown("..tostring(touches)..")")
end

function AchievementsSceneEntityState:touchUp(touches)
  print("AchievementsSceneEntityState:touchUp("..tostring(touches)..")")
end

function AchievementsSceneEntityState:touchMove(touches)
  print("AchievementsSceneEntityState:touchMove("..tostring(touches)..")")
end

function AchievementsSceneEntityState:touchCancelled(touches)
  print("AchievementsSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function AchievementsSceneEntityState:renderHUD()
  print("AchievementsSceneEntityState:renderHUD()")
end

function AchievementsSceneEntityState:pause()
  print("AchievementsSceneEntityState:pause()")
end

function AchievementsSceneEntityState:unPause()
  print("AchievementsSceneEntityState:unPause()")
end

return AchievementsSceneEntityState

