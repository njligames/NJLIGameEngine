local SceneEntityState = require "njli.statemachine.sceneentitystate"

local LoseSceneEntityState = {}
LoseSceneEntityState.__index = LoseSceneEntityState

local json = require('json')

setmetatable(LoseSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function LoseSceneEntityState:className()
  return "LoseSceneEntityState"
end

function LoseSceneEntityState:class()
  return self
end

function LoseSceneEntityState:superClass()
  return SceneEntityState
end

function LoseSceneEntityState:isa(theClass)
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

function LoseSceneEntityState:destroy()
  print("LoseSceneEntityState:load()")

  LoseSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function LoseSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("LoseSceneEntityState:load()")
end

function LoseSceneEntityState:__gc()
end

function LoseSceneEntityState:__tostring()
  return json:stringify(self)
end

function LoseSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function LoseSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function LoseSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LoseSceneEntityState:load()
  SceneEntityState.load(self)

  print("LoseSceneEntityState:load()")
end

function LoseSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("LoseSceneEntityState:load()")
end

function LoseSceneEntityState:push()
  SceneEntityState.push(self)
end

function LoseSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function LoseSceneEntityState:enter()
  print("LoseSceneEntityState:enter()")
end

function LoseSceneEntityState:update(timeStep)
  print("LoseSceneEntityState:update("..timeStep..")")
end

function LoseSceneEntityState:exit()
  print("LoseSceneEntityState:exit()")
end

function LoseSceneEntityState:onMessage(message)
  print("LoseSceneEntityState:onMessage("..tostring(message)..")")
end

function LoseSceneEntityState:touchDown(touches)
  print("LoseSceneEntityState:touchDown("..tostring(touches)..")")
end

function LoseSceneEntityState:touchUp(touches)
  print("LoseSceneEntityState:touchUp("..tostring(touches)..")")
end

function LoseSceneEntityState:touchMove(touches)
  print("LoseSceneEntityState:touchMove("..tostring(touches)..")")
end

function LoseSceneEntityState:touchCancelled(touches)
  print("LoseSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function LoseSceneEntityState:renderHUD()
  print("LoseSceneEntityState:renderHUD()")
end

function LoseSceneEntityState:pause()
  print("LoseSceneEntityState:pause()")
end

function LoseSceneEntityState:unPause()
  print("LoseSceneEntityState:unPause()")
end

return LoseSceneEntityState

