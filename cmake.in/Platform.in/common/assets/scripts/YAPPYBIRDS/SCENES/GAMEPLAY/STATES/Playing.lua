local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Playing = {}
Playing.__index = Playing

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

function Playing:enter()
  BaseClass.enter(self)
end

function Playing:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Playing:exit()
  BaseClass.exit(self)
end

function Playing:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Playing:renderHUD()
  BaseClass.renderHUD(self)
end

function Playing:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Playing:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Playing:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Playing:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Playing:pause()
  BaseClass.pause(self)
end

function Playing:unPause()
  BaseClass.unPause(self)
end

function Playing:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Playing:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Playing:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Playing:willResignActive()
  BaseClass.willResignActive(self)
end

function Playing:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Playing:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Playing:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Playing:willTerminate()
  BaseClass.willTerminate(self)
end

function Playing:interrupt()
  BaseClass.interrupt(self)
end

function Playing:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Playing:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Playing, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Playing:className()
  return "Playing"
end

function Playing:class()
  return self
end

function Playing:superClass()
  return BaseClass
end

function Playing:__gc()
  --Destroy derived class first
  Playing._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Playing:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Playing:_destroy()
  assert(not self.__PlayingCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Playing:_create(init)
  self.__PlayingCalledLoad = false
  __ctor(self, init)
end

function Playing:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__PlayingCalledLoad = true
end

function Playing:unLoad()
  assert(self.__PlayingCalledLoad, "Must load before unPlaying")

  --unload derived first...
  __unLoad(self)
  self.__PlayingCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Playing
