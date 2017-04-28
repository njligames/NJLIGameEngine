local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Grab = {}
Grab.__index = Grab

local json = require('json')

setmetatable(Grab, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Grab:className()
  return "Grab"
end

function Grab:class()
  return self
end

function Grab:superClass()
  return NodeEntityState
end

function Grab:isa(theClass)
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

function Grab:destroy()
  Grab.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Grab:create(init)
  NodeEntityState.create(self, init)
end

function Grab:__gc()
end

function Grab:__tostring()
  return json:stringify(self)
end

function Grab:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Grab:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Grab:load()
  NodeEntityState.load(self)
end

function Grab:unLoad()
  NodeEntityState.unLoad(self)
end

function Grab:push()
  NodeEntityState.push(self)
end

function Grab:isIn()
  return NodeEntityState.isIn(self)
end

function Grab:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Grab:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Grab:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Grab:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Grab:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Grab:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Grab:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Grab:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Grab:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Grab:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Grab:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Grab:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Grab:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Grab:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Grab:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Grab:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Grab:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Grab:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Grab:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Grab
