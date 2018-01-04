local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Bird = {}
Bird.__index = Bird

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
    assert( init, "init variable is nil." )
    assert( type(init) == "table", "Init variable is expecting a states table" )
    assert( init.atlasArray ~= nil, "init.atlasArray variable is nil" )
    assert( init.geometryArray ~= nil, "init.geometryArray variable is nil" )
    assert( init.origin ~= nil, "init.origin variable is nil" )
    assert( init.dimensions ~= nil, "init.dimensions variable is nil" )

    self._scale = init.scale or 1.0
    self._origin = init.origin or bullet.btVector3( 0.0, 0.0, 0.0 )
    self._dimensions = init.dimensions or bullet.btVector2( 1.0, 1.0 )

    self._spriteFrameAtlasArray = init.atlasArray
    self._geometryArray = init.geometryArray

    self.texturePackerArrayIndex = 1

    self:getNode():setGeometry(self._geometryArray[self.texturePackerArrayIndex])

    local physicsBody = njli.PhysicsBodyRigid.create()
    local physicsShape = njli.PhysicsShapeCylinder.create()
    physicsShape:setMargin(1)

    physicsBody:setPhysicsShape(physicsShape)
    self:getNode():setPhysicsBody(physicsBody)

    local function createActionValues()
      local action = njli.Action.create()
      action:setName('run')
      action:setRepeatForever()

      local frameActionName = "idle"
      local frameNumber = 0
      local frameIncrement = 1
      local frameSideName = "front"
      local numberOfFrames = 8

      return action, frameActionName, frameSideName, frameNumber, frameIncrement, numberOfFrames
    end

    self.action, self.frameActionName, self.frameSideName, self.frameNumber, self.frameIncrement, self.numberOfFrames = createActionValues()

    self.animationClock = njli.Clock.create()

end

local __dtor = function(self)
  self:getNode():removeGeometry()
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function Bird:getFrameName()

  local folderName = self:getEntityName() .. "_" .. self:getFrameActionName() .. "_" .. self:getFrameSideName()

  local frameName =  folderName .. "/" .. folderName .. "_" .. string.format("%.5d", self:getFrameNumber())

  return frameName
end

function Bird:getAction()
  return self.action
end

function Bird:getFrameActionName()
  return self.frameActionName
end
 
function Bird:setFrameAction(frameActionName, numberOfFrames)
  self.frameActionName = frameActionName
  self.numberOfFrames = numberOfFrames
end

function Bird:getFrameSideName()
  return self.frameSideName
end

function Bird:getFrameNumber()
  assert(self.frameNumber, "self.frameNumber is nil")
  return self.frameNumber
end

function Bird:getFrameIncrement()
  assert(self.frameIncrement, "self.frameIncrement is nil")
  
  return self.frameIncrement
end

function Bird:incrementFrame()
  self.frameNumber = self:getFrameNumber() + self:getFrameIncrement()
  
  if self:getFrameNumber() > self.numberOfFrames then
    self.frameNumber = 0
  end
end

function Bird:getAnimationClock()
  assert(self.animationClock, "self.animationClock is nil")
  
  return self.animationClock
end

function Bird:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Bird:setSpriteAtlasFrame(nodeStateName, match)
	local parts = nodeStateName:split("[^,%s]+")
  
	local name = nodeStateName
	if #parts ~= 1 then
		name = parts[1] -- .. parts[3]
	end

  assert(self:getNode())
  assert(self:getNode():getGeometry())

  self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlasArray[self.texturePackerArrayIndex], name, match)
end

function Bird:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Bird:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function Bird:show(camera)
  self:getNode():show(camera)
end

function Bird:hide(camera)
  self:getNode():hide(camera)
end

--function Bird:display(enable)
--  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
--    if enable then
--      self:show(OrthographicCameraNode:getCamera())
--    else
--      self:hide(OrthographicCameraNode:getCamera())
--    end
--  end
--end






function Bird:enter()
  BaseClass.enter(self)

  print("Bird:enter()")

  self:getNode():runAction(self:getAction())
end

function Bird:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Bird:exit()
  BaseClass.exit(self)
end

function Bird:onMessage()
  BaseClass.onMessage(self)
end

function Bird:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Bird:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Bird:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Bird:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Bird:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Bird:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Bird:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Bird:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Bird:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Bird:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Bird:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Bird:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Bird:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Bird:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Bird:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Bird:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Bird:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)

  local node = action:getParent()

  if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/30.0) then
    self:getAnimationClock():reset()
    self:incrementFrame()

    self:setSpriteAtlasFrame(self:getFrameName(), false)
  end

end

function Bird:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Bird:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Bird:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Bird:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Bird:renderHUD()
  BaseClass.renderHUD(self)
end

function Bird:gamePause()
  BaseClass.gamePause(self)
end

function Bird:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Bird:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Bird:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Bird:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Bird:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Bird:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Bird:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Bird:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Bird:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Bird:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Bird:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Bird:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Bird, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Bird:className()
  return "Bird"
end

function Bird:class()
  return self
end

function Bird:superClass()
  return BaseClass
end

function Bird:__gc()
  --Destroy derived class first
  Bird._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Bird:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Bird:_destroy()
  assert(not self.__BirdCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Bird:_create(init)
  self.__BirdCalledLoad = false
  __ctor(self, init)
end

function Bird:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BirdCalledLoad = true
end

function Bird:unLoad()
  assert(self.__BirdCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BirdCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Bird
