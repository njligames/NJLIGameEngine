local NodeEntity = require "njli.statemachine.nodeentity"

local BirdEntity = {}
BirdEntity.__index = BirdEntity

local json = require('json')

setmetatable(BirdEntity, {
    __index = NodeEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function BirdEntity:className()
  return "BirdEntity"
end

function BirdEntity:class()
  return self
end

function BirdEntity:superClass()
  return NodeEntity
end

function BirdEntity:isa(theClass)
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

function BirdEntity:destroy()
  BirdEntity.__gc(self)
end

function BirdEntity:create(init)

  local nodeEntityInit =
  {
    name = init.name,
    states =
    {
      {
        name = "Fly",
        module = "yappybirds.nodes.Bird.states.Fly"
      },
      {
        name = "Grabbed",
        module = "yappybirds.nodes.Bird.states.Grabbed"
      },
      {
        name = "Grabbing",
        module = "yappybirds.nodes.Bird.states.Grabbing"
      },
      {
        name = "Hit",
        module = "yappybirds.nodes.Bird.states.Hit"
      },
      {
        name = "Pursue",
        module = "yappybirds.nodes.Bird.states.Pursue"
      },
      {
        name = "Spawn",
        module = "yappybirds.nodes.Bird.states.Spawn"
      },

    },
    physicsShape = nil,
    physicsBody = nil,
    sharedGeometry = nil,
  }

  NodeEntity.create(self, nodeEntityInit)

end

function BirdEntity:__gc()
end

function BirdEntity:__tostring()
  return json:stringify(self)
end

function BirdEntity:hasState()
  return NodeEntity.hasState(self)
end

function BirdEntity:getCurrentEntityState()
  return NodeEntity.getCurrentEntityState(self)
end

function BirdEntity:pushState(stateName)
  NodeEntity.pushState(self, stateName)
end

function BirdEntity:getNode()
  return NodeEntity.getNode(self)
end

function BirdEntity:getPhysicsShape()
  return NodeEntity.getPhysicsShape(self)
end

function BirdEntity:getPhysicsBody()
  return NodeEntity.getPhysicsBody(self)
end

function BirdEntity:getAction()
  return NodeEntity.getAction(self)
end

function BirdEntity:getClock()
  return NodeEntity.getClock(self)
end

function BirdEntity:isLoaded()
  return NodeEntity.isLoaded(self)
end

function BirdEntity:load()
  NodeEntity.load(self)
end

function BirdEntity:unLoad()
  NodeEntity.unLoad(self)
end

function BirdEntity:startStateMachine()
  NodeEntity.startStateMachine(self)
end

function BirdEntity:enter()
  NodeEntity.enter(self)
end

function BirdEntity:update(timeStep)
  NodeEntity.update(self, timeStep)
end

function BirdEntity:exit()
  NodeEntity.exit(self)
end

function BirdEntity:onMessage(message)
  NodeEntity.onMessage(self, message)
end

function BirdEntity:touchDown(touches)
  NodeEntity.touchDown(self, touches)
end

function BirdEntity:touchUp(touches)
  NodeEntity.touchUp(self, touches)
end

function BirdEntity:touchMove(touches)
  NodeEntity.touchMove(self, touches)
end

function BirdEntity:touchCancelled(touches)
  NodeEntity.touchCancelled(self, touches)
end

function BirdEntity:render()
  NodeEntity.render(self)
end

function BirdEntity:actionUpdate(action, timeStep)
  NodeEntity.actionUpdate(self, action, timeStep)
end

function BirdEntity:actionComplete(action)
  NodeEntity.actionComplete(self, action)
end

function BirdEntity:collide(otherNode, collisionPoint)
  NodeEntity.collide(self, otherNode, collisionPoint)
end

function BirdEntity:near(otherNode)
  NodeEntity.near(self, otherNode)
end

function BirdEntity:rayTouchDown(rayContact)
  NodeEntity.rayTouchDown(self, rayContact)
end

function BirdEntity:rayTouchUp(rayContact)
  NodeEntity.rayTouchUp(self, rayContact)
end

function BirdEntity:rayTouchMove(rayContact)
  NodeEntity.rayTouchMove(self, rayContact)
end

function BirdEntity:rayTouchCancelled(rayContact)
  NodeEntity.rayTouchCancelled(self, rayContact)
end

function BirdEntity:pause()
  NodeEntity.pause(self)
end

function BirdEntity:unPause()
  NodeEntity.unPause(self)
end

return BirdEntity
