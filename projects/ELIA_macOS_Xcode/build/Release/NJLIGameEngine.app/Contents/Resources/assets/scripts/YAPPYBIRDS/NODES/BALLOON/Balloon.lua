local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Balloon = {}
Balloon.__index = Balloon

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

      local frameActionName = "thrown"
      local frameNumber = math.random(0,2)
      local frameIncrement = 1
      local frameSideName = "front"
      local numberOfFrames = 3

      return action, 
      frameActionName, 
      frameSideName, 
      frameNumber, 
      frameIncrement, 
      numberOfFrames
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

function Balloon:getFrameName()
  local folderName = self:getEntityName() .. "_" .. self:getFrameActionName() .. "_" .. self:getFrameSideName()
  local frameName =  folderName .. "/" .. folderName .. "_" .. string.format("%.5d", self:getFrameNumber())

  return frameName
end

function Balloon:getAction()
  return self.action
end

function Balloon:getFrameActionName()
  return self.frameActionName
end
 
function Balloon:setFrameAction(frameActionName, numberOfFrames)
  self.frameActionName = frameActionName
  self.numberOfFrames = numberOfFrames
end

function Balloon:getFrameSideName()
  return self.frameSideName
end

function Balloon:getFrameNumber()
  assert(self.frameNumber, "self.frameNumber is nil")
  return self.frameNumber
end

function Balloon:getFrameIncrement()
  assert(self.frameIncrement, "self.frameIncrement is nil")
  
  return self.frameIncrement
end

function Balloon:incrementFrame()
  self.frameNumber = self:getFrameNumber() + self:getFrameIncrement()
  
  if self:getFrameNumber() > self.numberOfFrames then
    self.frameNumber = 0
  end
end

function Balloon:getAnimationClock()
  assert(self.animationClock, "self.animationClock is nil")
  
  return self.animationClock
end

function Balloon:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Balloon:setSpriteAtlasFrame(nodeStateName, match)
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

function Balloon:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Balloon:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function Balloon:show(camera)
  self:getNode():show(camera)
end

function Balloon:hide(camera)
  self:getNode():hide(camera)
end

--function Balloon:display(enable)
--  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
--    if enable then
--      self:show(OrthographicCameraNode:getCamera())
--    else
--      self:hide(OrthographicCameraNode:getCamera())
--    end
--  end
--end






function Balloon:enter()
  BaseClass.enter(self)

  print("Balloon:enter()")

  self:getNode():runAction(self:getAction())
end

function Balloon:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Balloon:exit()
  BaseClass.exit(self)
end

function Balloon:onMessage()
  BaseClass.onMessage(self)
end

function Balloon:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Balloon:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Balloon:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Balloon:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Balloon:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Balloon:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Balloon:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Balloon:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Balloon:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Balloon:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Balloon:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Balloon:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Balloon:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Balloon:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Balloon:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Balloon:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Balloon:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)

  local node = action:getParent()

  if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/30.0) then
    self:getAnimationClock():reset()
    self:incrementFrame()

    self:setSpriteAtlasFrame(self:getFrameName(), false)
  end

end

function Balloon:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Balloon:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Balloon:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Balloon:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Balloon:renderHUD()
  BaseClass.renderHUD(self)
end

function Balloon:gamePause()
  BaseClass.gamePause(self)
end

function Balloon:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Balloon:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Balloon:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Balloon:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Balloon:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Balloon:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Balloon:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Balloon:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Balloon:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Balloon:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Balloon:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Balloon:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Balloon, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Balloon:className()
  return "Balloon"
end

function Balloon:class()
  return self
end

function Balloon:superClass()
  return BaseClass
end

function Balloon:__gc()
  --Destroy derived class first
  Balloon._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Balloon:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Balloon:_destroy()
  assert(not self.__BalloonCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Balloon:_create(init)
  self.__BalloonCalledLoad = false
  __ctor(self, init)
end

function Balloon:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BalloonCalledLoad = true
end

function Balloon:unLoad()
  assert(self.__BalloonCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BalloonCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Balloon
