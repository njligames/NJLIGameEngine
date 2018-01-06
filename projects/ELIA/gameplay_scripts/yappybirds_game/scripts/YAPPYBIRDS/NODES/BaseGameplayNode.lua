local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local BaseGameplayNode = {}
BaseGameplayNode.__index = BaseGameplayNode

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor()
-- __dtor()
-- __load()
-- __unLoad()
--#############################################################################

local __ctor = function(self, init)
  assert(init, "init variable is nil.")
  assert(type(init) == "table", "Init variable is expecting a states table")
  assert(init.atlas ~= nil, "init.atlas variable is nil")
  assert(init.geometry ~= nil, "init.geometry variable is nil")
  
  local node = self:getNode()

  node:setGeometry(init.geometry)

  self._spriteFrameAtlas = init.atlas

  self._physicsShape = njli.PhysicsShapeBox.create()

  self._physicsBody = njli.PhysicsBodyRigid.create()
  self._physicsBody:setDynamicPhysics()
  self._physicsBody:setPhysicsShape(self._physicsShape)

  node:setPhysicsBody(self._physicsBody)
end

local __dtor = function(self)
  njli.PhysicsBodyRigid.destroy(self._physicsBody)
  self._physicsBody = nil

  njli.PhysicsShapeBox.destroy(self._physicsShape)
  self._physicsShape = nil

  self._spriteFrameAtlas = nil

  self:getNode():removeGeometry()
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function BaseGameplayNode:enter()
  BaseClass.enter(self)
end

function BaseGameplayNode:update(timeStep)
  BaseClass.update(self, timeStep)
end

function BaseGameplayNode:exit()
  BaseClass.exit(self)
end

function BaseGameplayNode:onMessage()
  BaseClass.onMessage(self)
end

function BaseGameplayNode:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function BaseGameplayNode:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function BaseGameplayNode:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function BaseGameplayNode:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function BaseGameplayNode:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function BaseGameplayNode:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function BaseGameplayNode:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function BaseGameplayNode:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function BaseGameplayNode:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function BaseGameplayNode:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function BaseGameplayNode:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function BaseGameplayNode:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function BaseGameplayNode:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function BaseGameplayNode:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function BaseGameplayNode:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function BaseGameplayNode:near(otherNode)
  BaseClass.near(self, otherNode)
end

function BaseGameplayNode:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function BaseGameplayNode:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function BaseGameplayNode:keyboardShow()
  BaseClass.keyboardShow(self)
end

function BaseGameplayNode:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function BaseGameplayNode:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function BaseGameplayNode:renderHUD()
  BaseClass.renderHUD(self)
end

function BaseGameplayNode:gamePause()
  BaseClass.gamePause(self)
end

function BaseGameplayNode:gameUnPause()
  BaseClass.gameUnPause(self)
end

function BaseGameplayNode:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function BaseGameplayNode:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function BaseGameplayNode:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function BaseGameplayNode:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function BaseGameplayNode:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function BaseGameplayNode:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function BaseGameplayNode:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function BaseGameplayNode:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function BaseGameplayNode:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function BaseGameplayNode:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function BaseGameplayNode:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BaseGameplayNode, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function BaseGameplayNode:className()
  return "BaseGameplayNode"
end

function BaseGameplayNode:class()
  return self
end

function BaseGameplayNode:superClass()
  return BaseClass
end

function BaseGameplayNode:__gc()
  --Destroy derived class first
  BaseGameplayNode._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function BaseGameplayNode:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BaseGameplayNode:_destroy()
  assert(not self.__BaseGameplayNodeCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function BaseGameplayNode:_create(init)
  self.__BaseGameplayNodeCalledLoad = false
  __ctor(self, init)
end

function BaseGameplayNode:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BaseGameplayNodeCalledLoad = true
end

function BaseGameplayNode:unLoad()
  assert(self.__BaseGameplayNodeCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BaseGameplayNodeCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return BaseGameplayNode
