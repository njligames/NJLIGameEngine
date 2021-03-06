local arg={...}

local getOrthoCamera = function(self)
 local root = njli.World.getInstance():getScene():getRootNode()
 local orthoCameraNode = root:findChildNode("orthoCamera")
 return orthoCameraNode:getCamera()
end

local getPerspectiveCamera = function(self)
 local root = njli.World.getInstance():getScene():getRootNode()
 local perspectiveCameraNode = root:findChildNode("perspectiveCamera")
 return perspectiveCameraNode:getCamera()
end

local push = function(self, stateName)
 if self.worldStates[stateName] ~= nil then
 self.worldStates[stateName]:push()
 end
end

local start = function(self)
 
 
 assert(self.startWorldName ~= nil, "The start world name is nil")
 self:push(self.startWorldName)

 return self.worldStates
end

local delete = function(self)

 for k,v in pairs(self.worldStates) do
 self.worldStates[k]:__gc()
 end
 self.worldStates = {}

 local root = njli.World.getInstance():getScene():getRootNode()
 local orthoCameraNode = root:findChildNode("orthoCamera")
 local perspectiveCameraNode = root:findChildNode("perspectiveCamera")

 njli.Camera.destroy(perspectiveCameraNode:getCamera())
 njli.Node.destroy(perspectiveCameraNode)
 njli.Camera.destroy(orthoCameraNode:getCamera())
 njli.Node.destroy(orthoCameraNode)
 njli.Node.destroy(root)

 njli.ShaderProgram.destroy(self.shader)
 njli.PhysicsWorld.destroy(self.physicsWorld)
 njli.Scene.destroy(self.scene)
end

local methods = 
{
 getOrthoCamera = getOrthoCamera,
 getPerspectiveCamera = getPerspectiveCamera,
 push = push,
 start = start,
	__gc = delete
}

local new = function(worldName)
 njli.World.getInstance():setName(worldName)

 local scene = njli.Scene.create()
 njli.World.getInstance():addScene(scene)
 njli.World.getInstance():getScene():setName(worldName .. "Scene")

 local physicsWorld = njli.PhysicsWorld.create()
 physicsWorld:setGravity(njli.btVector3(0, -9.81, 0))
 njli.World.getInstance():getScene():addPhysicsWorld(physicsWorld)

 local shader = njli.ShaderProgram.create();
 shader:setName("Yappy Shader")
 njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)

 local orthoCameraNode = createOrthoCameraNode("orthoCamera")
 local perspectiveCameraNode = createPerspectiveCameraNode("perspectiveCamera")

 local rootNode = njli.Node.create()
 rootNode:setName("rootNode")

 rootNode:addChildNode(orthoCameraNode)
 rootNode:addChildNode(perspectiveCameraNode)

 njli.World.getInstance():getScene():addRootNode(rootNode)

 local worldStates = {}

 
 
 

 
 
 

 
 
 

 
 
 

 key = _worldStateNames.yappyGame
 local worldYappyGameState = require "worlds.worldYappyGameState"
 worldStates[key] = worldYappyGameState.new(key)

 local properties = 
 {
 scene = scene,

 physicsWorld = physicsWorld,
 shader = shader,

 worldStates = worldStates,
 }
 
 return setmetatable(properties, {__index = methods})
end

return {
 new = new,
}
