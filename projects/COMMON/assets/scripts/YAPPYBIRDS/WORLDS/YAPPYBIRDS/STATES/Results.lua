local BaseClass = require "NJLI.STATEMACHINE.WorldEntityState"

local Results = {}
Results.__index = Results

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

function Results:enter()
  BaseClass.enter(self)
end

function Results:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Results:exit()
  BaseClass.exit(self)
end

function Results:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Results:renderHUD()
  BaseClass.renderHUD(self)
end

function Results:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Results:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Results:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Results:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Results:pause()
  BaseClass.pause(self)
end

function Results:unPause()
  BaseClass.unPause(self)
end

function Results:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Results:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Results:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Results:willResignActive()
  BaseClass.willResignActive(self)
end

function Results:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Results:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Results:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Results:willTerminate()
  BaseClass.willTerminate(self)
end

function Results:interrupt()
  BaseClass.interrupt(self)
end

function Results:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Results:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Results, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Results:className()
  return "Results"
end

function Results:class()
  return self
end

function Results:superClass()
  return BaseClass
end

function Results:__gc()
  --Destroy derived class first
  Results._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Results:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Results:_destroy()
  assert(not self.__GameplayCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Results:_create(init)
  self.__GameplayCalledLoad = false
  __ctor(self, init)
end

function Results:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GameplayCalledLoad = true
end

function Results:unLoad()
  assert(self.__GameplayCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GameplayCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Results
