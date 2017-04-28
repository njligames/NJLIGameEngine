local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Win = {}
Win.__index = Win

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

function Win:enter()
  BaseClass.enter(self)
end

function Win:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Win:exit()
  BaseClass.exit(self)
end

function Win:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Win:renderHUD()
  BaseClass.renderHUD(self)
end

function Win:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Win:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Win:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Win:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Win:pause()
  BaseClass.pause(self)
end

function Win:unPause()
  BaseClass.unPause(self)
end

function Win:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Win:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Win:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Win:willResignActive()
  BaseClass.willResignActive(self)
end

function Win:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Win:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Win:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Win:willTerminate()
  BaseClass.willTerminate(self)
end

function Win:interrupt()
  BaseClass.interrupt(self)
end

function Win:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Win:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Win, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Win:className()
  return "Win"
end

function Win:class()
  return self
end

function Win:superClass()
  return BaseClass
end

function Win:__gc()
  --Destroy derived class first
  Win._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Win:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Win:_destroy()
  assert(not self.__WinCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Win:_create(init)
  self.__WinCalledLoad = false
  __ctor(self, init)
end

function Win:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__WinCalledLoad = true
end

function Win:unLoad()
  assert(self.__WinCalledLoad, "Must load before unWin")

  --unload derived first...
  __unLoad(self)
  self.__WinCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Win
