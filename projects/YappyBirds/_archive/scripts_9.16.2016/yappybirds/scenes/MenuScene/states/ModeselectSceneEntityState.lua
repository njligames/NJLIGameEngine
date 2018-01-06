local SceneEntityState = require "njli.statemachine.sceneentitystate"

local ModeselectSceneEntityState = {}
ModeselectSceneEntityState.__index = ModeselectSceneEntityState

local json = require('json')

setmetatable(ModeselectSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function ModeselectSceneEntityState:className()
  return "ModeselectSceneEntityState"
end

function ModeselectSceneEntityState:class()
  return self
end

function ModeselectSceneEntityState:superClass()
  return SceneEntityState
end

function ModeselectSceneEntityState:isa(theClass)
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

function ModeselectSceneEntityState:destroy()
  print("ModeselectSceneEntityState:load()")

  ModeselectSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function ModeselectSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("ModeselectSceneEntityState:load()")
end

function ModeselectSceneEntityState:__gc()
end

function ModeselectSceneEntityState:__tostring()
  return json:stringify(self)
end

function ModeselectSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function ModeselectSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function ModeselectSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function ModeselectSceneEntityState:load()
  SceneEntityState.load(self)

  print("ModeselectSceneEntityState:load()")
end

function ModeselectSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("ModeselectSceneEntityState:load()")
end

function ModeselectSceneEntityState:push()
  SceneEntityState.push(self)
end

function ModeselectSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function ModeselectSceneEntityState:enter()
  print("ModeselectSceneEntityState:enter()")
end

function ModeselectSceneEntityState:update(timeStep)
  print("ModeselectSceneEntityState:update("..timeStep..")")
end

function ModeselectSceneEntityState:exit()
  print("ModeselectSceneEntityState:exit()")
end

function ModeselectSceneEntityState:onMessage(message)
  print("ModeselectSceneEntityState:onMessage("..tostring(message)..")")
end

function ModeselectSceneEntityState:touchDown(touches)
  print("ModeselectSceneEntityState:touchDown("..tostring(touches)..")")
end

function ModeselectSceneEntityState:touchUp(touches)
  print("ModeselectSceneEntityState:touchUp("..tostring(touches)..")")
end

function ModeselectSceneEntityState:touchMove(touches)
  print("ModeselectSceneEntityState:touchMove("..tostring(touches)..")")
end

function ModeselectSceneEntityState:touchCancelled(touches)
  print("ModeselectSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function ModeselectSceneEntityState:renderHUD()
  print("ModeselectSceneEntityState:renderHUD()")
end

function ModeselectSceneEntityState:pause()
  print("ModeselectSceneEntityState:pause()")
end

function ModeselectSceneEntityState:unPause()
  print("ModeselectSceneEntityState:unPause()")
end

return ModeselectSceneEntityState

