local origAssert = assert
assert = function(b, message) 
  if not b then
    print(debug.traceback())
  end
  origAssert (b, message)
end

local MyGame = require "YappyGame"

local njligame = require "njli.game"
njliGameInstance = njligame()

-- mygame = MyGame({
--  gameInstance = njliGameInstance,
-- })
-- mygame:startStateMachine()


--##############################################################################

function __NJLIWorldEnterState()
  print("__NJLIWorldEnterState")
  njliGameInstance:worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
--  print("__NJLIWorldUpdateState")
  njliGameInstance:worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
  print("__NJLIWorldExitState")
  njliGameInstance:worldExitState()
end

function __NJLIWorldOnMessage(message)
  print("__NJLIWorldOnMessage")
  njliGameInstance:worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
  print("__NJLIWorldKeyboardShow")
  njliGameInstance:worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
  print("__NJLIWorldKeyboardCancel")
  njliGameInstance:worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
  print("__NJLIWorldKeyboardReturn")
  njliGameInstance:worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
  print("__NJLIWorldReceivedMemoryWarning")
  njliGameInstance:worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
  print("__NJLIWorldGamePause")
  njliGameInstance:worldGamePause()
end

function __NJLIWorldGameUnPause()
  print("__NJLIWorldGameUnPause")
  njliGameInstance:worldGameUnPause()
end

function __NJLIWorldRenderHUD()
--  print("__NJLIWorldRenderHUD")
  njliGameInstance:worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
--  print("__NJLIWorldTouchDown")
  njliGameInstance:worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
--  print("__NJLIWorldTouchUp")
  njliGameInstance:worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
--  print("__NJLIWorldTouchMove")
  njliGameInstance:worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
--  print("__NJLIWorldTouchCancelled")
  njliGameInstance:worldTouchCancelled(touches)
end

function __NJLIWorldWillResignActive()
--  print("__NJLIGameWillResignActive")
  njliGameInstance:worldWillResignActive()
end

function __NJLIWorldDidBecomeActive()
--  print("__NJLIGameDidBecomeActive")
  njliGameInstance:worldDidBecomeActive()
end

function __NJLIWorldDidEnterBackground()
--  print("__NJLIGameDidEnterBackground")
  njliGameInstance:worldDidEnterBackground()
end

function __NJLIWorldWillEnterForeground()
--  print("__NJLIGameWillEnterForeground")
  njliGameInstance:worldWillEnterForeground()
end

function __NJLIWorldWillTerminate()
--  print("__NJLIGameWillTerminate")
  njliGameInstance:worldWillTerminate()
end

function __NJLIWorldInterrupt()
--  print("__NJLIGameInterrupt")
  njliGameInstance:worldInterrupt()
end

function __NJLIWorldResumeInterrupt()
--  print("__NJLIGameResumeInterrupt")
  njliGameInstance:worldResumeInterrupt()
end

--##############################################################################

function __NJLISceneEnterState(scene)
  print("__NJLISceneEnterState")
  njliGameInstance:sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
--  print("__NJLISceneUpdateState")
  njliGameInstance:sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
  print("__NJLISceneExitState")
  njliGameInstance:sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
  print("__NJLISceneOnMessage")
  njliGameInstance:sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
  print("__NJLISceneKeyboardShow")
  njliGameInstance:sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
  print("__NJLISceneKeyboardCancel")
  njliGameInstance:sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
  print("__NJLISceneKeyboardReturn")
  njliGameInstance:sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
--  print("__NJLISceneRenderHUD")
  njliGameInstance:sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
  print("__NJLISceneGamePause")
  njliGameInstance:sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
  print("__NJLISceneGameUnPause")
  njliGameInstance:sceneGameUnPause(scene)
end

function __NJLISceneReceivedMemoryWarning(scene)
  print("__NJLISceneReceivedMemoryWarning")
  njliGameInstance:sceneReceivedMemoryWarning(scene)
end

function __NJLISceneTouchDown(scene, touches)
--  print("__NJLISceneTouchDown")
  njliGameInstance:sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
--  print("__NJLISceneTouchUp")
  njliGameInstance:sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
--  print("__NJLISceneTouchMove")
  njliGameInstance:sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
--  print("__NJLISceneTouchCancelled")
  njliGameInstance:sceneTouchCancelled(scene, touches)
end

function __NJLISceneWillResignActive(scene)
--  print("__NJLISceneWillResignActive")
  njliGameInstance:sceneWillResignActive(scene)
end

function __NJLISceneDidBecomeActive(scene)
--  print("__NJLISceneDidBecomeActive")
  njliGameInstance:sceneDidBecomeActive(scene)
end

function __NJLISceneDidEnterBackground(scene)
--  print("__NJLISceneDidEnterBackground")
  njliGameInstance:sceneDidEnterBackground(scene)
end

function __NJLISceneWillEnterForeground(scene)
--  print("__NJLISceneWillEnterForeground")
  njliGameInstance:sceneWillEnterForeground(scene)
end

function __NJLISceneWillTerminate(scene)
--  print("__NJLISceneWillTerminate")
  njliGameInstance:sceneWillTerminate(scene)
end

function __NJLISceneInterrupt(scene)
--  print("__NJLISceneInterrupt")
  njliGameInstance:sceneInterrupt(scene)
end

function __NJLISceneResumeInterrupt(scene)
--  print("__NJLISceneResumeInterrupt")
  njliGameInstance:sceneResumeInterrupt(scene)
end

--##############################################################################

function __NJLINodeEnterState(node)
  print("__NJLINodeEnterState")
  njliGameInstance:nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
  print("__NJLINodeUpdateState")
  njliGameInstance:nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
  print("__NJLINodeExitState")
  njliGameInstance:nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
  print("__NJLINodeOnMessage")
  njliGameInstance:nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
  print("__NJLINodeCollide")
  njliGameInstance:nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
  print("__NJLINodeNear")
  njliGameInstance:nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
  print("__NJLINodeActionUpdate")
  njliGameInstance:nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
  print("__NJLINodeActionComplete")
  njliGameInstance:nodeActionComplete(action)
end

function __NJLINodeRayTouchDown(rayContact)
  print("__NJLINodeRayTouchDown")
  njliGameInstance:rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
  print("__NJLINodeRayTouchUp")
  njliGameInstance:rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
  print("__NJLINodeRayTouchMove")
  njliGameInstance:rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
  print("__NJLINodeRayTouchCancelled")
  njliGameInstance:rayTouchCancelled(rayContact)
end

--##############################################################################

function __NJLIUpdate(timeStep)
--  print("__NJLIUpdate("..tostring(timeStep)..")")
  njliGameInstance:update(timeStep)
end

function __NJLIRender()
--  print("__NJLIRender()")
  njliGameInstance:render()
end

function __NJLIResize(width, height, orientation)
--  print("__NJLIResize(" .. tostring(width) .. ", " .. tostring(height) .. ", ".. tostring(orientation) .. ")")
  njliGameInstance:resize(width, height, orientation)
end

function __NJLITouchDown(touches)
--  print("__NJLITouchDown("..tostring(touches)..")")
  njliGameInstance:touchDown(touches)
end

function __NJLITouchUp(touches)
--  print("__NJLITouchUp("..tostring(touches)..")")
  njliGameInstance:touchUp(touches)
end

function __NJLITouchMove(touches)
--  print("__NJLITouchMove("..tostring(touches)..")")
  njliGameInstance:touchMove(touches)
end

function __NJLITouchCancelled(touches)
--  print("__NJLITouchCancelled("..tostring(touches)..")")
  njliGameInstance:touchCancelled(touches)
end



