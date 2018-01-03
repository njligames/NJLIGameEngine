local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Dog = {}
Dog.__index = Dog

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

    self.arrayIndex = 1

    self:getNode():setGeometry(self._geometryArray[self.arrayIndex])


    local physicsBody = njli.PhysicsBodyRigid.create()
    local physicsShape = njli.PhysicsShapeCylinder.create()
    physicsShape:setMargin(1)

    physicsBody:setPhysicsShape(physicsShape)
    self:getNode():setPhysicsBody(physicsBody)





    local function createActionValues()
      local action = njli.Action.create()
      action:setName('run')
      action:setRepeatForever()

      local frameActionName = "run"
      local frameNumber = 0
      local frameIncrement = 1
      local frameSideName = "side"

      return action, frameActionName, frameSideName, frameNumber, frameIncrement
    end

    self.action, self.frameActionName, self.frameSideName, self.frameNumber, self.frameIncrement = createActionValues()


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




function Dog:getAction()
  return self.action
end

function Dog:getFrameActionName()
  return self.frameActionName
end
 
function Dog:setFrameActionName(frameActionName)
  self.frameActionName = frameActionName
end

function Dog:getFrameSideName()
  return self.frameSideName
end

function Dog:getFrameNumber()
  assert(self.frameNumber, "self.frameNumber is nil")
  return self.frameNumber
end

function Dog:getFrameIncrement()
  assert(self.frameIncrement, "self.frameIncrement is nil")
  
  return self.frameIncrement
end

function Dog:incrementFrame()
  self.frameNumber = self:getFrameNumber() + self:getFrameIncrement()
  
  if self:getFrameNumber() > 8 then
    self.frameNumber = 0
  end
end

function Dog:getAnimationClock()
  assert(self.animationClock, "self.animationClock is nil")
  
  return self.animationClock
end

--function Dog:screenPercentWidth(s)
--    if s ~= nil then
--        self._screenPercentWidth = s
--    end
--    return self._screenPercentWidth
--end

--function Dog:screenPercentHeight(s)
--    if s ~= nil then
--        self._screenPercentHeight = s
--    end
--    return self._screenPercentHeight
--end

function Dog:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Dog:setSpriteAtlasFrame(nodeStateName, match)
	local parts = nodeStateName:split("[^,%s]+")
  
	local name = nodeStateName
	if #parts ~= 1 then
		name = parts[1] -- .. parts[3]
	end
  
  assert(self:getNode())
  assert(self:getNode():getGeometry())

  self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlasArray[self.arrayIndex], name, match)
end

function Dog:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Dog:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function Dog:show(camera)
  self:getNode():show(camera)
end

function Dog:hide(camera)
  self:getNode():hide(camera)
end

--function Dog:display(enable)
--  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
--    if enable then
--      self:show(OrthographicCameraNode:getCamera())
--    else
--      self:hide(OrthographicCameraNode:getCamera())
--    end
--  end
--end






function Dog:enter()
  BaseClass.enter(self)

  print("Dog:enter()")

  self:getNode():runAction(self:getAction())
end

function Dog:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Dog:exit()
  BaseClass.exit(self)
end

function Dog:onMessage()
  BaseClass.onMessage(self)
end

function Dog:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Dog:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Dog:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Dog:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Dog:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Dog:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Dog:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Dog:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Dog:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Dog:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Dog:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Dog:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Dog:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Dog:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Dog:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Dog:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Dog:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)

  local node = action:getParent()

  if (self:getAnimationClock():getTimeMilliseconds() / 1000) > (1.0/30.0) then
    self:getAnimationClock():reset()
    self:incrementFrame()

    self:setSpriteAtlasFrame(self:getFrameName(), false)
  end

end

function Dog:getFrameName()

    local folderName = self:getNode():getName() .. "_" .. self:getFrameActionName() .. "_" .. self:getFrameSideName()
    local frameName =  folderName .. "/" .. folderName .. "_" .. string.format("%.5d", self:getFrameNumber())

    return frameName
end

function Dog:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Dog:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Dog:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Dog:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Dog:renderHUD()
  BaseClass.renderHUD(self)
end

function Dog:gamePause()
  BaseClass.gamePause(self)
end

function Dog:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Dog:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Dog:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Dog:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Dog:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Dog:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Dog:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Dog:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Dog:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Dog:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Dog:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Dog:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Dog, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Dog:className()
  return "Dog"
end

function Dog:class()
  return self
end

function Dog:superClass()
  return BaseClass
end

function Dog:__gc()
  --Destroy derived class first
  Dog._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Dog:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Dog:_destroy()
  assert(not self.__DogCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Dog:_create(init)
  self.__DogCalledLoad = false
  __ctor(self, init)
end

function Dog:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__DogCalledLoad = true
end

function Dog:unLoad()
  assert(self.__DogCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__DogCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Dog
