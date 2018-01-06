local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Grabbing = {}
Grabbing.__index = Grabbing

local json = require('json')

setmetatable(Grabbing, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Grabbing:className()
  return "Grabbing"
end

function Grabbing:class()
  return self
end

function Grabbing:superClass()
  return NodeEntityState
end

function Grabbing:isa(theClass)
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

function Grabbing:destroy()
  Grabbing.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Grabbing:create(init)
  NodeEntityState.create(self, init)
end

function Grabbing:__gc()
end

function Grabbing:__tostring()
  return json:stringify(self)
end

function Grabbing:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Grabbing:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Grabbing:load()
  NodeEntityState.load(self)
end

function Grabbing:unLoad()
  NodeEntityState.unLoad(self)
end

function Grabbing:push()
  NodeEntityState.push(self)
end

function Grabbing:isIn()
  return NodeEntityState.isIn(self)
end

function Grabbing:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Grabbing:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Grabbing:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Grabbing:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Grabbing:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Grabbing:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Grabbing:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Grabbing:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Grabbing:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Grabbing:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Grabbing:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Grabbing:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Grabbing:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Grabbing:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Grabbing:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Grabbing:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Grabbing:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Grabbing:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Grabbing:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Grabbing
