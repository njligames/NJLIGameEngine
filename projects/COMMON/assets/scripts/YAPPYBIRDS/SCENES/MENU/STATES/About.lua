local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local About = {}
About.__index = About

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

function About:enter()
  BaseClass.enter(self)
end

function About:update(timeStep)
  BaseClass.update(self, timeStep)
end

function About:exit()
  BaseClass.exit(self)
end

function About:onMessage(message)
  BaseClass.onMessage(self, message)
end

function About:renderHUD()
  BaseClass.renderHUD(self)
end

function About:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function About:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function About:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function About:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function About:pause()
  BaseClass.pause(self)
end

function About:unPause()
  BaseClass.unPause(self)
end

function About:keyboardShow()
  BaseClass.keyboardShow(self)
end

function About:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function About:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function About:willResignActive()
  BaseClass.willResignActive(self)
end

function About:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function About:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function About:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function About:willTerminate()
  BaseClass.willTerminate(self)
end

function About:interrupt()
  BaseClass.interrupt(self)
end

function About:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function About:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(About, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function About:className()
  return "About"
end

function About:class()
  return self
end

function About:superClass()
  return BaseClass
end

function About:__gc()
  --Destroy derived class first
  About._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function About:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function About:_destroy()
  assert(not self.__AboutCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function About:_create(init)
  self.__AboutCalledLoad = false
  __ctor(self, init)
end

function About:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__AboutCalledLoad = true
end

function About:unLoad()
  assert(self.__AboutCalledLoad, "Must load before unAbout")

  --unload derived first...
  __unLoad(self)
  self.__AboutCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return About
