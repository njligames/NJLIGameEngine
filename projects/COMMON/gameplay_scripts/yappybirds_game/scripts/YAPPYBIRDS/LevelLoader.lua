local LevelLoader = {}
LevelLoader.__index = LevelLoader

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
--#############################################################################

local __ctor = function(self, init)
  --TODO: construct this Entity
  local assetPath = njli.ASSET_PATH("scripts/YAPPYBIRDS/Params.lua")
  self.Params = loadfile(assetPath)()

end

local __dtor = function(self)
  --TODO: destruct this Entity
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--############################################################################# 

--TODO: write function here for LevelLoader
function LevelLoader:loadLevel(...)
  arg=...

  local level = arg.level or 0
  local mode = arg.mode or 'arcade'
  local debug = arg.debug or false

  --- Extract the layer and subLayer number from the layer name.
  -- The layer.name for tile layers should be in the form:
  --      tileLayer_LAYERNUMBER_SUBLAYERNUMBER
  -- @param layerName The name of the layer
  -- @return layer and subLayer
  local extractLayersFromName = function(layerName)
    -- print("extractLayersFromName", layerName)

    local layer, subLayer = 1, 1

    --tileLayer_LAYERNUMBER_SUBLAYERNUMBER
    local length = string.len(layerName)
    local startLayer = string.find(layerName, ";")

    if startLayer ~= nil then
      local layerString = string.sub(layerName, startLayer + 1, length)
      length = string.len(layerString)
      startLayer = string.find(layerString, "_")
      if startLayer ~= nil then
        layer = tonumber(string.sub(layerString, 1, startLayer - 1))
        subLayer = tonumber(string.sub(layerString, startLayer + 1, length))
      end
    end

    local _layer = tonumber(layer)
    local _subLayer = tonumber(subLayer)

    assert(_layer ~= nil, "Unable to extract layer " .. layer)
    assert(_subLayer ~= nil, "Unable to extract subLayer " .. subLayer)

    print("layer = ", layer, "sublayer = ", subLayer)

    return _layer, _subLayer
  end

	local filePath = njli.ASSET_PATH("scripts/generated/tiled/country/arcade_00.lua")

  if debug then
    filePath = njli.ASSET_PATH("scripts/generated/tiled/debug/debugLevel.lua")
  end
  
  local level = loadfile(filePath)()
  -- print_r(level)
  
  self.tiles = self:_parseTiles(level)
  -- print_r(tiles)

  self.backgroundColor = self:_parseBackgroundColor(level)
  -- print(tostring(self.backgroundColor))

  local instanceCount = 0

  self.tileTable = {}
  self.spawnPointTable = {}
  self.wayPointTable = {}

  -- print("There are ", #level.layers, "layers")
  local layerNumber = #level.layers + 1
  for i = 1, #level.layers do
    local layer = level.layers[i]
    -- print(layerNumber, layer.name)
    layerNumber = layerNumber - 1

    -- print_r(layer)

    if layer.visible then

      -- local currentObjectLayer, currentSubObjectLayer = extractLayersFromName(layer.name)
      currentObjectLayer = layerNumber
      currentSubObjectLayer = 1

      if layer.type == "objectgroup" then
        for j = 1, #layer.objects do
          self:_parseObject(layer.objects[j], currentObjectLayer, currentSubObjectLayer)
        end

      elseif layer.type == "tilelayer" then

        self:_parseTileLayer(level, layer, currentObjectLayer, currentSubObjectLayer, instanceCount)
        instanceCount = instanceCount + 1

      end
    end
  end

  -- print(self.backgroundColor)
  -- print_r(self.tileTable)
  -- print_r(self.spawnPointTable)
  -- print_r(self.wayPointTable)

end

function LevelLoader:_parseBirdSpawnPointObject(object, objectLayer, subObjectLayer)

  assert(object.properties.timeStart ~= nil, "There must be a timeStart property on the bird spawn point.")
  assert(object.properties.timeFrequency ~= nil, "There must be a timeFrequency property on the bird spawn point.")
  assert(object.properties.birdType ~= nil, "There must be a birdType property on the bird spawn point.")
  assert(object.properties.spawnAmount ~= nil, "There must be a spawnAmount property on the bird spawn point.")
  assert(object.properties.initialVelocity ~= nil, "There must be a initialVelocity property on the bird spawn point.")

  local spawnPoint = 
  {
    shape = object.shape,
    x = object.x,
    y = 2048 - object.y,
    width = object.width,
    height = object.height,
    rotation = object.rotation,
    enabled = object.visible,
    name = object.name,
    id = object.id,

    timeStart = tonumber(object.properties.timeStart),
    timeFrequency = tonumber(object.properties.timeFrequency),
    birdType = object.properties.birdType,
    spawnAmount = tonumber(object.properties.spawnAmount),
    initialVelocity = tonumber(object.properties.initialVelocity),

    layer = objectLayer,
    sublayer = subObjectLayer
  }

  return spawnPoint
end

function LevelLoader:_parseDogWayPointObject(object, objectLayer, subObjectLayer)

  local wayPoint = 
  {
    x = object.x,
    y = 2048 - object.y,
    layer = objectLayer,
    sublayer = subObjectLayer
  }
  return wayPoint
end

function LevelLoader:_parseObject(object, objectLayer, subObjectLayer)
  --print_r(object)

  if object.type == "birdSpawnPoint" then
    local spawnPoint = self:_parseBirdSpawnPointObject(object, objectLayer, subObjectLayer)
    
    table.insert(self.spawnPointTable, spawnPoint)
    -- print_r(spawnPoint)
  elseif object.type== "dogWayPoint" then
    local dogWayPoint = self:_parseDogWayPointObject(object, objectLayer, subObjectLayer)

    assert(object.id, "There has to be an ID for objects of type dogWayPoint")

    table.insert(self.wayPointTable, object.id, dogWayPoint)
   -- print_r(dogWayPoint)
  end
end

function LevelLoader:_parseTileLayer(level, layer, objectLayer, subObjectLayer, instanceCount)
  local x = layer.x
  local y = layer.y + ((layer.height * level.tileheight) - (level.tilewidth))
  local opacity = layer.opacity

  for j = 1, #layer.data do
    if layer.data[j] ~= 0 then
      local tile = self.tiles[layer.data[j]]

      local instanceName = instanceCount .. "/" .. tile.image
      local tileInfo = 
      {
          x = x,
          y = y,
          layer = objectLayer,
          sublayer = subObjectLayer,
          opacity = opacity,
          tile = tile,
          instanceName = instanceName,
      }

      table.insert(self.tileTable, tileInfo)
    end
    x = x + (level.tilewidth)
    if x >= (layer.width * level.tilewidth) then
        x = layer.x
        y = y - (level.tileheight)
    end
  end
end     

function LevelLoader:_parseBackgroundColor(level)
  local backgroundcolor = bullet.btVector4(1.0, 0.0, 0.0, 1.0)

  if level.backgroundcolor then
    backgroundcolor = bullet.btVector4(level.backgroundcolor[1]/255,
    level.backgroundcolor[2]/255,
    level.backgroundcolor[3]/255,1.0)
  end

  return backgroundcolor
end

function LevelLoader:_parseTiles(level)

  local tiles = {}
  local offset = 0
  for j=1,#level.tilesets do
    local id = level.tilesets[j].firstgid
    for i=1,#level.tilesets[j].tiles do

      local tile = level.tilesets[j].tiles[i]
      -- print_r(tile)

      tiles[id] = {}
      tiles[id].width = tile.width
      tiles[id].height = tile.height

      local img = string.sub(tile.image, 1, string.find(tile.image, ".png")-1)
      -- print("The img `" .. img .. "`")

      img = string.reverse(img)
      -- print("The img `" .. img .. "`")

      if string.find(img, '/') ~= nil then
        img = string.sub(img, 1,string.find(img, '/')-1)
        -- print("The img `" .. img .. "`")
      end

      img = string.reverse(img)

      -- print("The img `" .. img .. "`")

      tiles[id].image = img

      id = id + 1
    end
    offset = offset + 1
  end

  return tiles
end

function LevelLoader:getTile(index)
  return self.tileTable[index]
end

function LevelLoader:numTiles()
  return #self.tileTable
end

function LevelLoader:getBillboardParams(index)
  local tileInfo = self:getTile(index)

  local origin = self.Params:originForLayer(tileInfo)

  local dimensions = self.Params:tileDimensions(tileInfo.tile, origin:z())

  local name = tileInfo.tile.image

  return {origin = origin, dimensions = dimensions, name = name}
end

function LevelLoader:getDogWayPointParams(index)
  assert(index >= 1 and index <= #self.wayPointTable, "way point index is out of range")

  local wayPoint = self.wayPointTable[index]

  local origin = self.Params:originForLayer(wayPoint)

  local dimensions = self.Params:tileDimensions({width=256, height=256}, origin:z())

  return { origin = origin, dimensions = dimensions }
end

function LevelLoader:numDogWayPoints()
  return #self.wayPointTable
end

function LevelLoader:getSpawnPointOrigin(index)
  assert(index >= 1 and index <= #self.spawnPointTable, "spawn point index is out of range")

  local spawnPoint = self.spawnPointTable[index]

  local origin = self.Params:originForLayer(spawnPoint)

  return origin
end

function LevelLoader:numSpawnPoints()
  return #self.spawnPointTable
end

function LevelLoader:getSpawnPoint(index)

  local spawnPoint = self.spawnPointTable[index]
  spawnPoint.origin = self:getSpawnPointOrigin(index)
  spawnPoint.dimensions = self.Params:tileDimensions({width=256, height=256}, spawnPoint.origin:z())

  return spawnPoint
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(LevelLoader, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function LevelLoader:className()
  return "LevelLoader"
end

function LevelLoader:class()
  return self
end

function LevelLoader:superClass()
  return nil
end

function LevelLoader:isa(theClass)
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

function LevelLoader:__gc()
  LevelLoader._destroy(self)
end

function LevelLoader:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function LevelLoader:_destroy()
  assert(not self.__LevelLoaderCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function LevelLoader:_create(init)
  self.__LevelLoaderCalledLoad = false
  
  __ctor(self, init)
end

function LevelLoader:load()
  __load(self)
  
  self.__LevelLoaderCalledLoad = true
end

function LevelLoader:unLoad()
  assert(self.__LevelLoaderCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__LevelLoaderCalledLoad = false
end

return LevelLoader
