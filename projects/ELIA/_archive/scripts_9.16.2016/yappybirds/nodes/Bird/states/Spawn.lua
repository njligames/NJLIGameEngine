local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Spawn = {}
Spawn.__index = Spawn

local json = require('json')

setmetatable(Spawn, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Spawn:className()
  return "Spawn"
end

function Spawn:class()
  return self
end

function Spawn:superClass()
  return NodeEntityState
end

function Spawn:isa(theClass)
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

function Spawn:destroy()
  Spawn.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Spawn:create(init)
  NodeEntityState.create(self, init)
end

function Spawn:__gc()
end

function Spawn:__tostring()
  return json:stringify(self)
end

function Spawn:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Spawn:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Spawn:load()
  NodeEntityState.load(self)
end

function Spawn:unLoad()
  NodeEntityState.unLoad(self)
end

function Spawn:push()
  NodeEntityState.push(self)
end

function Spawn:isIn()
  return NodeEntityState.isIn(self)
end

function Spawn:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Spawn:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Spawn:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Spawn:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Spawn:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Spawn:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Spawn:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Spawn:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Spawn:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Spawn:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Spawn:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Spawn:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Spawn:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Spawn:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Spawn:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Spawn:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Spawn:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Spawn:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Spawn:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Spawn
