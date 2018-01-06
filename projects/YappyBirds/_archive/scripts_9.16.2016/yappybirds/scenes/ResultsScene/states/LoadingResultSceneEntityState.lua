local SceneEntityState = require "njli.statemachine.sceneentitystate"

local LoadingResultSceneEntityState = {}
LoadingResultSceneEntityState.__index = LoadingResultSceneEntityState

local json = require('json')

setmetatable(LoadingResultSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function LoadingResultSceneEntityState:className()
  return "LoadingResultSceneEntityState"
end

function LoadingResultSceneEntityState:class()
  return self
end

function LoadingResultSceneEntityState:superClass()
  return SceneEntityState
end

function LoadingResultSceneEntityState:isa(theClass)
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

function LoadingResultSceneEntityState:destroy()
  print("LoadingResultSceneEntityState:load()")

  LoadingResultSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function LoadingResultSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("LoadingResultSceneEntityState:load()")
end

function LoadingResultSceneEntityState:__gc()
end

function LoadingResultSceneEntityState:__tostring()
  return json:stringify(self)
end

function LoadingResultSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function LoadingResultSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function LoadingResultSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LoadingResultSceneEntityState:load()
  SceneEntityState.load(self)

  print("LoadingResultSceneEntityState:load()")
end

function LoadingResultSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("LoadingResultSceneEntityState:load()")
end

function LoadingResultSceneEntityState:push()
  SceneEntityState.push(self)
end

function LoadingResultSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function LoadingResultSceneEntityState:enter()
  print("LoadingResultSceneEntityState:enter()")
end

function LoadingResultSceneEntityState:update(timeStep)
  print("LoadingResultSceneEntityState:update("..timeStep..")")
end

function LoadingResultSceneEntityState:exit()
  print("LoadingResultSceneEntityState:exit()")
end

function LoadingResultSceneEntityState:onMessage(message)
  print("LoadingResultSceneEntityState:onMessage("..tostring(message)..")")
end

function LoadingResultSceneEntityState:touchDown(touches)
  print("LoadingResultSceneEntityState:touchDown("..tostring(touches)..")")
end

function LoadingResultSceneEntityState:touchUp(touches)
  print("LoadingResultSceneEntityState:touchUp("..tostring(touches)..")")
end

function LoadingResultSceneEntityState:touchMove(touches)
  print("LoadingResultSceneEntityState:touchMove("..tostring(touches)..")")
end

function LoadingResultSceneEntityState:touchCancelled(touches)
  print("LoadingResultSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function LoadingResultSceneEntityState:renderHUD()
  print("LoadingResultSceneEntityState:renderHUD()")
end

function LoadingResultSceneEntityState:pause()
  print("LoadingResultSceneEntityState:pause()")
end

function LoadingResultSceneEntityState:unPause()
  print("LoadingResultSceneEntityState:unPause()")
end

return LoadingResultSceneEntityState
