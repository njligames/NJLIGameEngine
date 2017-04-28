local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Label = {}
Label.__index = Label

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

--    self:text("PLACEHOLDER")
end

local __dtor = function(self)
  --TODO: __dtor this Entity
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--Label Specific
--#############################################################################

function Label:text(t)

    if t ~= nil then
        self._text = t

        Interface:getStateMachine():getEntityManager():removeNodeEntity(self)

        local node, rect = RanchersFont:printf(self._text)
        node:setOrigin(self:getNode():getOrigin())
        node:setRenderCategory(self:getNode())
        node:setCurrentScene(self:getNode())

        njli.Node.destroy(self:getNode(), true)

        self._node = node
        self._rect = rect

        Interface:getStateMachine():getEntityManager():addNodeEntity(self)
    end

    return self._text
end

function Label:bounds()
    return self._rect
end

function Label:width()
    return self:bounds().width
end

function Label:height()
    return self:bounds().height
end

function Label:x()
    return self:bounds().x
end

function Label:y()
    return self:bounds().y
end

function Label:show(camera)
  self:getNode():show(camera)
end

function Label:hide(camera)
  self:getNode():hide(camera)
end

--#############################################################################
--NodeEntity overwrite
--#############################################################################

function Label:enter()
  BaseClass.enter(self)
end

function Label:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Label:exit()
  BaseClass.exit(self)
end

function Label:onMessage()
  BaseClass.onMessage(self)
end

function Label:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Label:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Label:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Label:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Label:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Label:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Label:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Label:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Label:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Label:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Label:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Label:keyboardReturn()
    BaseClass.keyboardReturn(self)
end

function Label:renderHUD()
    BaseClass.renderHUD(self)
end

function Label:gamePause()
    BaseClass.gamePause(self)
end

function Label:gameUnPause()
    BaseClass.gameUnPause(self)
end

function Label:touchDown(touches)
    BaseClass.touchDown(self, touches)
end

function Label:touchUp(touches)
    BaseClass.touchUp(self, touches)
end

function Label:touchMove(touches)
    BaseClass.touchMove(self, touches)
end

function Label:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Label, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Label:className()
  return "Label"
end

function Label:class()
  return self
end

function Label:superClass()
  return BaseClass
end

function Label:__gc()
  --Destroy derived class first
  Label._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Label:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Label:_destroy()
  assert(not self.__LabelCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Label:_create(init)
  self.__LabelCalledLoad = false
  __ctor(self, init)
end

function Label:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LabelCalledLoad = true
end

function Label:unLoad()
  assert(self.__LabelCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__LabelCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Label
