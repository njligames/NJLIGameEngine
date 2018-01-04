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

  local debug = false
  
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

  if debug then
    spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/debug0.lua")
    self._spriteAtlas_debug = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

    image = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/generated/debug0.png", image)
    Geometry2D[4]:getMaterial():getDiffuse():loadGPU(image)
    njli.Image.destroy(image)
  end

  self:getScene():addCameraNode(OrthographicCameraNode, true)
  self:getScene():addCameraNode(PerspectiveCameraNode)

  local LevelLoader = require "YAPPYBIRDS.LevelLoader"
  self.levelLoader = LevelLoader()
  self.levelLoader:loadLevel({debug=debug})


  for i = 1, self.levelLoader:numTiles() do

    local billboardParams = self.levelLoader:getBillboardParams(i)

    self:createBillboard({
    name=billboardParams.name,
    origin=billboardParams.origin,
    dimensions=billboardParams.dimensions,
    visible=true,
    debug=debug
    })
    
  end

  njli.World.getInstance():setBackgroundColor(self.levelLoader.backgroundColor)

  -- print_r(self.levelLoader:getDogWayPointParams(1))

  -- print("getSpawnPointOrigin", self.levelLoader:getSpawnPointOrigin(1))

  -- print("self.levelLoader:getDogWayPointParams(1).origin", self.levelLoader:getDogWayPointParams(1).origin)
  















  -- for i = 1, self.levelLoader:numDogWayPoints() do
  --   self:createDog({
  --     name="character_dog",
  --     origin=self.levelLoader:getDogWayPointParams(i).origin,
  --     dimensions=self.levelLoader:getDogWayPointParams(i).dimensions,
  --     visible=true,
  --     debug=debug
  --     })
  -- end















  -- local colors = {}
  -- table.insert(colors, "Blue")
  -- table.insert(colors, "Green")
  -- table.insert(colors, "Purple")
  -- table.insert(colors, "Red")
  -- table.insert(colors, "Yellow")
  -- 
  -- for i = 1, self.levelLoader:numDogWayPoints() do
  --   local colorIdx = i % (#colors + 1)

  --   self:createBalloon({
  --     name="projectile_waterBalloon",
  --     color=colors[colorIdx],
  --     origin=self.levelLoader:getDogWayPointParams(i).origin,
  --     dimensions=self.levelLoader:getDogWayPointParams(i).dimensions,
  --     visible=true,
  --     debug=debug
  --     })
  -- end










  local birdNames = {}
  table.insert(birdNames, "chubi")
  table.insert(birdNames, "garu")
  table.insert(birdNames, "momi")
  table.insert(birdNames, "puffy")
  table.insert(birdNames, "webo")
  table.insert(birdNames, "zuru")
  for i = 1, self.levelLoader:numDogWayPoints() do
    local birdIdx = i % (#birdNames + 1)

    self:createBird({
      birdType=birdNames[i],
      origin=self.levelLoader:getDogWayPointParams(i).origin,
      dimensions=self.levelLoader:getDogWayPointParams(i).dimensions,
      visible=true,
      debug=debug
      })
  end


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

-- function Gameplay:transfromLevelPositionAndWidth( ... )
--   local arg=...
  
--   assert(arg, "the paramters are nil in transfromLevelPositionAndWidth")
  
--   local x = arg.x or 0
--   local y = arg.y or 0
--   local layer = arg.layer or 1
--   local sublayer = arg.sublayer or 1
--   local width = arg.width or 1.0
--   local height = arg.height or 1.0
--   local pivotPoint = bullet.btVector2(0.0, 0.0)
  
-- --  local function getGameViewDivisor()
-- --      local scale = 89.0
-- --      return math.floor(2048 / scale)
-- --  end
  
  
  
-- --  local subLayerOffset = -0.1
-- --  local divisor = getGameViewDivisor()
-- --  local x_offset = (0.5 * self.scale )
-- --  local y_offset = (0.5 * self.scale )

-- --  local xx = ((self.WORLD_XOFFSET) + ((x/divisor)-x_offset))
-- --  local yy = ((self.WORLD_YOFFSET) + ((y/divisor)-y_offset))
-- --  local offset = 0
-- --  if sublayer ~= nil then
-- --      offset = (sublayer * subLayerOffset)
-- --  end

-- --  local zz = self.LAYER_MAX + (0.1 - (self.LAYER_DISTANCE * (layer - 1))) + offset

-- --  return bullet.btVector3(xx, yy, zz)
  
  
  
-- end

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
  arg=...
  
  local birdType = arg.birdType or "chubi"
  local visible = arg.visible or true
  local origin = arg.origin or bullet.btVector3( 0.0, 0.0, 10.0 )
  local dimensions = arg.dimensions or bullet.btVector2( 1.0, 1.0 )
  local debug = arg.debug or false

  local load_tbl = {
    name = "character_" .. birdType .. "Bird",
    birdType = birdType,
    states = BirdNodeEntity.states,
    entityOwner = self,
    atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
    geometryArray = {Geometry2D[2], Geometry2D[3]},
    origin = origin,
    dimensions = dimensions,
  }

  local entity = BirdNodeEntity.class(load_tbl)
  
  self:addNodeEntity(entity)
  
  entity:show(PerspectiveCameraNode:getCamera())
  entity:hide(OrthographicCameraNode:getCamera())
  
  return entity
  

--   local arg = ...
--   assert(arg, "the paramters are nil in createBird")
--   assert(arg.name ~= nil, "init.name is nil")
--   
--   
--   local beakNodeEntity = BirdBeakNodeEntity.class({
--   entityOwner = self,
--   states = BirdBeakNodeEntity.states,
--   atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
--   geometryArray = {Geometry2D[2], Geometry2D[3]},
--   })
--   
--   local birdNodeEntity = BirdNodeEntity.class({
--   name = arg.name,
--   entityOwner = self,
--   states = BirdNodeEntity.states,
--   beakNodeEntity = beakNodeEntity,
--   atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
--   geometryArray = {Geometry2D[2], Geometry2D[3]},
--   })
--   self:addNodeEntity(birdNodeEntity)
--   
--   return birdNodeEntity
  
end

function Gameplay:createDog( ... )
  arg=...
  
  local name = arg.name or "character_dog"
  local visible = arg.visible or true
  local origin = arg.origin or bullet.btVector3( 0.0, 0.0, 10.0 )
  local dimensions = arg.dimensions or bullet.btVector2( 1.0, 1.0 )
  local debug = arg.debug or false

  local load_tbl = {
    name = name,
    states = DogNodeEntity.states,
    entityOwner = self,
    atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
    geometryArray = {Geometry2D[2], Geometry2D[3]},
    origin = origin,
    dimensions = dimensions,
  }

  local dogNodeEntity = DogNodeEntity.class(load_tbl)
  
  self:addNodeEntity(dogNodeEntity)
  
  dogNodeEntity:show(PerspectiveCameraNode:getCamera())
  dogNodeEntity:hide(OrthographicCameraNode:getCamera())
  
  return dogNodeEntity
  
end

function Gameplay:createBalloon( ... )
  arg=...
  
  local color = arg.color or "Blue"
  local name = arg.name or "projectile_waterBalloon"
  local visible = arg.visible or true
  local origin = arg.origin or bullet.btVector3( 0.0, 0.0, 10.0 )
  local dimensions = arg.dimensions or bullet.btVector2( 1.0, 1.0 )
  local debug = arg.debug or false

  local load_tbl = {
    name = name .. color,
    color = color,
    states = BalloonNodeEntity.states,
    entityOwner = self,
    atlasArray = {self._spriteAtlas_gameplay0, self._spriteAtlas_gameplay1},
    geometryArray = {Geometry2D[2], Geometry2D[3]},
    origin = origin,
    dimensions = dimensions,
  }

  local entity = BalloonNodeEntity.class(load_tbl)
  
  self:addNodeEntity(entity)
  
  entity:show(PerspectiveCameraNode:getCamera())
  entity:hide(OrthographicCameraNode:getCamera())
  
  return entity
  
end

function Gameplay:createBillboard( ... )
  arg=...
  
  local name = arg.name or "512tree00"
  local visible = arg.visible or true
  local origin = arg.origin or bullet.btVector3( 0.0, 0.0, 0.0 )
  local dimensions = arg.dimensions or bullet.btVector2( 1.0, 1.0 )
  local debug = arg.debug or false

  local load_tbl = {
    name = name,
    states = BillboardNodeEntity.states,
    entityOwner = self,
    atlas = self._spriteAtlas_country0,
    geometry = Geometry2D[1],
    origin = origin,
    dimensions = dimensions,
  }

  if debug then
    load_tbl.atlas = self._spriteAtlas_debug
    load_tbl.geometry = Geometry2D[4]
  end

  local billboardNodeEntity = BillboardNodeEntity.class(load_tbl)
  
  self:addNodeEntity(billboardNodeEntity)
  
  billboardNodeEntity:show(PerspectiveCameraNode:getCamera())
  billboardNodeEntity:hide(OrthographicCameraNode:getCamera())
  
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
