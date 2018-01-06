local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Run = {}
Run.__index = Run

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor() __dtor()
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

function Run:enter()
  BaseClass.enter(self)

  
  self:getNodeEntity():setFrameAction('run', 8)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Run:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Run:exit()
  BaseClass.exit(self)
end

function Run:onMessage()
  BaseClass.onMessage(self)
end

function Run:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Run:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Run:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Run:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Run:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Run:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Run:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Run:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Run:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Run:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Run:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Run:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Run:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Run:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Run:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Run:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Run:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Run:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Run:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Run:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Run:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Run:renderHUD()
  BaseClass.renderHUD(self)
end

function Run:gamePause()
  BaseClass.gamePause(self)
end

function Run:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Run:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Run:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Run:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Run:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Run:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Run:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Run:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Run:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Run:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Run:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Run:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Run, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Run:className()
  return "Run"
end

function Run:class()
  return self
end

function Run:superClass()
  return BaseClass
end

function Run:__gc()
  --Destroy derived class first
  Run._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Run:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Run:_destroy()
  assert(not self.__RunCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Run:_create(init)
  self.__RunCalledLoad = false
  __ctor(self, init)
end

function Run:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__RunCalledLoad = true
end

function Run:unLoad()
  assert(self.__RunCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__RunCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Run
