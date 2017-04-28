local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Characters = {}
Characters.__index = Characters

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

function Characters:enter()
  BaseClass.enter(self)
end

function Characters:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Characters:exit()
  BaseClass.exit(self)
end

function Characters:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Characters:renderHUD()
  BaseClass.renderHUD(self)
end

function Characters:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Characters:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Characters:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Characters:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Characters:pause()
  BaseClass.pause(self)
end

function Characters:unPause()
  BaseClass.unPause(self)
end

function Characters:keyboardShow()
  BaseClass.keyboardShow(self)
end

function Characters:keyboardCancel()
  BaseClass.keyboardCancel(self)
end

function Characters:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
end

function Characters:willResignActive()
  BaseClass.willResignActive(self)
end

function Characters:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Characters:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Characters:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Characters:willTerminate()
  BaseClass.willTerminate(self)
end

function Characters:interrupt()
  BaseClass.interrupt(self)
end

function Characters:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Characters:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Characters, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Characters:className()
  return "Characters"
end

function Characters:class()
  return self
end

function Characters:superClass()
  return BaseClass
end

function Characters:__gc()
  --Destroy derived class first
  Characters._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Characters:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Characters:_destroy()
  assert(not self.__CharactersCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Characters:_create(init)
  self.__CharactersCalledLoad = false
  __ctor(self, init)
end

function Characters:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__CharactersCalledLoad = true
end

function Characters:unLoad()
  assert(self.__CharactersCalledLoad, "Must load before unCharacters")

  --unload derived first...
  __unLoad(self)
  self.__CharactersCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Characters
