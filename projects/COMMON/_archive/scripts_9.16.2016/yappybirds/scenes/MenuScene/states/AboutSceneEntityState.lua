local SceneEntityState = require "njli.statemachine.sceneentitystate"

local AboutSceneEntityState = {}
AboutSceneEntityState.__index = AboutSceneEntityState

local json = require('json')

setmetatable(AboutSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function AboutSceneEntityState:className()
  return "AboutSceneEntityState"
end

function AboutSceneEntityState:class()
  return self
end

function AboutSceneEntityState:superClass()
  return SceneEntityState
end

function AboutSceneEntityState:isa(theClass)
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

function AboutSceneEntityState:destroy()
  print("AboutSceneEntityState:load()")

  AboutSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function AboutSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("AboutSceneEntityState:load()")
end

function AboutSceneEntityState:__gc()
end

function AboutSceneEntityState:__tostring()
  return json:stringify(self)
end

function AboutSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function AboutSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function AboutSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function AboutSceneEntityState:load()
  SceneEntityState.load(self)

  print("AboutSceneEntityState:load()")
end

function AboutSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("AboutSceneEntityState:load()")
end

function AboutSceneEntityState:push()
  SceneEntityState.push(self)
end

function AboutSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function AboutSceneEntityState:enter()
  print("AboutSceneEntityState:enter()")
end

function AboutSceneEntityState:update(timeStep)
  print("AboutSceneEntityState:update("..timeStep..")")
end

function AboutSceneEntityState:exit()
  print("AboutSceneEntityState:exit()")
end

function AboutSceneEntityState:onMessage(message)
  print("AboutSceneEntityState:onMessage("..tostring(message)..")")
end

function AboutSceneEntityState:touchDown(touches)
  print("AboutSceneEntityState:touchDown("..tostring(touches)..")")
end

function AboutSceneEntityState:touchUp(touches)
  print("AboutSceneEntityState:touchUp("..tostring(touches)..")")
end

function AboutSceneEntityState:touchMove(touches)
  print("AboutSceneEntityState:touchMove("..tostring(touches)..")")
end

function AboutSceneEntityState:touchCancelled(touches)
  print("AboutSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function AboutSceneEntityState:renderHUD()
  print("AboutSceneEntityState:renderHUD()")
end

function AboutSceneEntityState:pause()
  print("AboutSceneEntityState:pause()")
end

function AboutSceneEntityState:unPause()
  print("AboutSceneEntityState:unPause()")
end

return AboutSceneEntityState

