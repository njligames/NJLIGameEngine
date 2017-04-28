local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Off = {}
Off.__index = Off

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
--Off Specific
--#############################################################################

--#############################################################################
--NodeEntityState overwrite
--#############################################################################

function Off:enter()
    BaseClass.enter(self)

    local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_off"
    local scale = self:getNodeEntity():scale()

    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
    local dimSprite = self:getNodeEntity():getDimensions()
    self:getNodeEntity():setDimensions(bullet.btVector2( (dimSprite:x() * scale), (dimSprite:y() * scale) ))

    self:getNodeEntity()._on = false
end

function Off:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Off:exit()
  BaseClass.exit(self)
end

function Off:onMessage()
  BaseClass.onMessage(self)
end

function Off:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
  if not self:getNodeEntity():disabled() then
      self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Phasing")
  end
end

function Off:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
    -- if not self:getNodeEntity():disabled() then
    --     self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.On")
    -- end
end

function Off:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Off:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Off:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)
end

function Off:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Off:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Off:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Off:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Off:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Off:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Off:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Off:renderHUD()
    BaseClass.renderHUD(self)
end

function Off:gamePause()
    BaseClass.gamePause(self)
end

function Off:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Off:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Off:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Off:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Off:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Off, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Off:className()
  return "Off"
end

function Off:class()
  return self
end

function Off:superClass()
  return BaseClass
end

function Off:__gc()
  --Destroy derived class first
  Off._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Off:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Off:_destroy()
  assert(not self.__OffCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Off:_create(init)
  self.__OffCalledLoad = false
  __ctor(self, init)
end

function Off:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__OffCalledLoad = true
end

function Off:unLoad()
  assert(self.__OffCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__OffCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Off
