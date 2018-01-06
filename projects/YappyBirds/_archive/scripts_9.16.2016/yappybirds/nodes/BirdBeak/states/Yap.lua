local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Yap = {}
Yap.__index = Yap

local json = require('json')

setmetatable(Yap, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Yap:className()
  return "Yap"
end

function Yap:class()
  return self
end

function Yap:superClass()
  return NodeEntityState
end

function Yap:isa(theClass)
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

function Yap:destroy()
  Yap.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Yap:create(init)
  NodeEntityState.create(self, init)
end

function Yap:__gc()
end

function Yap:__tostring()
  return json:stringify(self)
end

function Yap:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Yap:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Yap:load()
  NodeEntityState.load(self)
end

function Yap:unLoad()
  NodeEntityState.unLoad(self)
end

function Yap:push()
  NodeEntityState.push(self)
end

function Yap:isIn()
  return NodeEntityState.isIn(self)
end

function Yap:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Yap:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Yap:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Yap:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Yap:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Yap:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Yap:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Yap:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Yap:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Yap:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Yap:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Yap:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Yap:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Yap:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Yap:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Yap:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Yap:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Yap:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Yap:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Yap
