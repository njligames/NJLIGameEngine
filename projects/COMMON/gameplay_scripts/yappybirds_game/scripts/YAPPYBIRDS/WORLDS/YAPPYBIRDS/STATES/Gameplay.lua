local BaseClass = require "NJLI.STATEMACHINE.WorldEntityState"

local Gameplay = {}
Gameplay.__index = Gameplay

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

function Gameplay:enter()
  BaseClass.enter(self)
end

function Gameplay:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Gameplay:exit()
  BaseClass.exit(self)
end

function Gameplay:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Gameplay:renderHUD()
  BaseClass.renderHUD(self)
end

function Gameplay:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Gameplay:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Gameplay:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Gameplay:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Gameplay:pause()
  BaseClass.pause(self)
end

function Gameplay:unPause()
  BaseClass.unPause(self)
end

function Gameplay:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Gameplay:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Gameplay:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Gameplay:willResignActive()
  BaseClass.willResignActive(self)
end

function Gameplay:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Gameplay:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Gameplay:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Gameplay:willTerminate()
  BaseClass.willTerminate(self)
end

function Gameplay:interrupt()
  BaseClass.interrupt(self)
end

function Gameplay:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Gameplay:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Gameplay, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Gameplay:className()
  return "Gameplay"
end

function Gameplay:class()
  return self
end

function Gameplay:superClass()
  return BaseClass
end

function Gameplay:__gc()
  --Destroy derived class first
  Gameplay._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Gameplay:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Gameplay:_destroy()
  assert(not self.__GameplayCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Gameplay:_create(init)
  self.__GameplayCalledLoad = false
  __ctor(self, init)
end

function Gameplay:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GameplayCalledLoad = true
end

function Gameplay:unLoad()
  assert(self.__GameplayCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GameplayCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Gameplay
