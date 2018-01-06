local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Hit = {}
Hit.__index = Hit

local json = require('json')

setmetatable(Hit, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Hit:className()
  return "Hit"
end

function Hit:class()
  return self
end

function Hit:superClass()
  return NodeEntityState
end

function Hit:isa(theClass)
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

function Hit:destroy()
  Hit.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Hit:create(init)
  NodeEntityState.create(self, init)
end

function Hit:__gc()
end

function Hit:__tostring()
  return json:stringify(self)
end

function Hit:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Hit:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Hit:load()
  NodeEntityState.load(self)
end

function Hit:unLoad()
  NodeEntityState.unLoad(self)
end

function Hit:push()
  NodeEntityState.push(self)
end

function Hit:isIn()
  return NodeEntityState.isIn(self)
end

function Hit:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Hit:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Hit:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Hit:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Hit:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Hit:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Hit:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Hit:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Hit:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Hit:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Hit:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Hit:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Hit:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Hit:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Hit:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Hit:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Hit:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Hit:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Hit:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Hit
