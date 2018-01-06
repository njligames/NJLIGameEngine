local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Fly = {}
Fly.__index = Fly

local json = require('json')

setmetatable(Fly, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Fly:className()
  return "Fly"
end

function Fly:class()
  return self
end

function Fly:superClass()
  return NodeEntityState
end

function Fly:isa(theClass)
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

function Fly:destroy()
  Fly.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Fly:create(init)
  NodeEntityState.create(self, init)
end

function Fly:__gc()
end

function Fly:__tostring()
  return json:stringify(self)
end

function Fly:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Fly:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Fly:load()
  NodeEntityState.load(self)
end

function Fly:unLoad()
  NodeEntityState.unLoad(self)
end

function Fly:push()
  NodeEntityState.push(self)
end

function Fly:isIn()
  return NodeEntityState.isIn(self)
end

function Fly:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Fly:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Fly:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Fly:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Fly:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Fly:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Fly:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Fly:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Fly:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Fly:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Fly:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Fly:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Fly:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Fly:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Fly:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Fly:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Fly:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Fly:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Fly:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Fly
