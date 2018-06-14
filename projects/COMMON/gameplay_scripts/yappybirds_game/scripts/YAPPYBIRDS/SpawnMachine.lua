
local SpawnMachine = {}
SpawnMachine.__index = SpawnMachine

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

  self.totalTicks = 0
  self.arcadeSpawnPoints = {}
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

--TODO: write function here for SpawnMachine

function SpawnMachine:tick(timeStep, gameplay)
  self.totalTicks = self.totalTicks + timeStep
  self.gameplay = gameplay

  for key, arcadeSpawnPoint in pairs(self.arcadeSpawnPoints) do

    if arcadeSpawnPoint.currentTick <= 0 and 
      arcadeSpawnPoint.spawnPoint.spawnAmount > 0 then

      arcadeSpawnPoint.currentTick = 0

      self:createBirdNode(arcadeSpawnPoint)

    end

    if self.totalTicks > arcadeSpawnPoint.spawnPoint.timeStart then
      arcadeSpawnPoint.currentTick = arcadeSpawnPoint.currentTick - timeStep
    end

  end
end

function SpawnMachine:addArcadeSpawnPoint(spawnPoint)

  local point = {}
  point.spawnPoint = spawnPoint
  point.currentTick = spawnPoint.timeFrequency

  table.insert(self.arcadeSpawnPoints, point)

end

function SpawnMachine:createBirdNode(spawnPoint)
  assert(spawnPoint.spawnPoint.spawnAmount > 0, "There must be more than 0 spawnAmount")

  -- TODO: Actually spawn the bird
  print("create bird")
  print("birdType", spawnPoint.spawnPoint.birdType)
  print("origin", spawnPoint.spawnPoint.origin)
  print("dimensions", spawnPoint.spawnPoint.dimensions)

  print_r(spawnPoint)

  self.gameplay:createBird({
    birdType=spawnPoint.spawnPoint.birdType,
    origin=spawnPoint.spawnPoint.origin,
    dimensions=spawnPoint.spawnPoint.dimensions,
    visible=true,
    debug=debug
    })

  -- self.gameplay

  spawnPoint.spawnPoint.spawnAmount = spawnPoint.spawnPoint.spawnAmount - 1
  spawnPoint.currentTick = spawnPoint.spawnPoint.timeFrequency

end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SpawnMachine, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function SpawnMachine:className()
  return "SpawnMachine"
end

function SpawnMachine:class()
  return self
end

function SpawnMachine:superClass()
  return nil
end

function SpawnMachine:isa(theClass)
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

function SpawnMachine:__gc()
  SpawnMachine._destroy(self)
end

function SpawnMachine:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SpawnMachine:_destroy()
  assert(not self.__SpawnMachineCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function SpawnMachine:_create(init)
  self.__SpawnMachineCalledLoad = false
  
  __ctor(self, init)
end

function SpawnMachine:load()
  __load(self)
  
  self.__SpawnMachineCalledLoad = true
end

function SpawnMachine:unLoad()
  assert(self.__SpawnMachineCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__SpawnMachineCalledLoad = false
end

return SpawnMachine
