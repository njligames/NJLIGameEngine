local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Yap = {}
Yap.__index = Yap

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

function Yap:enter()
  BaseClass.enter(self)
end

function Yap:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Yap:exit()
  BaseClass.exit(self)
end

function Yap:onMessage()
  BaseClass.onMessage(self)
end

function Yap:rayTouchesDown(rayContact)
  BaseClass.rayTouchesDown(self, rayContact)
end

function Yap:rayTouchesUp(rayContact)
  BaseClass.rayTouchesUp(self, rayContact)
end

function Yap:rayTouchesMove(rayContact)
  BaseClass.rayTouchesMove(self, rayContact)
end

function Yap:rayTouchesCancelled(rayContact)
  BaseClass.rayTouchesCancelled(self, rayContact)
end

function Yap:rayTouchesMissed(node)
  BaseClass.rayTouchesMissed(self, node)
end

function Yap:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
end

function Yap:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
end

function Yap:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
end

function Yap:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
end

function Yap:rayTouchMissed(node)
  BaseClass.rayTouchMissed(self, node)
end

function Yap:rayMouseDown(rayContact)
  BaseClass.rayMouseDown(self, rayContact)
end

function Yap:rayMouseUp(rayContact)
  BaseClass.rayMouseUp(self, rayContact)
end

function Yap:rayMouseMove(rayContact)
  BaseClass.rayMouseMove(self, rayContact)
end

function Yap:rayMouseMissed(node)
  BaseClass.rayMouseMissed(self, node)
end

function Yap:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Yap:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Yap:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Yap:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

function Yap:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Yap:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Yap:keyboardReturn()
  BaseClass.keyboardReturn(self)
end

function Yap:renderHUD()
  BaseClass.renderHUD(self)
end

function Yap:gamePause()
  BaseClass.gamePause(self)
end

function Yap:gameUnPause()
  BaseClass.gameUnPause(self)
end

function Yap:touchesDown(touches)
  BaseClass.touchesDown(self, touches)
end

function Yap:touchesUp(touches)
  BaseClass.touchesUp(self, touches)
end

function Yap:touchesMove(touches)
  BaseClass.touchesMove(self, touches)
end

function Yap:touchesCancelled(touches)
  BaseClass.touchesCancelled(self, touches)
end

function Yap:touchDown(touch)
  BaseClass.touchDown(self, touch)
end

function Yap:touchUp(touch)
  BaseClass.touchUp(self, touch)
end

function Yap:touchMove(touch)
  BaseClass.touchMove(self, touch)
end

function Yap:touchCancelled(touch)
  BaseClass.touchCancelled(self, touch)
end

function Yap:mouseDown(mouse)
  BaseClass.mouseDown(self, mouse)
end

function Yap:mouseUp(mouse)
  BaseClass.mouseUp(self, mouse)
end

function Yap:mouseMove(mouse)
  BaseClass.mouseMove(self, mouse)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Yap, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Yap:className()
  return "Yap"
end

function Yap:class()
  return self
end

function Yap:superClass()
  return BaseClass
end

function Yap:__gc()
  --Destroy derived class first
  Yap._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Yap:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Yap:_destroy()
  assert(not self.__YapCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Yap:_create(init)
  self.__YapCalledLoad = false
  __ctor(self, init)
end

function Yap:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__YapCalledLoad = true
end

function Yap:unLoad()
  assert(self.__YapCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__YapCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Yap
