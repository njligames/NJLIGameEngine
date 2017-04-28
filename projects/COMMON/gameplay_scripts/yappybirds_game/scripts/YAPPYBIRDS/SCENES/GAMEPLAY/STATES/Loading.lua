local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Loading = {}
Loading.__index = Loading

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

function Loading:enter()
  BaseClass.enter(self)
end

function Loading:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Loading:exit()
  BaseClass.exit(self)
end

function Loading:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Loading:renderHUD()
  BaseClass.renderHUD(self)
end

function Loading:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Loading:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Loading:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Loading:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Loading:pause()
  BaseClass.pause(self)
end

function Loading:unPause()
  BaseClass.unPause(self)
end

function Loading:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Loading:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Loading:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Loading:willResignActive()
  BaseClass.willResignActive(self)
end

function Loading:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Loading:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Loading:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Loading:willTerminate()
  BaseClass.willTerminate(self)
end

function Loading:interrupt()
  BaseClass.interrupt(self)
end

function Loading:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Loading:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Loading, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Loading:className()
  return "Loading"
end

function Loading:class()
  return self
end

function Loading:superClass()
  return BaseClass
end

function Loading:__gc()
  --Destroy derived class first
  Loading._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Loading:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Loading:_destroy()
  assert(not self.__LoadingCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Loading:_create(init)
  self.__LoadingCalledLoad = false
  __ctor(self, init)
end

function Loading:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LoadingCalledLoad = true
end

function Loading:unLoad()
  assert(self.__LoadingCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__LoadingCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Loading
