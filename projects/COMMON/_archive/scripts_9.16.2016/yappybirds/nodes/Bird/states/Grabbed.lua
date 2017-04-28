local NodeEntityState = require "njli.statemachine.nodeentitystate"

local Grabbed = {}
Grabbed.__index = Grabbed

local json = require('json')

setmetatable(Grabbed, {
    __index = NodeEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Grabbed:className()
  return "Grabbed"
end

function Grabbed:class()
  return self
end

function Grabbed:superClass()
  return NodeEntityState
end

function Grabbed:isa(theClass)
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

function Grabbed:destroy()
  Grabbed.__gc(self)
  NodeEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function Grabbed:create(init)
  NodeEntityState.create(self, init)
end

function Grabbed:__gc()
end

function Grabbed:__tostring()
  return json:stringify(self)
end

function Grabbed:getNodeState()
  return NodeEntityState.getNodeState(self)
end

function Grabbed:getEntityOwner()
  return NodeEntityState.getEntityOwner(self)
end

function NodeEntity:isLoaded()
  return NodeEntityState.isLoaded(self)
end

function Grabbed:load()
  NodeEntityState.load(self)
end

function Grabbed:unLoad()
  NodeEntityState.unLoad(self)
end

function Grabbed:push()
  NodeEntityState.push(self)
end

function Grabbed:isIn()
  return NodeEntityState.isIn(self)
end

function Grabbed:enter() 
  print("LoadingGameplaySceneEntityState:enter()")
end

function Grabbed:update(timeStep) 
  print("LoadingGameplaySceneEntityState:update()")
end

function Grabbed:exit()
  print("LoadingGameplaySceneEntityState:exit()")
end

function Grabbed:onMessage(message)
  print("LoadingGameplaySceneEntityState:onMessage()")
end

function Grabbed:touchDown(touches)
  print("LoadingGameplaySceneEntityState:touchDown()")
end

function Grabbed:touchUp(touches)
  print("LoadingGameplaySceneEntityState:touchUp()")
end

function Grabbed:touchMove(touches)
  print("LoadingGameplaySceneEntityState:touchMove()")
end

function Grabbed:touchCancelled(touches)
  print("LoadingGameplaySceneEntityState:touchCancelled()")
end

function Grabbed:render()
  print("LoadingGameplaySceneEntityState:render()")
end

function Grabbed:actionUpdate(action, timeStep)
  print("LoadingGameplaySceneEntityState:actionUpdate()")
end

function Grabbed:actionComplete(action)
  print("LoadingGameplaySceneEntityState:actionComplete()")
end

function Grabbed:collide(otherNode, collisionPoint)
  print("LoadingGameplaySceneEntityState:collide()")
end

function Grabbed:near(otherNode)
  print("LoadingGameplaySceneEntityState:near()")
end

function Grabbed:rayTouchDown(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchDown()")
end

function Grabbed:rayTouchUp(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchUp()")
end

function Grabbed:rayTouchMove(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchMove()")
end

function Grabbed:rayTouchCancelled(rayContact)
  print("LoadingGameplaySceneEntityState:rayTouchCancelled()")
end

function Grabbed:pause()
  print("LoadingGameplaySceneEntityState:pause()")
end

function Grabbed:unPause()
  print("LoadingGameplaySceneEntityState:unPause()")
end

return Grabbed
