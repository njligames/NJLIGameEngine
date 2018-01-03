local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Spawn = {}
Spawn.__index = Spawn

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
  --TODO: construct this Entity
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

function Spawn:enter()
    BaseClass.enter(self)

    --local frameName = self:getNodeEntity():getNode():getName()
    local frameName = self:getNodeEntity():getFrameName()
    local dimensions = self:getNodeEntity()._dimensions
    local origin = self:getNodeEntity()._origin

    print("Spawn:dimensions")
    print_r(dimensions)
    print("Spawn:origin")
    print_r(origin)

    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
    
    self:getNodeEntity():setDimensions(dimensions)
    self:getNodeEntity():getNode():setOrigin(origin)
end

function Spawn:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Spawn:exit()
  BaseClass.exit(self)
end

function Spawn:onMessage()
  BaseClass.onMessage(self)
end

function Spawn:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Spawn:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Spawn:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Spawn:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Spawn:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Spawn:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Spawn:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Spawn:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Spawn:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Spawn:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Spawn:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Spawn:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Spawn:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Spawn:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Spawn:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Spawn:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Spawn:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Spawn:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Spawn:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Spawn:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Spawn:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Spawn:renderHUD()
  BaseClass.renderHUD(self)
end

function Spawn:gamePause()
  BaseClass.gamePause(self)
end

function Spawn:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Spawn:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Spawn:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Spawn:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Spawn:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Spawn:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Spawn:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Spawn:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Spawn:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Spawn:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Spawn:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Spawn:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Spawn, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Spawn:className()
  return "Spawn"
end

function Spawn:class()
  return self
end

function Spawn:superClass()
  return BaseClass
end

function Spawn:__gc()
  --Destroy derived class first
  Spawn._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Spawn:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Spawn:_destroy()
  assert(not self.__SpawnCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Spawn:_create(init)
  self.__SpawnCalledLoad = false
  __ctor(self, init)
end

function Spawn:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SpawnCalledLoad = true
end

function Spawn:unLoad()
  assert(self.__SpawnCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__SpawnCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Spawn
