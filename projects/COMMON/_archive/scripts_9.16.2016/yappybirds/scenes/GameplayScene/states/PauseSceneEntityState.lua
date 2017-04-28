local SceneEntityState = require "njli.statemachine.sceneentitystate"

local PauseSceneEntityState = {}
PauseSceneEntityState.__index = PauseSceneEntityState

local json = require('json')

setmetatable(PauseSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function PauseSceneEntityState:className()
  return "PauseSceneEntityState"
end

function PauseSceneEntityState:class()
  return self
end

function PauseSceneEntityState:superClass()
  return SceneEntityState
end

function PauseSceneEntityState:isa(theClass)
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

function PauseSceneEntityState:destroy()
  print("PauseSceneEntityState:load()")

  PauseSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function PauseSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("PauseSceneEntityState:load()")
end

function PauseSceneEntityState:__gc()
end

function PauseSceneEntityState:__tostring()
  return json:stringify(self)
end

function PauseSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function PauseSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function PauseSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function PauseSceneEntityState:load()
  SceneEntityState.load(self)

  print("PauseSceneEntityState:load()")
end

function PauseSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("PauseSceneEntityState:load()")
end

function PauseSceneEntityState:push()
  SceneEntityState.push(self)
end

function PauseSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function PauseSceneEntityState:enter()
  print("PauseSceneEntityState:enter()")
end

function PauseSceneEntityState:update(timeStep)
  print("PauseSceneEntityState:update("..timeStep..")")
end

function PauseSceneEntityState:exit()
  print("PauseSceneEntityState:exit()")
end

function PauseSceneEntityState:onMessage(message)
  print("PauseSceneEntityState:onMessage("..tostring(message)..")")
end

function PauseSceneEntityState:touchDown(touches)
  print("PauseSceneEntityState:touchDown("..tostring(touches)..")")
end

function PauseSceneEntityState:touchUp(touches)
  print("PauseSceneEntityState:touchUp("..tostring(touches)..")")
end

function PauseSceneEntityState:touchMove(touches)
  print("PauseSceneEntityState:touchMove("..tostring(touches)..")")
end

function PauseSceneEntityState:touchCancelled(touches)
  print("PauseSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function PauseSceneEntityState:renderHUD()
  print("PauseSceneEntityState:renderHUD()")
end

function PauseSceneEntityState:pause()
  print("PauseSceneEntityState:pause()")
end

function PauseSceneEntityState:unPause()
  print("PauseSceneEntityState:unPause()")
end

return PauseSceneEntityState

