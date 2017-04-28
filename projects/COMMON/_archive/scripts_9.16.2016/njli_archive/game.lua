local Game = {}
Game.__index = Game

local json = require('json')

setmetatable(Game, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function Game:className()
  return "Game"
end

function Game:class()
  return self
end

function Game:superClass()
  return nil
end

function Game:isa(theClass)
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

function Game:destroy()
  Game.__gc(self)
end

function Game:create(init)

  local EntityManager = require "njli.entitymanager"
  self._entityManager = EntityManager()

  if init then

  end
end

function Game:__gc()

  self._entityManager:destroy()
end

function Game:__tostring()

  return json:stringify(self)
end

function Game:getEntityManager()
  return self._entityManager
end

function Game:worldKeyboardShow()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:keyboardShow()
  end
end

function Game:worldKeyboardCancel()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:keyboardCancel()
  end
end

function Game:worldKeyboardReturn(text)
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:keyboardReturn(text)
  end
end

function Game:worldReceivedMemoryWarning()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:receivedMemoryWarning()
  end
end

function Game:worldGamePause()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:pause()
  end
end

function Game:worldGameUnPause()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:unPause()
  end
end

function Game:worldRenderHUD()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:renderHUD()
  end
end

function Game:worldEnterState()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:enter()
  end
end

function Game:worldUpdateState(timeStep)
  assert(timeStep, "The timeStep is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:update(timeStep)
  end
end

function Game:worldExitState()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:exit()
  end
end

function Game:worldOnMessage(message)
  assert(message, "The message is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:onMessage()
  end
end

function Game:worldTouchDown(touches)
  assert(touches, "The touches is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:touchDown(touches)
  end
end

function Game:worldTouchUp(touches)
  assert(touches, "The touches is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:touchUp(touches)
  end
end

function Game:worldTouchMove(touches)
  assert(touches, "The touches is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:touchMove(touches)
  end
end

function Game:worldTouchCancelled(touches)
  assert(touches, "The touches is nil")

  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:touchCancelled(touches)
  end
end

function Game:worldWillResignActive()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:willResignActive()
  end
end

function Game:worldDidBecomeActive()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:didBecomeActive()
  end
end

function Game:worldDidEnterBackground()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:didEnterBackground()
  end
end

function Game:worldWillEnterForeground()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:willEnterForeground()
  end
end

function Game:worldWillTerminate()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:willTerminate()
  end
end

function Game:worldInterrupt()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:interrupt()
  end
end

function Game:worldResumeInterrupt()
  local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
  assert(worldEntity, "The worldEntity is nil")

  if worldEntity:hasState() then
    worldEntity:resumeInterrupt()
  end
end










function Game:sceneEnterState(scene)
  assert(scene, "The scene is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:enter()
  end
end

function Game:sceneUpdateState(scene, timeStep)
  assert(scene, "The scene is nil")
  assert(timeStep, "The timeStep is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:update(timeStep)
  end
end

function Game:sceneExitState(scene)
  assert(scene, "The scene is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:exit()
  end
end

function Game:sceneOnMessage(scene, message)
  assert(scene, "The scene is nil")
  assert(message, "The message is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:onMessage(message)
  end
end

function Game:sceneTouchDown(scene, touches)
  assert(scene, "The scene is nil")
  assert(touches, "The touches is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:touchDown(touches)
  end
end

function Game:sceneTouchUp(scene, touches)
  assert(scene, "The scene is nil")
  assert(touches, "The touches is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:touchUp(touches)
  end
end

function Game:sceneTouchMove(scene, touches)
  assert(scene, "The scene is nil")
  assert(touches, "The touches is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:touchMove(touches)
  end
end

function Game:sceneTouchCancelled(scene, touches)
  assert(scene, "The scene is nil")
  assert(touches, "The touches is nil")

  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:touchCancelled(touches)
  end
end


function Game:sceneKeyboardShow(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:keyboardShow()
  end
end

function Game:sceneKeyboardCancel(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:keyboardCancel()
  end
end

function Game:sceneKeyboardReturn(scene, text)
  assert(scene, "The scene is nil")
  assert(text, "The text is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:keyboardReturn(text)
  end
end

function Game:sceneRenderHUD(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:renderHUD()
  end
end

function Game:sceneGamePause(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:pause()
  end
end

function Game:sceneGameUnPause(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:unPause()
  end
end

function Game:sceneReceivedMemoryWarning(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:receivedMemoryWarning()
  end
end

function Game:sceneWillResignActive(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:willResignActive()
  end
end

function Game:sceneDidBecomeActive(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:didBecomeActive()
  end
end

function Game:sceneDidEnterBackground(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:didEnterBackground()
  end
end

function Game:sceneWillEnterForeground(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:willEnterForeground()
  end
end

function Game:sceneWillTerminate(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:willTerminate()
  end
end

function Game:sceneInterrupt(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:interrupt()
  end
end

function Game:sceneResumeInterrupt(scene)
  assert(scene, "The scene is nil")
  
  local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
  assert(sceneEntity, "The sceneEntity is nil")

  if sceneEntity:hasState() then
    sceneEntity:resumeInterrupt()
  end
end

function Game:nodeEnterState(node)
  assert(node, "The node is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:enter()
  end
end

function Game:nodeUpdateState(node, timeStep)
  assert(node, "The node is nil")
  assert(timeStep, "The timeStep is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:update()
  end
end

function Game:nodeExitState(node)
  assert(node, "The node is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:exit()
  end
end

function Game:nodeOnMessage(node, message)
  assert(node, "The node is nil")
  assert(message, "The message is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:onMessage()
  end
end

function Game:nodeCollide(node, otherNode, collisionPoint)
  assert(node, "The node is nil")
  assert(otherNode, "The otherNode is nil")
  assert(collisionPoint, "The collisionPoint is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:collide(otherNode, collisionPoint)
  end
end

function Game:nodeNear(node, otherNode)
  assert(node, "The node is nil")
  assert(otherNode, "The otherNode is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:near(otherNode)
  end
end

function Game:nodeActionUpdate(action, timeStep)
  assert(action, "The action is nil")
  assert(timeStep, "The timeStep is nil")

  local node = action:getParent()
  assert(node, "The node is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:actionUpdate(action, timeStep)
  end
end

function Game:nodeActionComplete(action)
  assert(action, "The action is nil")

  local node = action:getParent()
  assert(node, "The node is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:actionComplete(action)
  end
end

function Game:rayTouchDown(rayContact)
  assert(rayContact, "The rayContact is nil")

  local hitNode = rayContact:getHitNode()
  assert(hitNode, "The hitNode is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:touchDown(rayContact)
  end
end

function Game:rayTouchUp(rayContact)
  assert(rayContact, "The rayContact is nil")

  local hitNode = rayContact:getHitNode()
  assert(hitNode, "The hitNode is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:touchUp(rayContact)
  end
end

function Game:rayTouchMove(rayContact)
  assert(rayContact, "The rayContact is nil")

  local hitNode = rayContact:getHitNode()
  assert(hitNode, "The hitNode is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:touchMove(rayContact)
  end
end

function Game:rayTouchCancelled(rayContact)
  assert(rayContact, "The rayContact is nil")

  local hitNode = rayContact:getHitNode()
  assert(hitNode, "The hitNode is nil")

  local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
  assert(nodeEntity, "The nodeEntity is nil")

  if nodeEntity:hasState() then
    nodeEntity:touchCancelled(rayContact)
  end
end

function Game:update(timeStep)
--  print("Game:update("..tostring(timeStep)..")")
end

function Game:render()
--  print("Game:render()")
end

function Game:resize(width, height, orientation)
  print("Game:resize(" .. tostring(width) .. ", " .. tostring(height) .. ", " .. tostring(orientation) .. ")")
end

function Game:touchDown(touches)
--  print("Game:touchDown("..tostring(touches)..")")
end

function Game:touchUp(touches)
--  print("Game:touchUp("..tostring(touches)..")")
end

function Game:touchMove(touches)
--  print("Game:touchMove("..tostring(touches)..")")
end

function Game:touchCancelled(touches)
--  print("Game:touchCancelled("..tostring(touches)..")")
end

return Game
