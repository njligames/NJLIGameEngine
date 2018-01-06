local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Image = {}
Image.__index = Image

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
    assert(init, "init variable is nil.")
    assert(type(init) == "table", "Init variable is expecting a states table")
    assert(init.atlas ~= nil, "init.atlas variable is nil")
    assert(init.geometry ~= nil, "init.geometry variable is nil")

    self._scale = init.scale or 1.0
    
    self._screenPercentWidth = init.screenPercentWidth or 1.0
    self._screenPercentHeight = init.screenPercentHeight or 1.0

    local node = self:getNode()

    node:setGeometry(init.geometry)

    self._spriteFrameAtlas = init.atlas
end

local __dtor = function(self)
  self:getNode():removeGeometry()
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--Image Specific
--#############################################################################

--self._screenPercentWidth = screenPercentWidth
--self._screenPercentHeight = screenPercentHeight

function Image:screenPercentWidth(s)
    if s ~= nil then
        self._screenPercentWidth = s
    end
    return self._screenPercentWidth
end

function Image:screenPercentHeight(s)
    if s ~= nil then
        self._screenPercentHeight = s
    end
    return self._screenPercentHeight
end

function Image:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Image:setSpriteAtlasFrame(nodeStateName, match)
	local parts = nodeStateName:split("[^,%s]+")
  
	local name = nodeStateName
	if #parts ~= 1 then
		name = parts[1] -- .. parts[3]
	end
  
  assert(self:getNode())
  assert(self:getNode():getGeometry())
  self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlas, name, match)
end

--function Image:setSpriteAtlasFrame(nodeStateName, match)
--    self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlas, nodeStateName, match)
--end

function Image:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Image:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function Image:show(camera)
  self:getNode():show(camera)
end

function Image:hide(camera)
  self:getNode():hide(camera)
end

function Image:display(enable)
  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
    if enable then
      self:show(OrthographicCameraNode:getCamera())
    else
      self:hide(OrthographicCameraNode:getCamera())
    end
  end
end

--#############################################################################
--NodeEntity overwrite
--#############################################################################

function Image:enter()
  BaseClass.enter(self)
end

function Image:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Image:exit()
  BaseClass.exit(self)
end

function Image:onMessage()
  BaseClass.onMessage(self)
end

function Image:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Image:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Image:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Image:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Image:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Image:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Image:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Image:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Image:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Image:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Image:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Image:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Image:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Image:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Image:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Image:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Image:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Image:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Image:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Image:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Image:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Image:renderHUD()
    BaseClass.renderHUD(self)
end

function Image:gamePause()
    BaseClass.gamePause(self)
end

function Image:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Image:touchesDown(touches)
    BaseClass.touchesDown(self, touches)
end

function Image:touchesUp(touches)
    BaseClass.touchesUp(self, touches)
end

function Image:touchesMove(touches)
    BaseClass.touchesMove(self, touches)
end

function Image:touchesCancelled(touches)
    BaseClass.touchesCancelled(self, touches)
end

function Image:touchDown(touch)
    BaseClass.touchDown(self, touch)
end

function Image:touchUp(touch)
    BaseClass.touchUp(self, touch)
end

function Image:touchMove(touch)
    BaseClass.touchMove(self, touch)
end

function Image:touchCancelled(touch)
    BaseClass.touchCancelled(self, touch)
end

function Image:mouseDown(mouse)
    BaseClass.mouseDown(self, mouse)
end

function Image:mouseUp(mouse)
    BaseClass.mouseUp(self, mouse)
end

function Image:mouseMove(mouse)
    BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Image, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Image:className()
  return "Image"
end

function Image:class()
  return self
end

function Image:superClass()
  return BaseClass
end

function Image:__gc()
  --Destroy derived class first
  Image._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Image:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Image:_destroy()
  assert(not self.__ImageCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Image:_create(init)
  self.__ImageCalledLoad = false
  __ctor(self, init)
end

function Image:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ImageCalledLoad = true
end

function Image:unLoad()
  assert(self.__ImageCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__ImageCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Image
