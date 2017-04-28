local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Idle = {}
Idle.__index = Idle

local json = require('json')

setmetatable(Idle, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Idle:className()
  return "Idle"
end

function Idle:class()
  return self
end

function Idle:superClass()
  return NodeEntityState
end

function Idle:isa(theClass)
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

function Idle:destroy()
  Idle.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Idle:create(init)
  NodeEntityState.create(self, init)
end

function Idle:__gc()
end

function Idle:__tostring()
  return json:stringify(self)
end

function Idle:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Idle:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Idle:load()
  NodeEntityState.load(self)
end

function Idle:unLoad()
  NodeEntityState.unLoad(self)
end

function Idle:push()
  NodeEntityState.push(self)
end

function Idle:isIn()
  return NodeEntityState.isIn(self)
end

function Idle:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Idle:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Idle:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Idle:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Idle:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Idle:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Idle:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Idle:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Idle:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Idle:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Idle:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Idle:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Idle:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Idle:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Idle:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Idle:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Idle:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Idle:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Idle:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Idle
