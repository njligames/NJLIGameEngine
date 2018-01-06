local NodeEntity = require "njli.statemachine.nodeentity"

local BirdBeakEntity = {}
BirdBeakEntity.__index = BirdBeakEntity

local json = require('json')

setmetatable(BirdBeakEntity, {
    __index = NodeEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function BirdBeakEntity:className()
  return "BirdBeakEntity"
end

function BirdBeakEntity:class()
  return self
end

function BirdBeakEntity:superClass()
  return NodeEntity
end

function BirdBeakEntity:isa(theClass)
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

function BirdBeakEntity:destroy()
  BirdBeakEntity.__gc(self)
end

function BirdBeakEntity:create(init)

  local nodeEntityInit =
  {
    name = "name",
    states =
    {
      {
        name = "Grab",
        module = "yappybirds.nodes.BirdBeak.states.Grab"
      },
      {
        name = "Hit",
        module = "yappybirds.nodes.BirdBeak.states.Hit"
      },
      {
        name = "Idle",
        module = "yappybirds.nodes.BirdBeak.states.Idle"
      },
      {
        name = "Yap",
        module = "yappybirds.nodes.BirdBeak.states.Yap"
      },
    },
    startStateName = "Idle",
    physicsShape = nil,
    physicsBody = nil,
    sharedGeometry = nil,
  }

  NodeEntity.create(self, nodeEntityInit)

end

function BirdBeakEntity:__gc()
end

function BirdBeakEntity:__tostring()
  return json:stringify(self)
end

function BirdBeakEntity:hasState()
  return NodeEntity.hasState(self)
end

function BirdBeakEntity:getCurrentEntityState()
  return NodeEntity.getCurrentEntityState(self)
end

function BirdBeakEntity:pushState(stateName)
  NodeEntity.pushState(self, stateName)
end

function BirdBeakEntity:getNode()
  return NodeEntity.getNode(self)
end

function BirdBeakEntity:getPhysicsShape()
  return NodeEntity.getPhysicsShape(self)
end

function BirdBeakEntity:getPhysicsBody()
  return NodeEntity.getPhysicsBody(self)
end

function BirdBeakEntity:getAction()
  return NodeEntity.getAction(self)
end

function BirdBeakEntity:getClock()
  return NodeEntity.getClock(self)
end

function BirdBeakEntity:isLoaded()
  return NodeEntity.isLoaded(self)
end

function BirdBeakEntity:load()
  NodeEntity.load(self)
end

function BirdBeakEntity:unLoad()
  NodeEntity.unLoad(self)
end

function BirdBeakEntity:startStateMachine()
  NodeEntity.startStateMachine(self)
end

function BirdBeakEntity:enter()
  NodeEntity.enter(self)
end

function BirdBeakEntity:update(timeStep)
  NodeEntity.update(self, timeStep)
end

function BirdBeakEntity:exit()
  NodeEntity.exit(self)
end

function BirdBeakEntity:onMessage(message)
  NodeEntity.onMessage(self, message)
end

function BirdBeakEntity:touchDown(touches)
  NodeEntity.touchDown(self, touches)
end

function BirdBeakEntity:touchUp(touches)
  NodeEntity.touchUp(self, touches)
end

function BirdBeakEntity:touchMove(touches)
  NodeEntity.touchMove(self, touches)
end

function BirdBeakEntity:touchCancelled(touches)
  NodeEntity.touchCancelled(self, touches)
end

function BirdBeakEntity:render()
  NodeEntity.render(self)
end

function BirdBeakEntity:actionUpdate(action, timeStep)
  NodeEntity.actionUpdate(self, action, timeStep)
end

function BirdBeakEntity:actionComplete(action)
  NodeEntity.actionComplete(self, action)
end

function BirdBeakEntity:collide(otherNode, collisionPoint)
  NodeEntity.collide(self, otherNode, collisionPoint)
end

function BirdBeakEntity:near(otherNode)
  NodeEntity.near(self, otherNode)
end

function BirdBeakEntity:rayTouchDown(rayContact)
  NodeEntity.rayTouchDown(self, rayContact)
end

function BirdBeakEntity:rayTouchUp(rayContact)
  NodeEntity.rayTouchUp(self, rayContact)
end

function BirdBeakEntity:rayTouchMove(rayContact)
  NodeEntity.rayTouchMove(self, rayContact)
end

function BirdBeakEntity:rayTouchCancelled(rayContact)
  NodeEntity.rayTouchCancelled(self, rayContact)
end

function BirdBeakEntity:pause()
  NodeEntity.pause(self)
end

function BirdBeakEntity:unPause()
  NodeEntity.unPause(self)
end

return BirdBeakEntity
