local Interface = require 'NJLI.Interface'

local __interface = Interface()

--#############################################################################
--World State Functions
--#############################################################################

function __NJLIWorldEnterState()
  --print("__NJLIWorldEnterState")
  __interface:getStateMachine():_worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
  --print("__NJLIWorldUpdateState")
  __interface:getStateMachine():_worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
  --print("__NJLIWorldExitState")
  __interface:getStateMachine():_worldExitState()
end

function __NJLIWorldOnMessage(message)
  --print("__NJLIWorldOnMessage")
  __interface:getStateMachine():_worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
  --print("__NJLIWorldKeyboardShow")
  __interface:getStateMachine():_worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
  --print("__NJLIWorldKeyboardCancel")
  __interface:getStateMachine():_worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
  --print("__NJLIWorldKeyboardReturn")
  __interface:getStateMachine():_worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
  --print("__NJLIWorldReceivedMemoryWarning")
  __interface:getStateMachine():_worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
  --print("__NJLIWorldGamePause")
  __interface:getStateMachine():_worldGamePause()
end

function __NJLIWorldGameUnPause()
  --print("__NJLIWorldGameUnPause")
  __interface:getStateMachine():_worldGameUnPause()
end

function __NJLIWorldRenderHUD()
  --print("__NJLIWorldRenderHUD")
  __interface:getStateMachine():_worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
  --print("__NJLIWorldTouchDown")
  assert(touches ~= nil, "The touches are nil")
  __interface:getStateMachine():_worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
  --print("__NJLIWorldTouchUp")
  __interface:getStateMachine():_worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
  --print("__NJLIWorldTouchMove")
  __interface:getStateMachine():_worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
  --print("__NJLIWorldTouchCancelled")
  __interface:getStateMachine():_worldTouchCancelled(touches)
end

function __NJLIWorldWillResignActive()
  --print("__NJLIWorldWillResignActive")
  __interface:getStateMachine():_worldWillResignActive()
end

function __NJLIWorldDidBecomeActive()
  --print("__NJLIWorldDidBecomeActive")
  __interface:getStateMachine():_worldDidBecomeActive()
end

function __NJLIWorldDidEnterBackground()
  --print("__NJLIWorldDidEnterBackground")
  __interface:getStateMachine():_worldDidEnterBackground()
end

function __NJLIWorldWillEnterForeground()
  --print("__NJLIWorldWillEnterForeground")
  __interface:getStateMachine():_worldWillEnterForeground()
end

function __NJLIWorldWillTerminate()
  --print("__NJLIWorldWillTerminate")
  __interface:getStateMachine():_worldWillTerminate()
end

function __NJLIWorldInterrupt()
  --print("__NJLIWorldInterrupt")
  __interface:getStateMachine():_worldInterrupt()
end

function __NJLIWorldResumeInterrupt()
  --print("__NJLIWorldResumeInterrupt")
  __interface:getStateMachine():_worldResumeInterrupt()
end

--#############################################################################
--Scene State Functions
--#############################################################################

function __NJLISceneEnterState(scene)
  --print("__NJLISceneEnterState")
  __interface:getStateMachine():_sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
  --print("__NJLISceneUpdateState")
  __interface:getStateMachine():_sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
  --print("__NJLISceneExitState")
  __interface:getStateMachine():_sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
  --print("__NJLISceneOnMessage")
  __interface:getStateMachine():_sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
  --print("__NJLISceneKeyboardShow")
  __interface:getStateMachine():_sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
  --print("__NJLISceneKeyboardCancel")
  __interface:getStateMachine():_sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
  --print("__NJLISceneKeyboardReturn")
  __interface:getStateMachine():_sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
  --print("__NJLISceneRenderHUD")
  __interface:getStateMachine():_sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
  --print("__NJLISceneGamePause")
  __interface:getStateMachine():_sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
  --print("__NJLISceneGameUnPause")
  __interface:getStateMachine():_sceneGameUnPause(scene)
end

function __NJLISceneTouchDown(scene, touches)
  --print("__NJLISceneTouchDown")
  __interface:getStateMachine():_sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
  --print("__NJLISceneTouchUp")
  __interface:getStateMachine():_sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
  --print("__NJLISceneTouchMove")
  __interface:getStateMachine():_sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
  --print("__NJLISceneTouchCancelled")
  __interface:getStateMachine():_sceneTouchCancelled(scene, touches)
end

function __NJLISceneReceivedMemoryWarning(scene)
  --print("__NJLISceneReceivedMemoryWarning")
  __interface:getStateMachine():_sceneReceivedMemoryWarning(scene)
end

function __NJLISceneWillResignActive(scene)
  --print("__NJLISceneWillResignActive")
  __interface:getStateMachine():_sceneWillResignActive(scene)
end

function __NJLISceneDidBecomeActive(scene)
  --print("__NJLISceneDidBecomeActive")
  __interface:getStateMachine():_sceneDidBecomeActive(scene)
end

function __NJLISceneDidEnterBackground(scene)
  --print("__NJLISceneDidEnterBackground")
  __interface:getStateMachine():_sceneDidEnterBackground(scene)
