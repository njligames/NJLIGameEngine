 local SceneEntityState = require "njli.statemachine.sceneentitystate"

local WinSceneEntityState = {}
WinSceneEntityState.__index = WinSceneEntityState

local json = require('json')

setmetatable(WinSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function WinSceneEntityState:className()
  return "WinSceneEntityState"
end

function WinSceneEntityState:class()
  return self
end

function WinSceneEntityState:superClass()
  return SceneEntityState
end

function WinSceneEntityState:isa(theClass)
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

function WinSceneEntityState:destroy()
  print("WinSceneEntityState:load()")

  WinSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function WinSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("WinSceneEntityState:load()")
end

function WinSceneEntityState:__gc()
end

function WinSceneEntityState:__tostring()
  return json:stringify(self)
end

function WinSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function WinSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function WinSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function WinSceneEntityState:load()
  SceneEntityState.load(self)

  print("WinSceneEntityState:load()")
end

function WinSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("WinSceneEntityState:load()")
end

function WinSceneEntityState:push()
  SceneEntityState.push(self)
end

function WinSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function WinSceneEntityState:enter()
  print("WinSceneEntityState:enter()")
end

function WinSceneEntityState:update(timeStep)
  print("WinSceneEntityState:update("..timeStep..")")
end

function WinSceneEntityState:exit()
  print("WinSceneEntityState:exit()")
end

function WinSceneEntityState:onMessage(message)
  print("WinSceneEntityState:onMessage("..tostring(message)..")")
end

function WinSceneEntityState:touchDown(touches)
  print("WinSceneEntityState:touchDown("..tostring(touches)..")")
end

function WinSceneEntityState:touchUp(touches)
  print("WinSceneEntityState:touchUp("..tostring(touches)..")")
end

function WinSceneEntityState:touchMove(touches)
  print("WinSceneEntityState:touchMove("..tostring(touches)..")")
end

function WinSceneEntityState:touchCancelled(touches)
  print("WinSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function WinSceneEntityState:renderHUD()
  print("WinSceneEntityState:renderHUD()")
end

function WinSceneEntityState:pause()
  print("WinSceneEntityState:pause()")
end

function WinSceneEntityState:unPause()
  print("WinSceneEntityState:unPause()")
end

return WinSceneEntityState
