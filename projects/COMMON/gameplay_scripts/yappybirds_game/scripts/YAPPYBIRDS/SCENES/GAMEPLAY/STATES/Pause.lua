local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Pause = {}
Pause.__index = Pause

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

function Pause:enter()
  BaseClass.enter(self)
end

function Pause:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Pause:exit()
  BaseClass.exit(self)
end

function Pause:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Pause:renderHUD()
  BaseClass.renderHUD(self)
end

function Pause:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Pause:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Pause:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Pause:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Pause:pause()
  BaseClass.pause(self)
end

function Pause:unPause()
  BaseClass.unPause(self)
end

function Pause:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Pause:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Pause:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Pause:willResignActive()
  BaseClass.willResignActive(self)
end

function Pause:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Pause:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Pause:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Pause:willTerminate()
  BaseClass.willTerminate(self)
end

function Pause:interrupt()
  BaseClass.interrupt(self)
end

function Pause:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Pause:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Pause, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Pause:className()
  return "Pause"
end

function Pause:class()
  return self
end

function Pause:superClass()
  return BaseClass
end

function Pause:__gc()
  --Destroy derived class first
  Pause._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Pause:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Pause:_destroy()
  assert(not self.__PauseCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Pause:_create(init)
  self.__PauseCalledLoad = false
  __ctor(self, init)
end

function Pause:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__PauseCalledLoad = true
end

function Pause:unLoad()
  assert(self.__PauseCalledLoad, "Must load before unPause")

  --unload derived first...
  __unLoad(self)
  self.__PauseCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Pause
