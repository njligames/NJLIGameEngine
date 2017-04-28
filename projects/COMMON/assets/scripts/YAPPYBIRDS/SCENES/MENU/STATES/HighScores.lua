local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local HighScores = {}
HighScores.__index = HighScores

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

function HighScores:enter()
  BaseClass.enter(self)
end

function HighScores:update(timeStep)
  BaseClass.update(self, timeStep)
end

function HighScores:exit()
  BaseClass.exit(self)
end

function HighScores:onMessage(message)
  BaseClass.onMessage(self, message)
end

function HighScores:renderHUD()
  BaseClass.renderHUD(self)
end

function HighScores:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function HighScores:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function HighScores:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function HighScores:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function HighScores:pause()
  BaseClass.pause(self)
end

function HighScores:unPause()
  BaseClass.unPause(self)
end

function HighScores:keyboardShow()
  BaseClass.keyboardShow(self)
end

function HighScores:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function HighScores:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function HighScores:willResignActive()
  BaseClass.willResignActive(self)
end

function HighScores:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function HighScores:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function HighScores:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function HighScores:willTerminate()
  BaseClass.willTerminate(self)
end

function HighScores:interrupt()
  BaseClass.interrupt(self)
end

function HighScores:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function HighScores:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(HighScores, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function HighScores:className()
  return "HighScores"
end

function HighScores:class()
  return self
end

function HighScores:superClass()
  return BaseClass
end

function HighScores:__gc()
  --Destroy derived class first
  HighScores._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function HighScores:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function HighScores:_destroy()
  assert(not self.__HighScoresCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function HighScores:_create(init)
  self.__HighScoresCalledLoad = false
  __ctor(self, init)
end

function HighScores:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__HighScoresCalledLoad = true
end

function HighScores:unLoad()
  assert(self.__HighScoresCalledLoad, "Must load before unHighScores")

  --unload derived first...
  __unLoad(self)
  self.__HighScoresCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return HighScores
