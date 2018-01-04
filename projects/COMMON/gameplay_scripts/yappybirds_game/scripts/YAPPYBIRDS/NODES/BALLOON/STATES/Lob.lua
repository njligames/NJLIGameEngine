local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Lob = {}
Lob.__index = Lob

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

function Lob:enter()
  BaseClass.enter(self)

  self:getNodeEntity():setFrameAction('thrown', 2)

  local frameName = self:getNodeEntity():getFrameName()
  local dimensions = self:getNodeEntity()._dimensions
  local origin = self:getNodeEntity()._origin

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  
  self:getNodeEntity():setDimensions(dimensions)
  self:getNodeEntity():getNode():setOrigin(origin)
end

function Lob:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Lob:exit()
  BaseClass.exit(self)
end

function Lob:onMessage()
  BaseClass.onMessage(self)
end

function Lob:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Lob:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Lob:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Lob:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Lob:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Lob:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Lob:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Lob:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Lob:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Lob:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Lob:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Lob:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Lob:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Lob:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Lob:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Lob:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Lob:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Lob:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Lob:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Lob:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Lob:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Lob:renderHUD()
  BaseClass.renderHUD(self)
end

function Lob:gamePause()
  BaseClass.gamePause(self)
end

function Lob:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Lob:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Lob:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Lob:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Lob:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Lob:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Lob:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Lob:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Lob:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Lob:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Lob:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Lob:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Lob, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Lob:className()
  return "Lob"
end

function Lob:class()
  return self
end

function Lob:superClass()
  return BaseClass
end

function Lob:__gc()
  --Destroy derived class first
  Lob._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Lob:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Lob:_destroy()
  assert(not self.__LobCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Lob:_create(init)
  self.__LobCalledLoad = false
  __ctor(self, init)
end

function Lob:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LobCalledLoad = true
end

function Lob:unLoad()
  assert(self.__LobCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__LobCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Lob
