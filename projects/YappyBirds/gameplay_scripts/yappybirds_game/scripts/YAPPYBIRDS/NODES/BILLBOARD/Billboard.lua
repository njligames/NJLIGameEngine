local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Billboard = {}
Billboard.__index = Billboard

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
    assert( init, "init variable is nil." )
    assert( type(init) == "table", "Init variable is expecting a states table" )
    assert( init.atlas ~= nil, "init.atlas variable is nil" )
    assert( init.geometry ~= nil, "init.geometry variable is nil" )
    assert( init.origin ~= nil, "init.origin variable is nil" )
    assert( init.dimensions ~= nil, "init.dimensions variable is nil" )

    self._scale = init.scale or 1.0
    self._origin = init.origin or bullet.btVector3( 0.0, 0.0, 0.0 )
    self._dimensions = init.dimensions or bullet.btVector2( 1.0, 1.0 )

    self:getNode():setGeometry(init.geometry)

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






--function Billboard:screenPercentWidth(s)
--    if s ~= nil then
--        self._screenPercentWidth = s
--    end
--    return self._screenPercentWidth
--end

--function Billboard:screenPercentHeight(s)
--    if s ~= nil then
--        self._screenPercentHeight = s
--    end
--    return self._screenPercentHeight
--end

function Billboard:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Billboard:setSpriteAtlasFrame(nodeStateName, match)
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

function Billboard:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Billboard:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
end

function Billboard:show(camera)
  self:getNode():show(camera)
end

function Billboard:hide(camera)
  self:getNode():hide(camera)
end

--function Billboard:display(enable)
--  if nil ~= enable and nil ~= OrthographicCameraNode and OrthographicCameraNode:getCamera() then
--    if enable then
--      self:show(OrthographicCameraNode:getCamera())
--    else
--      self:hide(OrthographicCameraNode:getCamera())
--    end
--  end
--end






function Billboard:enter()
  BaseClass.enter(self)
end

function Billboard:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Billboard:exit()
  BaseClass.exit(self)
end

function Billboard:onMessage()
  BaseClass.onMessage(self)
end

function Billboard:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Billboard:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Billboard:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Billboard:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Billboard:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Billboard:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Billboard:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Billboard:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Billboard:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Billboard:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Billboard:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Billboard:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Billboard:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Billboard:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Billboard:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Billboard:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Billboard:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Billboard:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Billboard:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Billboard:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Billboard:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Billboard:renderHUD()
  BaseClass.renderHUD(self)
end

function Billboard:gamePause()
  BaseClass.gamePause(self)
end

function Billboard:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Billboard:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Billboard:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Billboard:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Billboard:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Billboard:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Billboard:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Billboard:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Billboard:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Billboard:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Billboard:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Billboard:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Billboard, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Billboard:className()
  return "Billboard"
end

function Billboard:class()
  return self
end

function Billboard:superClass()
  return BaseClass
end

function Billboard:__gc()
  --Destroy derived class first
  Billboard._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Billboard:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Billboard:_destroy()
  assert(not self.__BillboardCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Billboard:_create(init)
  self.__BillboardCalledLoad = false
  __ctor(self, init)
end

function Billboard:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BillboardCalledLoad = true
end

function Billboard:unLoad()
  assert(self.__BillboardCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BillboardCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Billboard
