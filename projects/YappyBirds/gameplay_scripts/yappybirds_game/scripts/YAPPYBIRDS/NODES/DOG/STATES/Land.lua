local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Land = {}
Land.__index = Land

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

function Land:enter()
  BaseClass.enter(self)
  
  self:getNodeEntity():setFrameAction('idle', 8)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Land:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Land:exit()
  BaseClass.exit(self)
end

function Land:onMessage()
  BaseClass.onMessage(self)
end

function Land:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Land:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Land:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Land:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Land:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Land:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Land:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Land:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Land:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Land:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Land:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Land:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Land:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Land:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Land:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Land:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Land:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Land:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Land:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Land:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Land:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Land:renderHUD()
  BaseClass.renderHUD(self)
end

function Land:gamePause()
  BaseClass.gamePause(self)
end

function Land:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Land:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Land:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Land:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Land:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Land:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Land:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Land:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Land:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Land:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Land:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Land:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Land, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Land:className()
  return "Land"
end

function Land:class()
  return self
end

function Land:superClass()
  return BaseClass
end

function Land:__gc()
  --Destroy derived class first
  Land._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Land:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Land:_destroy()
  assert(not self.__LandCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Land:_create(init)
  self.__LandCalledLoad = false
  __ctor(self, init)
end

function Land:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LandCalledLoad = true
end

function Land:unLoad()
  assert(self.__LandCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__LandCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Land
