local SceneEntityState = require "njli.statemachine.sceneentitystate"

local HighScoresSceneEntityState = {}
HighScoresSceneEntityState.__index = HighScoresSceneEntityState

local json = require('json')

setmetatable(HighScoresSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function HighScoresSceneEntityState:className()
  return "HighScoresSceneEntityState"
end

function HighScoresSceneEntityState:class()
  return self
end

function HighScoresSceneEntityState:superClass()
  return SceneEntityState
end

function HighScoresSceneEntityState:isa(theClass)
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

function HighScoresSceneEntityState:destroy()
  print("HighScoresSceneEntityState:load()")

  HighScoresSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function HighScoresSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("HighScoresSceneEntityState:load()")
end

function HighScoresSceneEntityState:__gc()
end

function HighScoresSceneEntityState:__tostring()
  return json:stringify(self)
end

function HighScoresSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function HighScoresSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function HighScoresSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function HighScoresSceneEntityState:load()
  SceneEntityState.load(self)

  print("HighScoresSceneEntityState:load()")
end

function HighScoresSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("HighScoresSceneEntityState:load()")
end

function HighScoresSceneEntityState:push()
  SceneEntityState.push(self)
end

function HighScoresSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function HighScoresSceneEntityState:enter()
  print("HighScoresSceneEntityState:enter()")
end

function HighScoresSceneEntityState:update(timeStep)
  print("HighScoresSceneEntityState:update("..timeStep..")")
end

function HighScoresSceneEntityState:exit()
  print("HighScoresSceneEntityState:exit()")
end

function HighScoresSceneEntityState:onMessage(message)
  print("HighScoresSceneEntityState:onMessage("..tostring(message)..")")
end

function HighScoresSceneEntityState:touchDown(touches)
  print("HighScoresSceneEntityState:touchDown("..tostring(touches)..")")
end

function HighScoresSceneEntityState:touchUp(touches)
  print("HighScoresSceneEntityState:touchUp("..tostring(touches)..")")
end

function HighScoresSceneEntityState:touchMove(touches)
  print("HighScoresSceneEntityState:touchMove("..tostring(touches)..")")
end

function HighScoresSceneEntityState:touchCancelled(touches)
  print("HighScoresSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function HighScoresSceneEntityState:renderHUD()
  print("HighScoresSceneEntityState:renderHUD()")
end

function HighScoresSceneEntityState:pause()
  print("HighScoresSceneEntityState:pause()")
end

function HighScoresSceneEntityState:unPause()
  print("HighScoresSceneEntityState:unPause()")
end

return HighScoresSceneEntityState

