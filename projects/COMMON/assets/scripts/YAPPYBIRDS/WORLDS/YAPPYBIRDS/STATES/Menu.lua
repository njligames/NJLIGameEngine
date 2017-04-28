local BaseClass = require "NJLI.STATEMACHINE.WorldEntityState"

local Menu = {}
Menu.__index = Menu

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

function Menu:enter()
  BaseClass.enter(self)
end

function Menu:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Menu:exit()
  BaseClass.exit(self)
end

function Menu:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Menu:renderHUD()
  BaseClass.renderHUD(self)
end

function Menu:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Menu:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Menu:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Menu:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Menu:pause()
  BaseClass.pause(self)
end

function Menu:unPause()
  BaseClass.unPause(self)
end

function Menu:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Menu:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Menu:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Menu:willResignActive()
  BaseClass.willResignActive(self)
end

function Menu:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Menu:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Menu:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Menu:willTerminate()
  BaseClass.willTerminate(self)
end

function Menu:interrupt()
  BaseClass.interrupt(self)
end

function Menu:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Menu:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Menu, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Menu:className()
  return "Menu"
end

function Menu:class()
  return self
end

function Menu:superClass()
  return BaseClass
end

function Menu:__gc()
  --Destroy derived class first
  Menu._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Menu:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Menu:_destroy()
  assert(not self.__GameplayCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Menu:_create(init)
  self.__GameplayCalledLoad = false
  __ctor(self, init)
end

function Menu:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GameplayCalledLoad = true
end

function Menu:unLoad()
  assert(self.__GameplayCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GameplayCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Menu
