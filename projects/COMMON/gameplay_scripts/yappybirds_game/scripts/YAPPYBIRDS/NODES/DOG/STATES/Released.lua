local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Released = {}
Released.__index = Released

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

function Released:enter()
  BaseClass.enter(self)
  
  self:getNodeEntity():setFrameAction('fall', 8)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Released:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Released:exit()
  BaseClass.exit(self)
end

function Released:onMessage()
  BaseClass.onMessage(self)
end

function Released:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Released:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Released:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Released:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Released:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Released:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Released:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Released:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Released:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Released:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Released:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Released:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Released:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Released:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Released:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Released:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Released:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Released:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Released:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Released:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Released:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Released:renderHUD()
  BaseClass.renderHUD(self)
end

function Released:gamePause()
  BaseClass.gamePause(self)
end

function Released:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Released:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Released:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Released:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Released:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Released:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Released:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Released:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Released:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Released:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Released:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Released:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Released, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Released:className()
  return "Released"
end

function Released:class()
  return self
end

function Released:superClass()
  return BaseClass
end

function Released:__gc()
  --Destroy derived class first
  Released._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Released:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Released:_destroy()
  assert(not self.__ReleasedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Released:_create(init)
  self.__ReleasedCalledLoad = false
  __ctor(self, init)
end

function Released:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ReleasedCalledLoad = true
end

function Released:unLoad()
  assert(self.__ReleasedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__ReleasedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Released
