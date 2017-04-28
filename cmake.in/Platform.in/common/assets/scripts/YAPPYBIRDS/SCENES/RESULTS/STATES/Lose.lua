local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Lose = {}
Lose.__index = Lose

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

function Lose:enter()
  BaseClass.enter(self)
end

function Lose:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Lose:exit()
  BaseClass.exit(self)
end

function Lose:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Lose:renderHUD()
  BaseClass.renderHUD(self)
end

function Lose:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Lose:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Lose:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Lose:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Lose:pause()
  BaseClass.pause(self)
end

function Lose:unPause()
  BaseClass.unPause(self)
end

function Lose:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Lose:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Lose:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Lose:willResignActive()
  BaseClass.willResignActive(self)
end

function Lose:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Lose:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Lose:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Lose:willTerminate()
  BaseClass.willTerminate(self)
end

function Lose:interrupt()
  BaseClass.interrupt(self)
end

function Lose:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Lose:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Lose, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Lose:className()
  return "Lose"
end

function Lose:class()
  return self
end

function Lose:superClass()
  return BaseClass
end

function Lose:__gc()
  --Destroy derived class first
  Lose._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Lose:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Lose:_destroy()
  assert(not self.__LoseCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Lose:_create(init)
  self.__LoseCalledLoad = false
  __ctor(self, init)
end

function Lose:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LoseCalledLoad = true
end

function Lose:unLoad()
  assert(self.__LoseCalledLoad, "Must load before unLose")

  --unload derived first...
  __unLoad(self)
  self.__LoseCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Lose
