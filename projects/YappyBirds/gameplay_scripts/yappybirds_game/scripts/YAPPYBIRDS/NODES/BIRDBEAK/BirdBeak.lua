local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local BirdBeak = {}
BirdBeak.__index = BirdBeak

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

    self._origin = self._origin - bullet.btVector3(0.0, 0.0, 0.1)

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
      local frameNumber = math.random(0,8)
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

function BirdBeak:getFrameName()

  local folderName = self:getEntityName() .. "_" .. self:getFrameActionName() .. "_" .. self:getFrameSideName()

  local frameName =  folderName .. "/" .. folderName .. "_" .. string.format("%.5d", self:getFrameNumber())

  return frameName
end

function BirdBeak:getAction()
  return self.action
end

function BirdBeak:getFrameActionName()
  return self.frameActionName
end
 
function BirdBeak:setFrameAction(frameActionName, numberOfFrames)
  self.frameActionName = frameActionName
  self.numberOfFrames = numberOfFrames
end

function BirdBeak:getFrameSideName()
  return self.frameSideName
end

function BirdBeak:getFrameNumber()
  assert(self.frameNumber, "self.frameNumber is nil")
  return self.frameNumber
end

function BirdBeak:setFrameNumber(frameNumber)
  self.frameNumber = frameNumber
end

function BirdBeak:getFrameIncrement()
  assert(self.frameIncrement, "self.frameIncrement is nil")
  
  return self.frameIncrement
end

function BirdBeak:incrementFrame()
  self.frameNumber = self:getFrameNumber() + self:getFrameIncrement()
  
  if self:getFrameNumber() > self.numberOfFrames then
    self.frameNumber = 0
  end
end

function BirdBeak:getAnimationClock()
  assert(self.animationClock, "self.animationClock is nil")
  
  return self.animationClock
end

function BirdBeak:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function BirdBeak:setSpriteAtlasFrame(nodeStateName, match)
	local parts = nodeStateName:split("[^,%s]+")
  
	local name = nodeStateName
	if #parts ~= 1 then
		name = parts[1] -- .. parts[3]
	end

  assert(self:getNode())
  assert(self:getNode():getGeometry())

  local idx = -1
  for i = 1, #self._spriteFrameAtlasArray do
    if self._spriteFrameAtlasArray[i]:hasFrame(name) then
      idx = i
      break
    end
  end

  if idx ~= self.texturePackerArrayIndex then
    self.texturePackerArrayIndex = idx
    self:getNode():setGeometry(self._geometryArray[self.texturePackerArrayIndex])
  end

  self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlasArray[self.texturePackerArrayIndex], name, match)

end

function BirdBeak:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function BirdBeak:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function BirdBeak:show(camera)
  self:getNode():show(camera)
end

function BirdBeak:hide(camera)
  self:getNode():hide(camera)
end

--function BirdBeak:display(enable)
--  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
--    if enable then
--      self:show(OrthographicCameraNode:getCamera())
--    else
--      self:hide(OrthographicCameraNode:getCamera())
--    end
--  end
--end






function BirdBeak:enter()
  BaseClass.enter(self)

  print("BirdBeak:enter()")

  self:getNode():runAction(self:getAction())
end

function BirdBeak:update(timeStep)
  BaseClass.update(self, timeStep)
end

function BirdBeak:exit()
  BaseClass.exit(self)
end

function BirdBeak:onMessage()
  BaseClass.onMessage(self)
end

function BirdBeak:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function BirdBeak:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function BirdBeak:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function BirdBeak:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function BirdBeak:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function BirdBeak:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function BirdBeak:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function BirdBeak:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function BirdBeak:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function BirdBeak:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function BirdBeak:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function BirdBeak:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function BirdBeak:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function BirdBeak:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function BirdBeak:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function BirdBeak:near(otherNode)
  BaseClass.near(self, otherNode)
end

function BirdBeak:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)

  local node = action:getParent()

  if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/30.0) then
    self:getAnimationClock():reset()
    self:incrementFrame()

    self:setSpriteAtlasFrame(self:getFrameName(), false)
  end

end

function BirdBeak:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function BirdBeak:keyboardShow()
  BaseClass.keyboardShow(self)
end

function BirdBeak:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function BirdBeak:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function BirdBeak:renderHUD()
  BaseClass.renderHUD(self)
end

function BirdBeak:gamePause()
  BaseClass.gamePause(self)
end

function BirdBeak:gameUnPause()
  BaseClass.gameUnPause(self)
end

function BirdBeak:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function BirdBeak:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function BirdBeak:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function BirdBeak:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function BirdBeak:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function BirdBeak:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function BirdBeak:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function BirdBeak:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function BirdBeak:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function BirdBeak:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function BirdBeak:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BirdBeak, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function BirdBeak:className()
  return "BirdBeak"
end

function BirdBeak:class()
  return self
end

function BirdBeak:superClass()
  return BaseClass
end

function BirdBeak:__gc()
  --Destroy derived class first
  BirdBeak._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function BirdBeak:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BirdBeak:_destroy()
  assert(not self.__BirdBeakCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function BirdBeak:_create(init)
  self.__BirdBeakCalledLoad = false
  __ctor(self, init)
end

function BirdBeak:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BirdBeakCalledLoad = true
end

function BirdBeak:unLoad()
  assert(self.__BirdBeakCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BirdBeakCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return BirdBeak
