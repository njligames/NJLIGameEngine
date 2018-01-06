local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Pursue = {}
Pursue.__index = Pursue

local json = require('json')

setmetatable(Pursue, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Pursue:className()
  return "Pursue"
end

function Pursue:class()
  return self
end

function Pursue:superClass()
  return NodeEntityState
end

function Pursue:isa(theClass)
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

function Pursue:destroy()
  Pursue.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Pursue:create(init)
  NodeEntityState.create(self, init)
end

function Pursue:__gc()
end

function Pursue:__tostring()
  return json:stringify(self)
end

function Pursue:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Pursue:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Pursue:load()
  NodeEntityState.load(self)
end

function Pursue:unLoad()
  NodeEntityState.unLoad(self)
end

function Pursue:push()
  NodeEntityState.push(self)
end

function Pursue:isIn()
  return NodeEntityState.isIn(self)
end

function Pursue:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Pursue:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Pursue:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Pursue:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Pursue:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Pursue:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Pursue:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Pursue:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Pursue:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Pursue:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Pursue:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Pursue:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Pursue:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Pursue:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Pursue:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Pursue:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Pursue:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Pursue:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Pursue:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Pursue
