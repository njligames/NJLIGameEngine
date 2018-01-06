local SceneEntityState = require "njli.statemachine.sceneentitystate"

local LeaderboardsSceneEntityState = {}
LeaderboardsSceneEntityState.__index = LeaderboardsSceneEntityState

local json = require('json')

setmetatable(LeaderboardsSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function LeaderboardsSceneEntityState:className()
  return "LeaderboardsSceneEntityState"
end

function LeaderboardsSceneEntityState:class()
  return self
end

function LeaderboardsSceneEntityState:superClass()
  return SceneEntityState
end

function LeaderboardsSceneEntityState:isa(theClass)
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

function LeaderboardsSceneEntityState:destroy()
  print("LeaderboardsSceneEntityState:load()")

  LeaderboardsSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function LeaderboardsSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("LeaderboardsSceneEntityState:load()")
end

function LeaderboardsSceneEntityState:__gc()
end

function LeaderboardsSceneEntityState:__tostring()
  return json:stringify(self)
end

function LeaderboardsSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function LeaderboardsSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function LeaderboardsSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LeaderboardsSceneEntityState:load()
  SceneEntityState.load(self)

  print("LeaderboardsSceneEntityState:load()")
end

function LeaderboardsSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("LeaderboardsSceneEntityState:load()")
end

function LeaderboardsSceneEntityState:push()
  SceneEntityState.push(self)
end

function LeaderboardsSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function LeaderboardsSceneEntityState:enter()
  print("LeaderboardsSceneEntityState:enter()")
end

function LeaderboardsSceneEntityState:update(timeStep)
  print("LeaderboardsSceneEntityState:update("..timeStep..")")
end

function LeaderboardsSceneEntityState:exit()
  print("LeaderboardsSceneEntityState:exit()")
end

function LeaderboardsSceneEntityState:onMessage(message)
  print("LeaderboardsSceneEntityState:onMessage("..tostring(message)..")")
end

function LeaderboardsSceneEntityState:touchDown(touches)
  print("LeaderboardsSceneEntityState:touchDown("..tostring(touches)..")")
end

function LeaderboardsSceneEntityState:touchUp(touches)
  print("LeaderboardsSceneEntityState:touchUp("..tostring(touches)..")")
end

function LeaderboardsSceneEntityState:touchMove(touches)
  print("LeaderboardsSceneEntityState:touchMove("..tostring(touches)..")")
end

function LeaderboardsSceneEntityState:touchCancelled(touches)
  print("LeaderboardsSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function LeaderboardsSceneEntityState:renderHUD()
  print("LeaderboardsSceneEntityState:renderHUD()")
end

function LeaderboardsSceneEntityState:pause()
  print("LeaderboardsSceneEntityState:pause()")
end

function LeaderboardsSceneEntityState:unPause()
  print("LeaderboardsSceneEntityState:unPause()")
end

return LeaderboardsSceneEntityState

