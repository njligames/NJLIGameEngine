local SceneEntityState = require "njli.statemachine.sceneentitystate"

local CharactersSceneEntityState = {}
CharactersSceneEntityState.__index = CharactersSceneEntityState

local json = require('json')

setmetatable(CharactersSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function CharactersSceneEntityState:className()
  return "CharactersSceneEntityState"
end

function CharactersSceneEntityState:class()
  return self
end

function CharactersSceneEntityState:superClass()
  return SceneEntityState
end

function CharactersSceneEntityState:isa(theClass)
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

function CharactersSceneEntityState:destroy()
  print("CharactersSceneEntityState:load()")

  CharactersSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function CharactersSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("CharactersSceneEntityState:load()")
end

function CharactersSceneEntityState:__gc()
end

function CharactersSceneEntityState:__tostring()
  return json:stringify(self)
end

function CharactersSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function CharactersSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function CharactersSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function CharactersSceneEntityState:load()
  SceneEntityState.load(self)

  print("CharactersSceneEntityState:load()")
end

function CharactersSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("CharactersSceneEntityState:load()")
end

function CharactersSceneEntityState:push()
  SceneEntityState.push(self)
end

function CharactersSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function CharactersSceneEntityState:enter()
  print("CharactersSceneEntityState:enter()")
end

function CharactersSceneEntityState:update(timeStep)
  print("CharactersSceneEntityState:update("..timeStep..")")
end

function CharactersSceneEntityState:exit()
  print("CharactersSceneEntityState:exit()")
end

function CharactersSceneEntityState:onMessage(message)
  print("CharactersSceneEntityState:onMessage("..tostring(message)..")")
end

function CharactersSceneEntityState:touchDown(touches)
  print("CharactersSceneEntityState:touchDown("..tostring(touches)..")")
end

function CharactersSceneEntityState:touchUp(touches)
  print("CharactersSceneEntityState:touchUp("..tostring(touches)..")")
end

function CharactersSceneEntityState:touchMove(touches)
  print("CharactersSceneEntityState:touchMove("..tostring(touches)..")")
end

function CharactersSceneEntityState:touchCancelled(touches)
  print("CharactersSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function CharactersSceneEntityState:renderHUD()
  print("CharactersSceneEntityState:renderHUD()")
end

function CharactersSceneEntityState:pause()
  print("CharactersSceneEntityState:pause()")
end

function CharactersSceneEntityState:unPause()
  print("CharactersSceneEntityState:unPause()")
end

return CharactersSceneEntityState

