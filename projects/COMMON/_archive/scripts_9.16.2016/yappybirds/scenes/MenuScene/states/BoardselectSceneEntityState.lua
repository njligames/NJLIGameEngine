local SceneEntityState = require "njli.statemachine.sceneentitystate"

local BoardselectSceneEntityState = {}
BoardselectSceneEntityState.__index = BoardselectSceneEntityState

local json = require('json')

setmetatable(BoardselectSceneEntityState, {
    __index = SceneEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function BoardselectSceneEntityState:className()
  return "BoardselectSceneEntityState"
end

function BoardselectSceneEntityState:class()
  return self
end

function BoardselectSceneEntityState:superClass()
  return SceneEntityState
end

function BoardselectSceneEntityState:isa(theClass)
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

function BoardselectSceneEntityState:destroy()
  print("BoardselectSceneEntityState:load()")

  BoardselectSceneEntityState.__gc(self)
  SceneEntityState.destroy(self)
end

function BoardselectSceneEntityState:create(init)
  SceneEntityState.create(self, init)

  print("BoardselectSceneEntityState:load()")
end

function BoardselectSceneEntityState:__gc()
end

function BoardselectSceneEntityState:__tostring()
  return json:stringify(self)
end

function BoardselectSceneEntityState:getSceneState()
  return SceneEntityState.getSceneState(self)
end

function BoardselectSceneEntityState:getEntityOwner()
  return SceneEntityState.getEntityOwner(self)
end

function BoardselectSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function BoardselectSceneEntityState:load()
  SceneEntityState.load(self)

  print("BoardselectSceneEntityState:load()")
end

function BoardselectSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print("BoardselectSceneEntityState:load()")
end

function BoardselectSceneEntityState:push()
  SceneEntityState.push(self)
end

function BoardselectSceneEntityState:isIn()
  return SceneEntityState.isIn(self)
end

function BoardselectSceneEntityState:enter()
  print("BoardselectSceneEntityState:enter()")
end

function BoardselectSceneEntityState:update(timeStep)
  print("BoardselectSceneEntityState:update("..timeStep..")")
end

function BoardselectSceneEntityState:exit()
  print("BoardselectSceneEntityState:exit()")
end

function BoardselectSceneEntityState:onMessage(message)
  print("BoardselectSceneEntityState:onMessage("..tostring(message)..")")
end

function BoardselectSceneEntityState:touchDown(touches)
  print("BoardselectSceneEntityState:touchDown("..tostring(touches)..")")
end

function BoardselectSceneEntityState:touchUp(touches)
  print("BoardselectSceneEntityState:touchUp("..tostring(touches)..")")
end

function BoardselectSceneEntityState:touchMove(touches)
  print("BoardselectSceneEntityState:touchMove("..tostring(touches)..")")
end

function BoardselectSceneEntityState:touchCancelled(touches)
  print("BoardselectSceneEntityState:touchCancelled("..tostring(touches)..")")
end

function BoardselectSceneEntityState:renderHUD()
  print("BoardselectSceneEntityState:renderHUD()")
end

function BoardselectSceneEntityState:pause()
  print("BoardselectSceneEntityState:pause()")
end

function BoardselectSceneEntityState:unPause()
  print("BoardselectSceneEntityState:unPause()")
end

return BoardselectSceneEntityState

