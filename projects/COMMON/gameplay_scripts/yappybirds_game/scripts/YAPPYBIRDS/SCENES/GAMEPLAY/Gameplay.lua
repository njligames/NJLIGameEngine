local BaseClass = require "NJLI.STATEMACHINE.SceneEntity"

local Gameplay = {}
Gameplay.__index = Gameplay

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
  
  local spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/country0.lua")
  self._spriteAtlas_country0 = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

  local image = njli.Image.create()
  njli.World.getInstance():getWorldResourceLoader():load("images/generated/country0.png", image)
  Geometry2D[1]:getMaterial():getDiffuse():loadGPU(image)
  njli.Image.destroy(image)
  
  
  
  
  spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/gameplay0.lua")
  self._spriteAtlas_gameplay0 = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

  image = njli.Image.create()
  njli.World.getInstance():getWorldResourceLoader():load("images/generated/gameplay0.png", image)
  Geometry2D[2]:getMaterial():getDiffuse():loadGPU(image)
  njli.Image.destroy(image)
  
  
  spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/gameplay1.lua")
  self._spriteAtlas_gameplay1 = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

  image = njli.Image.create()
  njli.World.getInstance():getWorldResourceLoader():load("images/generated/gameplay1.png", image)
  Geometry2D[3]:getMaterial():getDiffuse():loadGPU(image)
  njli.Image.destroy(image)
  
  

  self:getScene():addCameraNode(OrthographicCameraNode, true)
  self:getScene():addCameraNode(PerspectiveCameraNode)
  
  -- local yappyBirdLevelLoader = require "YAPPYBIRDS.yappyBirdLevelLoader"
  -- self.level = yappyBirdLevelLoader.new(self)
  
  self:createBillboard()
--  self:createBalloon()
--  self:createDog()
--  self:createBird({name="jim"})
  
end

local __dtor = function(self)
  njli.SpriteFrameAtlas.destroy(self._spriteAtlas_gameplay1)
  self._spriteAtlas_gameplay1 = nil
  
  njli.SpriteFrameAtlas.destroy(self._spriteAtlas_gameplay0)
  self._spriteAtlas_gameplay0 = nil
  
  njli.SpriteFrameAtlas.destroy(self._spriteAtlas_country0)
  self._spriteAtlas_country0 = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function Gameplay:transfromLevelPositionAndWidth( ... )
  local arg=...
  
  assert(arg, "the paramters are nil in transfromLevelPositionAndWidth")
  
  local x = arg.x or 0
  local y = arg.y or 0
  local layer = arg.layer or 1
  local sublayer = arg.sublayer or 1
  local width = arg.width or 1.0
  local height = arg.height or 1.0
  local pivotPoint = bullet.btVector2(0.0, 0.0)
  
--  local function getGameViewDivisor()
--      local scale = 89.0
--      return math.floor(2048 / scale)
--  end
  
  
  
--  local subLayerOffset = -0.1
--  local divisor = getGameViewDivisor()
--  local x_offset = (0.5 * self.scale )
--  local y_offset = (0.5 * self.scale )

--  local xx = ((self.WORLD_XOFFSET) + ((x/divisor)-x_offset))
--  local yy = ((self.WORLD_YOFFSET) + ((y/divisor)-y_offset))
--  local offset = 0
--  if sublayer ~= nil then
--      offset = (sublayer * subLayerOffset)
--  end

--  local zz = self.LAYER_MAX + (0.1 - (self.LAYER_DISTANCE * (layer - 1))) + offset

--  return bullet.btVector3(xx, yy, zz)
  
  
  
end

function Gameplay:updateTimerDisplay( ... )
  -- body
end

function Gameplay:updateBirdCounterDisplay( ... )
  -- body
end

function Gameplay:updatePointsCounterDisplay( ... )
  -- body
end

function Gameplay:createBird( ... )

  local arg = ...
  assert(arg, "the paramters are nil in createBird")
  assert(arg.name ~= nil, "init.name is nil")
  
  
  local beakNodeEntity = BirdBeakNodeEntity.class({
  entityOwner = self,
  states = BirdBeakNodeEntity.states,
  atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
  geometryArray = {Geometry2D[2], Geometry2D[3]},
  })
  
  local birdNodeEntity = BirdNodeEntity.class({
  name = arg.name,
  entityOwner = self,
  states = BirdNodeEntity.states,
  beakNodeEntity = beakNodeEntity,
  atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
  geometryArray = {Geometry2D[2], Geometry2D[3]},
  })
  self:addNodeEntity(birdNodeEntity)
  
  return birdNodeEntity
  
end

function Gameplay:createDog( ... )

  local dogNodeEntity = DogNodeEntity.class({
  entityOwner = self,
  states = DogNodeEntity.states,
  atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
  geometryArray = {Geometry2D[2], Geometry2D[3]},
  })
  self:addNodeEntity(dogNodeEntity)
  
  return dogNodeEntity
  
end

function Gameplay:createBalloon( ... )

  local balloonNodeEntity = BalloonNodeEntity.class({
  entityOwner = self,
  states = BalloonNodeEntity.states,
  atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
  geometryArray = {Geometry2D[2], Geometry2D[3]},
  })
  self:addNodeEntity(balloonNodeEntity)
  
  return balloonNodeEntity
  
end

function Gameplay:createBillboard( ... )

  local billboardNodeEntity = BillboardNodeEntity.class({
  entityOwner = self,
  states = BillboardNodeEntity.states,
  atlasArray = {self._spriteAtlas_country0},
  geometryArray = {Geometry2D[1]},
  })
  
  self:addNodeEntity(billboardNodeEntity)
  
  return billboardNodeEntity
  
end

function Gameplay:createTimerCounter( ... )
  -- body
end

function Gameplay:createBirdCounter( ... )
  -- body
end

function Gameplay:createPointsCounter( ... )
  -- body
end

--#############################################################################

function Gameplay:enter()
  BaseClass.enter(self)
end

function Gameplay:update(timeStep)
  BaseClass.update(self, timeStep)

--  print("updating gameplay")
end

function Gameplay:exit()
  BaseClass.exit(self)
end

function Gameplay:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Gameplay:renderHUD()
  BaseClass.renderHUD(self)
end

function Gameplay:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Gameplay:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Gameplay:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Gameplay:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Gameplay:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Gameplay:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Gameplay:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Gameplay:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Gameplay:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Gameplay:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Gameplay:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

function Gameplay:pause()
  BaseClass.pause(self)
end

function Gameplay:unPause()
  BaseClass.unPause(self)
end

function Gameplay:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Gameplay:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Gameplay:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Gameplay:willResignActive()
  BaseClass.willResignActive(self)
end

function Gameplay:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Gameplay:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Gameplay:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Gameplay:willTerminate()
  BaseClass.willTerminate(self)
end

function Gameplay:interrupt()
  BaseClass.interrupt(self)
end

function Gameplay:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Gameplay:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Gameplay, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Gameplay:className()
  return "Gameplay"
end

function Gameplay:class()
  return self
end

function Gameplay:superClass()
  return BaseClass
end

function Gameplay:__gc()
  --Destroy derived class first
  Gameplay._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Gameplay:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Gameplay:_destroy()
  assert(not self.__GameplayCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Gameplay:_create(init)
  self.__GameplayCalledLoad = false
  __ctor(self, init)
end

function Gameplay:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GameplayCalledLoad = true
end

function Gameplay:unLoad()
  assert(self.__GameplayCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GameplayCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Gameplay
