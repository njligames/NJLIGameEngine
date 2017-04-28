local DeviceEntity = {}
DeviceEntity.__index = DeviceEntity

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

function DeviceEntity:update(timeStep)
  --print("DeviceEntity:update("..timeStep..")")
end

function DeviceEntity:render()
  --print("DeviceEntity:render()")
end

function DeviceEntity:resize(width, height, orientation)
  --print("DeviceEntity:resize("..width..", "..height..", "..orientation..")")
end

function DeviceEntity:touchDown(touches)
  --print("DeviceEntity:touchDown("..#touches..")")
end

function DeviceEntity:touchUp(touches)
  --print("DeviceEntity:touchUp("..#touches..")")
end

function DeviceEntity:touchMove(touches)
  --print("DeviceEntity:touchMove("..#touches..")")
end

function DeviceEntity:touchCancelled(touches)
  --print("DeviceEntity:touchCancelled("..#touches..")")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(DeviceEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function DeviceEntity:className()
  return "DeviceEntity"
end

function DeviceEntity:class()
  return self
end

function DeviceEntity:superClass()
  return nil
end

function DeviceEntity:isa(theClass)
  local b_isa = false
  local cur_class = theClass:class()
  while ( nil ~= cur_class ) and ( false == b_isa ) do
    if cur_class == theClass then
      b_isa = true
    else
      cur_class = cur_class:superClass()
    end
  end

  return b_isa
end

function DeviceEntity:__gc()
  DeviceEntity._destroy(self)
end

function DeviceEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function DeviceEntity:_destroy()
  assert(not self.__DeviceCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function DeviceEntity:_create(init)
  self.__DeviceCalledLoad = false

  __ctor(self, init)
end

function DeviceEntity:load()
  __load(self)

  self.__DeviceCalledLoad = true
end

function DeviceEntity:unLoad()
  assert(self.__DeviceCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__DeviceCalledLoad = false
end

return DeviceEntity
