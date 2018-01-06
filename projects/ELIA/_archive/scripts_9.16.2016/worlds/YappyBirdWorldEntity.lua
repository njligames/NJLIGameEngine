local WorldEntity = require "njli.ui.worldentity"

local YappyBirdWorldEntity = {}
YappyBirdWorldEntity.__index = YappyBirdWorldEntity

local json = require('json')

setmetatable(YappyBirdWorldEntity, {
 __index = WorldEntity,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 WorldEntity.create(self, ...)
 self:create(...)
 return self
 end,
})

function YappyBirdWorldEntity:className()
 return "YappyBirdWorldEntity"
end

function YappyBirdWorldEntity:class()
 return self
end

function YappyBirdWorldEntity:superClass()
 return WorldEntity
end

function YappyBirdWorldEntity:destroy()
 YappyBirdWorldEntity.__gc(self)
 WorldEntity.destroy(self)
end

function YappyBirdWorldEntity:create(init)
 

 if init then
 
 end
end

function YappyBirdWorldEntity:__gc()
 
end

function YappyBirdWorldEntity:__tostring()
 
 return json:stringify(self)
end



function YappyBirdWorldEntity:load()
 WorldEntity.load(self)
end

function YappyBirdWorldEntity:unLoad()
 WorldEntity.unLoad(self)
end

function YappyBirdWorldEntity:startStateMachine()
 WorldEntity.startStateMachine(self)
end

function YappyBirdWorldEntity:enter()
 WorldEntity.enter(self)
end

function YappyBirdWorldEntity:update(timeStep)
 WorldEntity.update(self, timeStep)
end

function YappyBirdWorldEntity:exit()
 WorldEntity.exit(self)
end

function YappyBirdWorldEntity:onMessage(message)
 WorldEntity.onMessage(self, message)
end

function YappyBirdWorldEntity:touchDown(touches)
 WorldEntity.touchDown(self, touches)
end

function YappyBirdWorldEntity:touchUp(touches)
 WorldEntity.touchUp(self, touches)
end

function YappyBirdWorldEntity:touchMove(touches)
 WorldEntity.touchMove(self, touches)
end

function YappyBirdWorldEntity:touchCancelled(touches)
 WorldEntity.touchCancelled(self, touches)
end

function YappyBirdWorldEntity:renderHUD()
 WorldEntity.renderHUD(self)
end

function YappyBirdWorldEntity:keyboardShow()
 WorldEntity.keyboardShow(self)
end

function YappyBirdWorldEntity:keyboardCancel()
 WorldEntity.keyboardCancel(self)
end

function YappyBirdWorldEntity:keyboardReturn(text)
 WorldEntity.keyboardReturn(self, text)
end

function YappyBirdWorldEntity:receivedMemoryWarning()
 WorldEntity.receivedMemoryWarning(self)
end

function YappyBirdWorldEntity:pause()
 WorldEntity.pause(self)
end

function YappyBirdWorldEntity:unPause()
 WorldEntity.unPause(self)
end

return YappyBirdWorldEntity
