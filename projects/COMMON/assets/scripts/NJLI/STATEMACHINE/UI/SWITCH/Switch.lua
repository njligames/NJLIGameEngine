local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Switch = {}
Switch.__index = Switch

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

    self._touchUpOutside = init.touchUpOutside
    self._touchUpInside = init.touchUpInside
    self._touchDownInside = init.touchDownInside
    self._touchDragOutside = init.touchDragOutside
    self._touchDragInside = init.touchDragInside
    self._touchCancelled = init.touchCancelled

    self._scale = init.scale or 1.0
    self._disabled = init.disabled or false
    self._on = init.on or false

    local node = self:getNode()

    node:setGeometry(init.geometry)

    self._spriteFrameAtlas = init.atlas
    
    self._physicsShape = njli.PhysicsShapeBox.create()

    self._physicsBody = njli.PhysicsBodyRigid.create()
    self._physicsBody:setStaticPhysics()
    self._physicsBody:setPhysicsShape(self._physicsShape)

    node:setPhysicsBody(self._physicsBody)

    self._soundTouchUpOutside = njli.Sound.create()
    if init.soundTouchUpOutside and type(init.soundTouchUpOutside) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchUpOutside, self._soundTouchUpOutside)
    end

    self._soundTouchUpInside = njli.Sound.create()
    if init.soundTouchUpInside and type(init.soundTouchUpInside) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchUpInside, self._soundTouchUpInside)
    end

    self._soundTouchDownInside = njli.Sound.create()
    if init.soundTouchDownInside and type(init.soundTouchDownInside) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchDownInside, self._soundTouchDownInside)
    end

    self._soundTouchDragOutside = njli.Sound.create()
    if init.soundTouchDragOutside and type(init.soundTouchDragOutside) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchDragOutside, self._soundTouchDragOutside)
    end

    self._soundTouchDragInside = njli.Sound.create()
    if init.soundTouchDragInside and type(init.soundTouchDragInside) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchDragInside, self._soundTouchDragInside)
    end

    self._soundTouchCancelled = njli.Sound.create()
    if init.soundTouchCancelled and type(init.soundTouchCancelled) == "string" then
        njli.World.getInstance():getWorldResourceLoader():load(init.soundTouchCancelled, self._soundTouchCancelled)
    end
end

local __dtor = function(self)

    njli.Sound.destroy(self._soundTouchUpOutside)
    self._soundTouchUpOutside = nil

    njli.Sound.destroy(self._soundTouchUpInside)
    self._soundTouchUpInside = nil

    njli.Sound.destroy(self._soundTouchDownInside)
    self._soundTouchDownInside = nil

    njli.Sound.destroy(self._soundTouchDragOutside)
    self._soundTouchDragOutside = nil

    njli.Sound.destroy(self._soundTouchDragInside)
    self._soundTouchDragInside = nil

    njli.Sound.destroy(self._soundTouchCancelled)
    self._soundTouchCancelled = nil

    njli.PhysicsBodyRigid.destroy(self._physicsBody)
    self._physicsBody = nil

    njli.PhysicsShapeBox.destroy(self._physicsShape)
    self._physicsShape = nil

    self._spriteFrameAtlas = nil

    self:getNode():removeGeometry()
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--Switch Specific
--#############################################################################

function Switch:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Switch:disabled(b)
    if b ~= nil then

        self._disabled = b

        if self._disabled then
            self:pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Disabled")
        else
            if self:on() then
                self:pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.On")
            else
                self:pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Off")
            end
        end
    end

    return self._disabled
end

function Switch:on(b)
    if b ~= nil then

        self._on = b

        if self._on then
            self:pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.On")
        else
            self:pushState("NJLI.STATEMACHINE.UI.SWITCH.STATES.Off")
        end
    end

    return self._on
end

function Switch:setSpriteAtlasFrame(nodeStateName, match)
	local parts = nodeStateName:split("[^,%s]+")

	local name = nodeStateName
	if #parts ~= 1 then
		name = parts[1] .. parts[3]
	end
    self:getNode():getGeometry():setSpriteAtlasFrame(self:getNode(), self._spriteFrameAtlas, name, match)
end

function Switch:getDimensions()
    return self:getNode():getGeometry():getDimensions(self:getNode())
end

function Switch:setDimensions(dimension)
  self:getNode():getGeometry():setDimensions(self:getNode(), dimension)
  self._physicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))
end

function Switch:show(camera)
  self:getNode():show(camera)
end

function Switch:hide(camera)
  self:getNode():hide(camera)
end

function Switch:touchUpOutside(touches)
    if not self._touchedUp then
        if self._touchUpOutside then
            self._touchUpOutside(touches)
        else
            print(self:getNode():getName() .. ":touchUpOutside")
        end
    end
    self._soundTouchUpOutside:play()  
end

function Switch:touchUpInside(rayContact)
    if self._touchUpInside then
        self._touchUpInside(rayContact)
    else
        print(self:getNode():getName() .. ":touchUpInside")
    end
    self._touchedUp = true
    self._soundTouchUpInside:play()   
end

function Switch:touchDownInside(rayContact)
    if self._touchDownInside then
        self._touchDownInside(rayContact)
    else
        print(self:getNode():getName() .. ":touchDownInside")
    end
    self._touchedUp = false
    self._soundTouchDownInside:play()
end

function Switch:touchDragOutside()
    if self._touchDragOutside then
        self._touchDragOutside()
    else
        print(self:getNode():getName() .. ":touchDragOutside")
    end
    self._soundTouchDragOutside:play()
end

function Switch:touchDragInside(rayContact)
    if self._touchDragInside then
        self._touchDragInside(rayContact)
    else
        print(self:getNode():getName() .. ":touchDragInside")
    end
    self._soundTouchDragInside:play()
end

function Switch:touchCancelled(rayContact)
    if self._touchCancelled then
        self._touchCancelled(rayContact)
    else
        print(self:getNode():getName() .. ":touchCancelled")
    end
    self._soundTouchCancelled:play()
end

--#############################################################################

function Switch:enter()
  BaseClass.enter(self)
end

function Switch:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Switch:exit()
  BaseClass.exit(self)
end

function Switch:onMessage()
  BaseClass.onMessage(self)
end

function Switch:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)

  if not self:disabled() then
      self:touchDownInside(rayContact)
  end
end

function Switch:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)

  if not self:disabled() then
      self:touchUpInside(rayContact)
  end
end

function Switch:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)

  if not self:disabled() then
      self:touchDragInside(rayContact)
  end
end

function Switch:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)

  if not self:disabled() then
      self:touchCancelled(rayContact)
  end
end

function Switch:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Switch:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Switch:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Switch:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Switch:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Switch:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Switch:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Switch:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Switch:renderHUD()
    BaseClass.renderHUD(self)
end

function Switch:gamePause()
    BaseClass.gamePause(self)
end

function Switch:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Switch:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Switch:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Switch:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Switch:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Switch, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Switch:className()
  return "Switch"
end

function Switch:class()
  return self
end

function Switch:superClass()
  return BaseClass
end

function Switch:__gc()
  --Destroy derived class first
  Switch._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Switch:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Switch:_destroy()
  assert(not self.__ButtonCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Switch:_create(init)
  self.__ButtonCalledLoad = false
  __ctor(self, init)
end

function Switch:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ButtonCalledLoad = true
end

function Switch:unLoad()
  assert(self.__ButtonCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__ButtonCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Switch
