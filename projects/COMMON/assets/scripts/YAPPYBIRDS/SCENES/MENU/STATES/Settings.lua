local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Settings = {}
Settings.__index = Settings

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

function Settings:enter()
  BaseClass.enter(self)
end

function Settings:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Settings:exit()
  BaseClass.exit(self)
end

function Settings:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Settings:renderHUD()
  BaseClass.renderHUD(self)
end

function Settings:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Settings:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Settings:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Settings:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Settings:pause()
  BaseClass.pause(self)
end

function Settings:unPause()
  BaseClass.unPause(self)
end

function Settings:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Settings:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Settings:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Settings:willResignActive()
  BaseClass.willResignActive(self)
end

function Settings:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Settings:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Settings:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Settings:willTerminate()
  BaseClass.willTerminate(self)
end

function Settings:interrupt()
  BaseClass.interrupt(self)
end

function Settings:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Settings:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Settings, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Settings:className()
  return "Settings"
end

function Settings:class()
  return self
end

function Settings:superClass()
  return BaseClass
end

function Settings:__gc()
  --Destroy derived class first
  Settings._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Settings:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Settings:_destroy()
  assert(not self.__SettingsCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Settings:_create(init)
  self.__SettingsCalledLoad = false
  __ctor(self, init)
end

function Settings:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SettingsCalledLoad = true
end

function Settings:unLoad()
  assert(self.__SettingsCalledLoad, "Must load before unSettings")

  --unload derived first...
  __unLoad(self)
  self.__SettingsCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Settings
