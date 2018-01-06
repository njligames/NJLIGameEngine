local SceneEntityState = require "njli.statemachine.sceneentitystate"

local LevelselectSceneEntityState = {}
LevelselectSceneEntityState.__index = LevelselectSceneEntityState

local json = require('json')

setmetatable(LevelselectSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function LevelselectSceneEntityState:className()
  return "LevelselectSceneEntityState"
end

function LevelselectSceneEntityState:class()
  return self
end

function LevelselectSceneEntityState:superClass()
  return SceneEntityState
end

function LevelselectSceneEntityState:isa(theClass)
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

function LevelselectSceneEntityState:destroy()
  print("LevelselectSceneEntityState:load()")

  LevelselectSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function LevelselectSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("LevelselectSceneEntityState:load()")
end

function LevelselectSceneEntityState:__gc()
end

function LevelselectSceneEntityState:__tostring()
  return json:stringify(self)
end

function LevelselectSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function LevelselectSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function LevelselectSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LevelselectSceneEntityState:load()
  SceneEntityState.load(self)

  print("LevelselectSceneEntityState:load()")
end

function LevelselectSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("LevelselectSceneEntityState:load()")
end

function LevelselectSceneEntityState:push()
  SceneEntityState.push(self)
end

function LevelselectSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function LevelselectSceneEntityState:enter()
  print("LevelselectSceneEntityState:enter()")
end

function LevelselectSceneEntityState:update(timeStep)
  print("LevelselectSceneEntityState:update("..timeStep..")")
end

function LevelselectSceneEntityState:exit()
  print("LevelselectSceneEntityState:exit()")
end

function LevelselectSceneEntityState:onMessage(message)
  print("LevelselectSceneEntityState:onMessage("..tostring(message)..")")
end

function LevelselectSceneEntityState:touchDown(touches)
  print("LevelselectSceneEntityState:touchDown("..tostring(touches)..")")
end

function LevelselectSceneEntityState:touchUp(touches)
  print("LevelselectSceneEntityState:touchUp("..tostring(touches)..")")
end

function LevelselectSceneEntityState:touchMove(touches)
  print("LevelselectSceneEntityState:touchMove("..tostring(touches)..")")
end

function LevelselectSceneEntityState:touchCancelled(touches)
  print("LevelselectSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function LevelselectSceneEntityState:renderHUD()
  print("LevelselectSceneEntityState:renderHUD()")
end

function LevelselectSceneEntityState:pause()
  print("LevelselectSceneEntityState:pause()")
end

function LevelselectSceneEntityState:unPause()
  print("LevelselectSceneEntityState:unPause()")
end

return LevelselectSceneEntityState