end

function __NJLISceneWillEnterForeground(scene)
  --print("__NJLISceneWillEnterForeground")
  __interface:getStateMachine():_sceneWillEnterForeground(scene)
end

function __NJLISceneWillTerminate(scene)
  --print("__NJLISceneWillTerminate")
  __interface:getStateMachine():_sceneWillTerminate(scene)
end

function __NJLISceneInterrupt(scene)
  --print("__NJLISceneInterrupt")
  __interface:getStateMachine():_sceneInterrupt(scene)
end

function __NJLISceneResumeInterrupt(scene)
  --print("__NJLISceneResumeInterrupt")
  __interface:getStateMachine():_sceneResumeInterrupt(scene)
end

--#############################################################################
--Node State Functions
--#############################################################################

function __NJLINodeEnterState(node)
  --print("__NJLINodeEnterState")
  __interface:getStateMachine():_nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
  --print("__NJLINodeUpdateState")
  __interface:getStateMachine():_nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
  --print("__NJLINodeExitState")
  __interface:getStateMachine():_nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
  --print("__NJLINodeOnMessage")
  __interface:getStateMachine():_nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
  --print("__NJLINodeCollide")
  __interface:getStateMachine():_nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
  --print("__NJLINodeNear")
  __interface:getStateMachine():_nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
  --print("__NJLINodeActionUpdate")
  __interface:getStateMachine():_nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
  --print("__NJLINodeActionComplete")
  __interface:getStateMachine():_nodeActionComplete(action)
end

function __NJLINodeRayTouchDown(rayContact)
  --print("__NJLINodeRayTouchDown")
  __interface:getStateMachine():_rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
  --print("__NJLINodeRayTouchUp")
  __interface:getStateMachine():_rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
  --print("__NJLINodeRayTouchMove")
  __interface:getStateMachine():_rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
  --print("__NJLINodeRayTouchCancelled")
  __interface:getStateMachine():_rayTouchCancelled(rayContact)
end

function __NJLINodeRayTouchMissed(node)
    --print("__NJLINodeRayTouchMissed")
  __interface:getStateMachine():_rayTouchMissed(node)
end

function __NJLINodeKeyboardShow(node)
  --print("__NJLINodeKeyboardShow")
  __interface:getStateMachine():_nodeKeyboardShow(node)
end

function __NJLINodeKeyboardCancel(node)
  --print("__NJLINodeKeyboardCancel")
  __interface:getStateMachine():_nodeKeyboardCancel(node)
end

function __NJLINodeKeyboardReturn(node)
  --print("__NJLINodeKeyboardReturn")
  __interface:getStateMachine():_nodeKeyboardReturn(node)
end

function __NJLINodeRenderHUD(node)
  --print("__NJLINodeRenderHUD")
  __interface:getStateMachine():_nodeRenderHUD(node)
end

function __NJLINodeGamePause(node)
  --print("__NJLINodeGamePause")
  __interface:getStateMachine():_nodeGamePause(node)
end

function __NJLINodeGameUnPause(node)
  --print("__NJLINodeGameUnPause")
  __interface:getStateMachine():_nodeGameUnPause(node)
end

function __NJLINodeTouchDown(node, touches)
  --print("__NJLINodeTouchDown")
  __interface:getStateMachine():_nodeTouchDown(node, touches)
end

function __NJLINodeTouchUp(node, touches)
  --print("__NJLINodeTouchUp")
  __interface:getStateMachine():_nodeTouchUp(node, touches)
end

function __NJLINodeTouchMove(node, touches)
  --print("__NJLINodeTouchMove")
  __interface:getStateMachine():_nodeTouchMove(node, touches)
end

function __NJLINodeTouchCancelled(node, touches)
  --print("__NJLINodeTouchCancelled")
  __interface:getStateMachine():_nodeTouchCancelled(node, touches)
end

--#############################################################################
--Device Functions
--#############################################################################

function __NJLIUpdate(timeStep)
  --print("__NJLIUpdate(".. timeStep .. ")")
  __interface:getDeviceEntity():update(timeStep)
end

function __NJLIRender()
  --print("__NJLIRender()")
  __interface:getDeviceEntity():render()
end

function __NJLIResize(width, height, orientation)
  --print("__NJLIResize(" .. width .. ", " .. height .. ", " .. orientation .. ")")
  __interface:getDeviceEntity():resize(width, height, orientation)
end

function __NJLITouchDown(touches)
  --print("__NJLITouchDown(" .. #touches .. ")")
  __interface:getDeviceEntity():touchDown(touches)
end

function __NJLITouchUp(touches)
  --print("__NJLITouchUp(" .. #touches .. ")")
  __interface:getDeviceEntity():touchUp(touches)
end

function __NJLITouchMove(touches)
  --print("__NJLITouchMove(" .. #touches .. ")")
  __interface:getDeviceEntity():touchMove(touches)
end

function __NJLITouchCancelled(touches)
  --print("__NJLITouchCancelled(" .. #touches .. ")")
  __interface:getDeviceEntity():touchCancelled(touches)
end

return __interface

