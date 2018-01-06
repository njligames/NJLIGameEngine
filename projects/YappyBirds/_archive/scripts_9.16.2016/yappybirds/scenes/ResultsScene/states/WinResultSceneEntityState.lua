local SceneEntityState = require "njli.statemachine.sceneentitystate"

local WinResultSceneEntityState = {}
WinResultSceneEntityState.__index = WinResultSceneEntityState

local json = require('json')

setmetatable(WinResultSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function WinResultSceneEntityState:className()
  return "WinResultSceneEntityState"
end

function WinResultSceneEntityState:class()
  return self
end

function WinResultSceneEntityState:superClass()
  return SceneEntityState
end

function WinResultSceneEntityState:isa(theClass)
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

function WinResultSceneEntityState:destroy()
  print("WinResultSceneEntityState:load()")

  WinResultSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function WinResultSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("WinResultSceneEntityState:load()")
end

function WinResultSceneEntityState:__gc()
end

function WinResultSceneEntityState:__tostring()
  return json:stringify(self)
end

function WinResultSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function WinResultSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function WinResultSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function WinResultSceneEntityState:load()
  SceneEntityState.load(self)

  print("WinResultSceneEntityState:load()")
end

function WinResultSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("WinResultSceneEntityState:load()")
end

function WinResultSceneEntityState:push()
  SceneEntityState.push(self)
end

function WinResultSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function WinResultSceneEntityState:enter()
  print("WinResultSceneEntityState:enter()")
end

function WinResultSceneEntityState:update(timeStep)
  print("WinResultSceneEntityState:update("..timeStep..")")
end

function WinResultSceneEntityState:exit()
  print("WinResultSceneEntityState:exit()")
end

function WinResultSceneEntityState:onMessage(message)
  print("WinResultSceneEntityState:onMessage("..tostring(message)..")")
end

function WinResultSceneEntityState:touchDown(touches)
  print("WinResultSceneEntityState:touchDown("..tostring(touches)..")")
end

function WinResultSceneEntityState:touchUp(touches)
  print("WinResultSceneEntityState:touchUp("..tostring(touches)..")")
end

function WinResultSceneEntityState:touchMove(touches)
  print("WinResultSceneEntityState:touchMove("..tostring(touches)..")")
end

function WinResultSceneEntityState:touchCancelled(touches)
  print("WinResultSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function WinResultSceneEntityState:renderHUD()
  print("WinResultSceneEntityState:renderHUD()")
end

function WinResultSceneEntityState:pause()
  print("WinResultSceneEntityState:pause()")
end

function WinResultSceneEntityState:unPause()
  print("WinResultSceneEntityState:unPause()")
end

return WinResultSceneEntityState

