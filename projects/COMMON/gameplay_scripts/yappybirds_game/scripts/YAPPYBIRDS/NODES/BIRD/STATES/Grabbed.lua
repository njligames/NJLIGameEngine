local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Grabbed = {}
Grabbed.__index = Grabbed

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

function Grabbed:enter()
  BaseClass.enter(self)

  self:getNodeEntity():setFrameAction('grab', 8)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Grabbed:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Grabbed:exit()
  BaseClass.exit(self)
end

function Grabbed:onMessage()
  BaseClass.onMessage(self)
end

function Grabbed:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Grabbed:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Grabbed:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Grabbed:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Grabbed:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Grabbed:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Grabbed:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Grabbed:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Grabbed:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Grabbed:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Grabbed:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Grabbed:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Grabbed:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Grabbed:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Grabbed:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Grabbed:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Grabbed:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Grabbed:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Grabbed:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Grabbed:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Grabbed:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Grabbed:renderHUD()
  BaseClass.renderHUD(self)
end

function Grabbed:gamePause()
  BaseClass.gamePause(self)
end

function Grabbed:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Grabbed:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Grabbed:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Grabbed:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Grabbed:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Grabbed:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Grabbed:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Grabbed:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Grabbed:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Grabbed:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Grabbed:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Grabbed:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Grabbed, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Grabbed:className()
  return "Grabbed"
end

function Grabbed:class()
  return self
end

function Grabbed:superClass()
  return BaseClass
end

function Grabbed:__gc()
  --Destroy derived class first
  Grabbed._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Grabbed:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Grabbed:_destroy()
  assert(not self.__GrabbedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Grabbed:_create(init)
  self.__GrabbedCalledLoad = false
  __ctor(self, init)
end

function Grabbed:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GrabbedCalledLoad = true
end

function Grabbed:unLoad()
  assert(self.__GrabbedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GrabbedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Grabbed
