local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local BoardSelect = {}
BoardSelect.__index = BoardSelect

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

function BoardSelect:enter()
  BaseClass.enter(self)
end

function BoardSelect:update(timeStep)
  BaseClass.update(self, timeStep)
end

function BoardSelect:exit()
  BaseClass.exit(self)
end

function BoardSelect:onMessage(message)
  BaseClass.onMessage(self, message)
end

function BoardSelect:renderHUD()
  BaseClass.renderHUD(self)
end

function BoardSelect:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function BoardSelect:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function BoardSelect:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function BoardSelect:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function BoardSelect:pause()
  BaseClass.pause(self)
end

function BoardSelect:unPause()
  BaseClass.unPause(self)
end

function BoardSelect:keyboardShow()
  BaseClass.keyboardShow(self)
end

function BoardSelect:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function BoardSelect:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function BoardSelect:willResignActive()
  BaseClass.willResignActive(self)
end

function BoardSelect:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function BoardSelect:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function BoardSelect:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function BoardSelect:willTerminate()
  BaseClass.willTerminate(self)
end

function BoardSelect:interrupt()
  BaseClass.interrupt(self)
end

function BoardSelect:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function BoardSelect:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BoardSelect, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function BoardSelect:className()
  return "BoardSelect"
end

function BoardSelect:class()
  return self
end

function BoardSelect:superClass()
  return BaseClass
end

function BoardSelect:__gc()
  --Destroy derived class first
  BoardSelect._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function BoardSelect:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BoardSelect:_destroy()
  assert(not self.__BoardSelectCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function BoardSelect:_create(init)
  self.__BoardSelectCalledLoad = false
  __ctor(self, init)
end

function BoardSelect:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BoardSelectCalledLoad = true
end

function BoardSelect:unLoad()
  assert(self.__BoardSelectCalledLoad, "Must load before unBoardSelect")

  --unload derived first...
  __unLoad(self)
  self.__BoardSelectCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return BoardSelect
