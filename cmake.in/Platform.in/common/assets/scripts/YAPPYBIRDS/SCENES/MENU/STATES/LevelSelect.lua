local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local LevelSelect = {}
LevelSelect.__index = LevelSelect

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

function LevelSelect:enter()
  BaseClass.enter(self)
end

function LevelSelect:update(timeStep)
  BaseClass.update(self, timeStep)
end

function LevelSelect:exit()
  BaseClass.exit(self)
end

function LevelSelect:onMessage(message)
  BaseClass.onMessage(self, message)
end

function LevelSelect:renderHUD()
  BaseClass.renderHUD(self)
end

function LevelSelect:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function LevelSelect:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function LevelSelect:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function LevelSelect:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function LevelSelect:pause()
  BaseClass.pause(self)
end

function LevelSelect:unPause()
  BaseClass.unPause(self)
end

function LevelSelect:keyboardShow()
  BaseClass.keyboardShow(self)
end

function LevelSelect:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function LevelSelect:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function LevelSelect:willResignActive()
  BaseClass.willResignActive(self)
end

function LevelSelect:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function LevelSelect:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function LevelSelect:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function LevelSelect:willTerminate()
  BaseClass.willTerminate(self)
end

function LevelSelect:interrupt()
  BaseClass.interrupt(self)
end

function LevelSelect:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function LevelSelect:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(LevelSelect, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function LevelSelect:className()
  return "LevelSelect"
end

function LevelSelect:class()
  return self
end

function LevelSelect:superClass()
  return BaseClass
end

function LevelSelect:__gc()
  --Destroy derived class first
  LevelSelect._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function LevelSelect:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function LevelSelect:_destroy()
  assert(not self.__LevelSelectCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function LevelSelect:_create(init)
  self.__LevelSelectCalledLoad = false
  __ctor(self, init)
end

function LevelSelect:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LevelSelectCalledLoad = true
end

function LevelSelect:unLoad()
  assert(self.__LevelSelectCalledLoad, "Must load before unLevelSelect")

  --unload derived first...
  __unLoad(self)
  self.__LevelSelectCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return LevelSelect
