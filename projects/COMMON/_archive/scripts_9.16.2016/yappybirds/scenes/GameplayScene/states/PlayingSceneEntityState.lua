local SceneEntityState = require "njli.statemachine.sceneentitystate"

local PlayingSceneEntityState = {}
PlayingSceneEntityState.__index = PlayingSceneEntityState

local json = require('json')

setmetatable(PlayingSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function PlayingSceneEntityState:className()
  return "PlayingSceneEntityState"
end

function PlayingSceneEntityState:class()
  return self
end

function PlayingSceneEntityState:superClass()
  return SceneEntityState
end

function PlayingSceneEntityState:isa(theClass)
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

function PlayingSceneEntityState:destroy()
  print("PlayingSceneEntityState:load()")

  PlayingSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function PlayingSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("PlayingSceneEntityState:load()")
end

function PlayingSceneEntityState:__gc()
end

function PlayingSceneEntityState:__tostring()
  return json:stringify(self)
end

function PlayingSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function PlayingSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function PlayingSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function PlayingSceneEntityState:load()
  SceneEntityState.load(self)

  print("PlayingSceneEntityState:load()")
end

function PlayingSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("PlayingSceneEntityState:load()")
end

function PlayingSceneEntityState:push()
  SceneEntityState.push(self)
end

function PlayingSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function PlayingSceneEntityState:enter()
  print("PlayingSceneEntityState:enter()")
end

function PlayingSceneEntityState:update(timeStep)
  print("PlayingSceneEntityState:update("..timeStep..")")
end

function PlayingSceneEntityState:exit()
  print("PlayingSceneEntityState:exit()")
end

function PlayingSceneEntityState:onMessage(message)
  print("PlayingSceneEntityState:onMessage("..tostring(message)..")")
end

function PlayingSceneEntityState:touchDown(touches)
  print("PlayingSceneEntityState:touchDown("..tostring(touches)..")")
end

function PlayingSceneEntityState:touchUp(touches)
  print("PlayingSceneEntityState:touchUp("..tostring(touches)..")")
end

function PlayingSceneEntityState:touchMove(touches)
  print("PlayingSceneEntityState:touchMove("..tostring(touches)..")")
end

function PlayingSceneEntityState:touchCancelled(touches)
  print("PlayingSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function PlayingSceneEntityState:renderHUD()
  print("PlayingSceneEntityState:renderHUD()")
end

function PlayingSceneEntityState:pause()
  print("PlayingSceneEntityState:pause()")
end

function PlayingSceneEntityState:unPause()
  print("PlayingSceneEntityState:unPause()")
end

return PlayingSceneEntityState
