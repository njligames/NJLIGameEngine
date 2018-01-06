local SceneEntityState = require "njli.statemachine.sceneentitystate"

local MainMenuSceneEntityState = {}
MainMenuSceneEntityState.__index = MainMenuSceneEntityState

local json = require('json')

setmetatable(MainMenuSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function MainMenuSceneEntityState:className()
  return "MainMenuSceneEntityState"
end

function MainMenuSceneEntityState:class()
  return self
end

function MainMenuSceneEntityState:superClass()
  return SceneEntityState
end

function MainMenuSceneEntityState:isa(theClass)
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

function MainMenuSceneEntityState:destroy()
  print("MainMenuSceneEntityState:load()")

  MainMenuSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function MainMenuSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("MainMenuSceneEntityState:load()")
end

function MainMenuSceneEntityState:__gc()
end

function MainMenuSceneEntityState:__tostring()
  return json:stringify(self)
end

function MainMenuSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function MainMenuSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function MainMenuSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function MainMenuSceneEntityState:load()
  SceneEntityState.load(self)

  print("MainMenuSceneEntityState:load()")
end

function MainMenuSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("MainMenuSceneEntityState:load()")
end

function MainMenuSceneEntityState:push()
  SceneEntityState.push(self)
end

function MainMenuSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function MainMenuSceneEntityState:enter()
  print("MainMenuSceneEntityState:enter()")
end

function MainMenuSceneEntityState:update(timeStep)
  print("MainMenuSceneEntityState:update("..timeStep..")")
end

function MainMenuSceneEntityState:exit()
  print("MainMenuSceneEntityState:exit()")
end

function MainMenuSceneEntityState:onMessage(message)
  print("MainMenuSceneEntityState:onMessage("..tostring(message)..")")
end

function MainMenuSceneEntityState:touchDown(touches)
  print("MainMenuSceneEntityState:touchDown("..tostring(touches)..")")
end

function MainMenuSceneEntityState:touchUp(touches)
  print("MainMenuSceneEntityState:touchUp("..tostring(touches)..")")
end

function MainMenuSceneEntityState:touchMove(touches)
  print("MainMenuSceneEntityState:touchMove("..tostring(touches)..")")
end

function MainMenuSceneEntityState:touchCancelled(touches)
  print("MainMenuSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function MainMenuSceneEntityState:renderHUD()
  print("MainMenuSceneEntityState:renderHUD()")
end

function MainMenuSceneEntityState:pause()
  print("MainMenuSceneEntityState:pause()")
end

function MainMenuSceneEntityState:unPause()
  print("MainMenuSceneEntityState:unPause()")
end

return MainMenuSceneEntityState

