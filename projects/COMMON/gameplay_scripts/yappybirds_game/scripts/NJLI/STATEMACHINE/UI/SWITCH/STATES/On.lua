local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local On = {}
On.__index = On

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
--On Specific
--#############################################################################

--#############################################################################
--NodeEntityState overwrite
--#############################################################################

function On:enter()
    BaseClass.enter(self)

    local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_on"
    local scale = self:getNodeEntity():scale()

    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
    local dimSprite = self:getNodeEntity():getDimensions()
    self:getNodeEntity():setDimensions(bullet.btVector2( (dimSprite:x() * scale), (dimSprite:y() * scale) ))

    self:getNodeEntity()._on = true
end

function On:update(timeStep)
  BaseClass.update(self, timeStep)
end

function On:exit()
  BaseClass.exit(self)
end

function On:onMessage()
  BaseClass.onMessage(self)
end

function On:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
  if not self:getNodeEntity():disabled() then
      self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Phasing")
  end
end

function On:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
    -- if not self:getNodeEntity():disabled() then
    --     self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Off")
    -- end
end

function On:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function On:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function On:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)
end

function On:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function On:near(otherNode)
  BaseClass.near(self, otherNode)
end

function On:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function On:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function On:keyboardShow()
  BaseClass.keyboardShow(self)
end

function On:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function On:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function On:renderHUD()
    BaseClass.renderHUD(self)
end

function On:gamePause()
    BaseClass.gamePause(self)
end

function On:gameUnPause()
    BaseClass.gameUnPause(self)
end

function On:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function On:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function On:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function On:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(On, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function On:className()
  return "On"
end

function On:class()
  return self
end

function On:superClass()
  return BaseClass
end

function On:__gc()
  --Destroy derived class first
  On._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function On:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function On:_destroy()
  assert(not self.__OnCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function On:_create(init)
  self.__OnCalledLoad = false
  __ctor(self, init)
end

function On:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__OnCalledLoad = true
end

function On:unLoad()
  assert(self.__OnCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__OnCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return On
