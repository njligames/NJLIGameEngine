local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Disabled = {}
Disabled.__index = Disabled

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

function Disabled:enter()
	BaseClass.enter(self)

    local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_dis"
    local scale = self:getNodeEntity():scale()

    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
    local dimSprite = self:getNodeEntity():getDimensions()
    self:getNodeEntity():setDimensions(bullet.btVector2( (dimSprite:x() * scale), (dimSprite:y() * scale) ))
end

function Disabled:update(timeStep)
	BaseClass.update(self, timeStep)
end

function Disabled:exit()
	BaseClass.exit(self)
end

function Disabled:onMessage()
	BaseClass.onMessage(self)
end

function Disabled:rayTouchDown(rayContact)
	BaseClass.rayTouchDown(self, rayContact)
end

function Disabled:rayTouchUp(rayContact)
	BaseClass.rayTouchUp(self, rayContact)
end

function Disabled:rayTouchMove(rayContact)
	BaseClass.rayTouchMove(self, rayContact)
end

function Disabled:rayTouchCancelled(rayContact)
	BaseClass.rayTouchCancelled(self, rayContact)
end

function Disabled:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)
end

function Disabled:collide(otherNode, collisionPoint)
	BaseClass.collide(self, collisionPoint)
end

function Disabled:near(otherNode)
	BaseClass.near(self, otherNode)
end

function Disabled:actionUpdate(action, timeStep)
	BaseClass.actionUpdate(self, timeStep)
end

function Disabled:actionComplete(action)
	BaseClass.actionComplete(self, action)
end

function Disabled:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Disabled:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Disabled:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Disabled:renderHUD()
    BaseClass.renderHUD(self)
end

function Disabled:gamePause()
    BaseClass.gamePause(self)
end

function Disabled:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Disabled:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Disabled:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Disabled:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Disabled:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Disabled, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Disabled:className()
  return "Disabled"
end

function Disabled:class()
  return self
end

function Disabled:superClass()
  return BaseClass
end

function Disabled:__gc()
  --Destroy derived class first
  Disabled._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Disabled:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Disabled:_destroy()
  assert(not self.__DisabledCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Disabled:_create(init)
  self.__DisabledCalledLoad = false
  __ctor(self, init)
end

function Disabled:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__DisabledCalledLoad = true
end

function Disabled:unLoad()
  assert(self.__DisabledCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__DisabledCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Disabled
