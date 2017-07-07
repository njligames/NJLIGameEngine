local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Selected = {}
Selected.__index = Selected

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

function Selected:enter()
    BaseClass.enter(self)

--    local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_on"
--    local scale = self:getNodeEntity():scale()

--    self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
--    local dimSprite = self:getNodeEntity():getDimensions()
--    self:getNodeEntity():setDimensions(bullet.btVector2( (dimSprite:x() * scale), (dimSprite:y() * scale) ))

  local frameName = "butn_" .. self:getNodeEntity():getNode():getName() .. "_on"
  local scale = self:getNodeEntity():scale()
  
  local pw = self:getNodeEntity():screenPercentWidth()
  local ph = self:getNodeEntity():screenPercentHeight()

  self:getNodeEntity():setSpriteAtlasFrame(frameName, true)
  local dimSprite = self:getNodeEntity():getDimensions()
  
  self:getNodeEntity():setDimensions(scaleDimension(dimSprite, pw, ph))
end

function Selected:update(timeStep)
	BaseClass.update(self, timeStep)
end

function Selected:exit()
	BaseClass.exit(self)
end

function Selected:onMessage()
	BaseClass.onMessage(self)
end

function Selected:rayTouchesDown(rayContact)
	BaseClass.rayTouchesDown(self, rayContact)
end

function Selected:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
  self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")
end

function Selected:rayTouchesMove(rayContact)
	BaseClass.rayTouchesMove(self, rayContact)
end

function Selected:rayTouchesCancelled(rayContact)
	BaseClass.rayTouchesCancelled(self, rayContact)
end

function Selected:rayTouchesMissed(node)
    BaseClass.rayTouchesMissed(self, node)

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchDragOutside()
    end
end

function Selected:rayTouchDown(rayContact)
	BaseClass.rayTouchDown(self, rayContact)
end

function Selected:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
  self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")
end

function Selected:rayTouchMove(rayContact)
	BaseClass.rayTouchMove(self, rayContact)
end

function Selected:rayTouchCancelled(rayContact)
	BaseClass.rayTouchCancelled(self, rayContact)
end

function Selected:rayTouchMissed(node)
    BaseClass.rayTouchMissed(self, node)

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchDragOutside()
    end
end

function Selected:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Selected:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)

  if not self:getNodeEntity():disabled() then
    self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")
  end
end

function Selected:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Selected:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchDragOutside()
    end
end

function Selected:collide(otherNode, collisionPoint)
	BaseClass.collide(self, collisionPoint)
end

function Selected:near(otherNode)
	BaseClass.near(self, otherNode)
end

function Selected:actionUpdate(action, timeStep)
	BaseClass.actionUpdate(self, timeStep)
end

function Selected:actionComplete(action)
	BaseClass.actionComplete(self, action)
end

function Selected:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Selected:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Selected:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Selected:renderHUD()
    BaseClass.renderHUD(self)
end

function Selected:gamePause()
    BaseClass.gamePause(self)
end

function Selected:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Selected:touchesDown(touches)
    BaseClass.touchesDown(self, touches)
end

function Selected:touchesUp(touches)
    BaseClass.touchesUp(self, touches)

    self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchUpOutside(touches)
    end
end

function Selected:touchesMove(touches)
    BaseClass.touchesMove(self, touches)
end

function Selected:touchesCancelled(touches)
    BaseClass.touchesCancelled(self, touches)
end

function Selected:touchDown(touch)
    BaseClass.touchDown(self, touch)
end

function Selected:touchUp(touch)
    BaseClass.touchUp(self, touch)

    self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchUpOutside(touch)
    end
end

function Selected:touchMove(touch)
    BaseClass.touchMove(self, touch)
end

function Selected:touchCancelled(touch)
    BaseClass.touchCancelled(self, touch)
end

function Selected:mouseDown(mouse)
    BaseClass.mouseDown(self, mouse)
end

function Selected:mouseUp(mouse)
    BaseClass.mouseUp(self, mouse)

    self:getNodeEntity():pushState("NJLI.STATEMACHINE.UI.BUTTON.STATES.Default")

    if not self:getNodeEntity():disabled() then
        self:getNodeEntity():touchUpOutside(mouse)
    end
end

function Selected:mouseMove(mouse)
    BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Selected, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Selected:className()
  return "Selected"
end

function Selected:class()
  return self
end

function Selected:superClass()
  return BaseClass
end

function Selected:__gc()
  --Destroy derived class first
  Selected._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Selected:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Selected:_destroy()
  assert(not self.__SelectedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Selected:_create(init)
  self.__SelectedCalledLoad = false
  __ctor(self, init)
end

function Selected:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SelectedCalledLoad = true
end

function Selected:unLoad()
  assert(self.__SelectedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__SelectedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Selected
