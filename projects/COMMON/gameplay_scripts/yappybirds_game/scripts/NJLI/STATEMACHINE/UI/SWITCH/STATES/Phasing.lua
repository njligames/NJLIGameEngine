local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Phasing = {}
Phasing.__index = Phasing

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
--Phasing Specific
--#############################################################################

--#############################################################################
--NodeEntityState overwrite
--#############################################################################

function Phasing:enter()
    BaseClass.enter(self)

    local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_on"
    if self:getNodeEntity()._on then
      frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_on"
    else
      frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_off"
    end

    local scale = self:getNodeEntity():scale() * 1.1

    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
    local dimSprite = self:getNodeEntity():getDimensions()
    self:getNodeEntity():setDimensions(bullet.btVector2( (dimSprite:x() * scale), (dimSprite:y() * scale) ))

end

function Phasing:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Phasing:exit()
  BaseClass.exit(self)
end

function Phasing:onMessage()
  BaseClass.onMessage(self)
end

function Phasing:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Phasing:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
  if not self:getNodeEntity():disabled() then
    if self:getNodeEntity()._on then
      self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Off")
    else
      self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.On")
    end
  end
end

function Phasing:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Phasing:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Phasing:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)
    if not self:getNodeEntity():disabled() then
      if self:getNodeEntity()._on then
        self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.On")
      else
        self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Off")
      end
    end
end

function Phasing:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
end

function Phasing:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Phasing:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
end

function Phasing:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Phasing:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Phasing:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Phasing:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Phasing:renderHUD()
    BaseClass.renderHUD(self)
end

function Phasing:gamePause()
    BaseClass.gamePause(self)
end

function Phasing:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Phasing:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Phasing:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Phasing:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Phasing:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Phasing, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Phasing:className()
  return "Phasing"
end

function Phasing:class()
  return self
end

function Phasing:superClass()
  return BaseClass
end

function Phasing:__gc()
  --Destroy derived class first
  Phasing._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Phasing:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Phasing:_destroy()
  assert(not self.__OffCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Phasing:_create(init)
  self.__OffCalledLoad = false
  __ctor(self, init)
end

function Phasing:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__OffCalledLoad = true
end

function Phasing:unLoad()
  assert(self.__OffCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__OffCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Phasing
