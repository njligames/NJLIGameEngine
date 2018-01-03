
debugging = nil

local Interface = require 'NJLI.Interface'
local BitmapFont = require 'NJLI.BitmapFont'
local YappyGame = require "YAPPYBIRDS.YappyGame"

RanchersFont = nil
Geometry2D = nil
OrthographicCameraNode = nil
PerspectiveCameraNode = nil
MyGame = nil
gInterface = nil

local Create = function()

  if nil == OrthographicCameraNode then
    OrthographicCameraNode = njli.Node.create()
    OrthographicCameraNode:setName("orthoCamera")

    local camera = njli.Camera.create()
    camera:enableOrthographic()
    camera:setRenderCategory(RenderCategories.orthographic)
    camera:setName("orthoCamera")

    OrthographicCameraNode:setCamera(camera)
    
    njli.World.getInstance():enableDebugDraw(OrthographicCameraNode:getCamera())
  end
  
  if nil == PerspectiveCameraNode then
    PerspectiveCameraNode = njli.Node.create()
    PerspectiveCameraNode:setName("perspectiveCamera")

    local camera = njli.Camera.create()
    camera:enableOrthographic(false)
    camera:setRenderCategory(RenderCategories.perspective)
    camera:setName("perspectiveCamera")

    PerspectiveCameraNode:setCamera(camera)
  end
  
  if nil == Geometry2D then
    Geometry2D = {}
    
    for i=1,5 do
      Geometry2D[i] = njli.Sprite2D.create()
      Geometry2D[i]:setName("YappyBird Geometry " .. i)
      
      local material = njli.Material.create()
      material:setName("YappyBird Material "  .. i)
      
      local shader = njli.ShaderProgram.create()
      shader:setName("YappyBird Shader " .. i)
      njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
      
      Geometry2D[i]:setMaterial(material)
      Geometry2D[i]:setShaderProgram(shader)
      Geometry2D[i]:show(OrthographicCameraNode:getCamera())
      Geometry2D[i]:show(PerspectiveCameraNode:getCamera())
    end
  end
  
  if nil == RanchersFont then
    RanchersFont = BitmapFont({file='Ranchers_GlyphDesigner.fnt'})
    RanchersFont:load()
    RanchersFont:show(OrthographicCameraNode:getCamera())
    RanchersFont:hide(PerspectiveCameraNode:getCamera())
  end
  
  if nil == gInterface then
    gInterface = Interface()
    gInterface:getDeviceEntity():create()
  end
  
  if nil == MyGame then
    MyGame = YappyGame(Worlds.yappygame)
    MyGame:startStateMachine()
  end
  
end
  
local Destroy = function()

  if MyGame then
    MyGame:stopStateMachine()
    MyGame = nil
  end
  
  if gInterface then
    gInterface:getDeviceEntity():destroy()
    gInterface = nil
  end
  
  if RanchersFont then
    RanchersFont:unLoad()
    RanchersFont = nil
  end
  
  if Geometry2D[1] then
    local material = Geometry2D[1]:getMaterial()
    njli.Material.destroy(material)
    
    local shader = Geometry2D[1]:getShaderProgram()
    njli.ShaderProgram.destroy(shader)
    
    njli.Sprite2D.destroy(Geometry2D[1])
--    Geometry2D = nil
  end
  
  if PerspectiveCameraNode then
    local camera = PerspectiveCameraNode:getCamera()
    njli.Camera.destroy(camera)
    
    njli.Node.destroy(PerspectiveCameraNode)
    PerspectiveCameraNode = nil
  end
  
  if OrthographicCameraNode then
    local camera = OrthographicCameraNode:getCamera()
    njli.Camera.destroy(camera)
    
    njli.Node.destroy(OrthographicCameraNode)
    OrthographicCameraNode = nil
  end
  
end

--function(event) pcall(onUpdate, event) end

local Update = function(timeStep)

  if debugging == nil then
        debugging = false
        return false
    end

    if not debugging then
        --require("mobdebug").start()
        --require("mobdebug").coro()
        debugging = true
    end
    
    

--  local pos = bullet.btVector3(100, 100, -1)
--  local color = bullet.btVector4(0.202, 0.643, 0.000, 1)
--  njli.World.getInstance():getDebugDrawer():point(pos, color, 100)--, 100000, 10)
  
  if gInterface then
    gInterface:getDeviceEntity():update(timeStep)
  end
  
 --njli.World.getInstance():setBackgroundColor(0.453, 0.108, 0.000)
end

local Render = function()
  if gInterface then
    gInterface:getDeviceEntity():render()
  end
end

local Resize = function(width, height, orientation)
  if gInterface then
    gInterface:getDeviceEntity():resize(width, height, orientation)
  end
end

local TouchesDown = function(touches)
  if gInterface then
    gInterface:getDeviceEntity():touchesDown(touches)
  end
end

local TouchesUp = function(touches)
  if gInterface then
    gInterface:getDeviceEntity():touchesUp(touches)
  end
end

local TouchesMove = function(touches)
  if gInterface then
    gInterface:getDeviceEntity():touchesMove(touches)
  end
end

local TouchesCancelled = function(touches)
  if gInterface then
    gInterface:getDeviceEntity():touchesCancelled(touches)
  end
end

local TouchDown = function(touch)
  if gInterface then
    gInterface:getDeviceEntity():touchDown(touch)
  end
end

local TouchUp = function(touch)
  if gInterface then
    gInterface:getDeviceEntity():touchUp(touch)
  end
end

local TouchMove = function(touch)
  if gInterface then
    gInterface:getDeviceEntity():touchMove(touch)
  end
end

local TouchCancelled = function(touches)
  if gInterface then
    gInterface:getDeviceEntity():touchCancelled(touches)
  end
end

local MouseDown = function(mouse)
  if gInterface then
    gInterface:getDeviceEntity():mouseDown(mouse)
  end
end

local MouseUp = function(mouse)
  if gInterface then
    gInterface:getDeviceEntity():mouseUp(mouse)
  end
end

local MouseMove = function(mouse)
  if gInterface then
    gInterface:getDeviceEntity():mouseMove(mouse)
  end
end

local WorldEnterState = function()
  if gInterface then
    gInterface:getStateMachine():_worldEnterState()
  end
end

local WorldUpdateState = function(timeStep)
  if gInterface then
    gInterface:getStateMachine():_worldUpdateState(timeStep)
  end
end

local WorldExitState = function()
  if gInterface then
    gInterface:getStateMachine():_worldExitState()
  end
end

local WorldOnMessage = function(message)
  if gInterface then
    gInterface:getStateMachine():_worldOnMessage(message)
  end
end

local WorldKeyboardShow = function()
  if gInterface then
    gInterface:getStateMachine():_worldKeyboardShow()
  end
end

local WorldKeyboardCancel = function()
  if gInterface then
    gInterface:getStateMachine():_worldKeyboardCancel()
  end  
end

local WorldKeyboardReturn = function(text)
  if gInterface then
    gInterface:getStateMachine():_worldKeyboardReturn(text)
  end
end

local WorldReceivedMemoryWarning = function()
  if gInterface then
    gInterface:getStateMachine():_worldReceivedMemoryWarning()
  end
end

local WorldGamePause = function()
  if gInterface then
    gInterface:getStateMachine():_worldGamePause()
  end
end

local WorldGameUnPause = function()
  if gInterface then
    gInterface:getStateMachine():_worldGameUnPause()
  end
end

local WorldRenderHUD = function()
  if gInterface then
    gInterface:getStateMachine():_worldRenderHUD()
  end
end

local WorldTouchesDown = function(touches)
    if gInterface then
        gInterface:getStateMachine():_worldTouchesDown(touches)
    end
end

local WorldTouchesUp = function(touches)
    if gInterface then
        gInterface:getStateMachine():_worldTouchesUp(touches)
    end
end

local WorldTouchesMove = function(touches)
    if gInterface then
        gInterface:getStateMachine():_worldTouchesMove(touches)
    end
end

local WorldTouchesCancelled = function(touches)
    if gInterface then
        gInterface:getStateMachine():_worldTouchesCancelled(touches)
    end
end

local WorldTouchDown = function(touch)
    if gInterface then
        gInterface:getStateMachine():_worldTouchDown(touch)
    end
end

local WorldTouchUp = function(touch)
    if gInterface then
        gInterface:getStateMachine():_worldTouchUp(touch)
    end
end

local WorldTouchMove = function(touch)
    if gInterface then
        gInterface:getStateMachine():_worldTouchMove(touch)
    end
end

local WorldTouchCancelled = function(touch)
    if gInterface then
        gInterface:getStateMachine():_worldTouchCancelled(touch)
    end
end

local WorldMouseDown = function(mouse)
    if gInterface then
        gInterface:getStateMachine():_worldMouseDown(mouse)
    end
end

local WorldMouseUp = function(mouse)
    if gInterface then
        gInterface:getStateMachine():_worldMouseUp(mouse)
    end
end

local WorldMouseMove = function(mouse)
    if gInterface then
        gInterface:getStateMachine():_worldMouseMove(mouse)
    end
end

local WorldWillResignActive = function()
    if gInterface then
        gInterface:getStateMachine():_worldWillResignActive()
    end
end

local WorldDidBecomeActive = function()
    if gInterface then
        gInterface:getStateMachine():_worldDidBecomeActive()
    end
end

local WorldDidEnterBackground = function()
    if gInterface then
        gInterface:getStateMachine():_worldDidEnterBackground()
    end
end

local WorldWillEnterForeground = function()
    if gInterface then
        gInterface:getStateMachine():_worldWillEnterForeground()
    end
end

local WorldWillTerminate = function()
    if gInterface then
        gInterface:getStateMachine():_worldWillTerminate()
    end
end

local WorldInterrupt = function()
    if gInterface then
        gInterface:getStateMachine():_worldInterrupt()
    end
end

local WorldResumeInterrupt = function()
    if gInterface then
        gInterface:getStateMachine():_worldResumeInterrupt()
    end
end

local SceneEnterState = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneEnterState(scene)
    end
end

local SceneUpdateState = function(scene, timeStep)
    if gInterface then
        gInterface:getStateMachine():_sceneUpdateState(scene, timeStep)
    end
end

local SceneExitState = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneExitState(scene)
    end
end

local SceneOnMessage = function(scene, message)
    if gInterface then
        gInterface:getStateMachine():_sceneOnMessage(scene, message)
    end
end

local SceneKeyboardShow = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneKeyboardShow(scene)
    end
end

local SceneKeyboardCancel = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneKeyboardCancel(scene)
    end
end

local SceneKeyboardReturn = function(scene, text)
    if gInterface then
        gInterface:getStateMachine():_sceneKeyboardReturn(scene, text)
    end
end

local SceneRenderHUD = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneRenderHUD(scene)
    end
end

local SceneGamePause = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneGamePause(scene)
    end
end

local SceneGameUnPause = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneGameUnPause(scene)
    end
end

local SceneTouchesDown = function(scene, touches)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchesDown(scene, touches)
    end
end

local SceneTouchesUp = function(scene, touches)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchesUp(scene, touches)
    end
end

local SceneTouchesMove = function(scene, touches)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchesMove(scene, touches)
    end
end

local SceneTouchesCancelled = function(scene, touches)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchesCancelled(scene, touches)
    end
end

local SceneTouchDown = function(scene, touch)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchDown(scene, touch)
    end
end

local SceneTouchUp = function(scene, touch)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchUp(scene, touch)
    end
end

local SceneTouchMove = function(scene, touch)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchMove(scene, touch)
    end
end

local SceneTouchCancelled = function(scene, touch)
    if gInterface then
        gInterface:getStateMachine():_sceneTouchCancelled(scene, touch)
    end
end

local SceneMouseDown = function(scene, mouse)
    if gInterface then
        gInterface:getStateMachine():_sceneMouseDown(scene, mouse)
    end
end

local SceneMouseUp = function(scene, mouse)
    if gInterface then
        gInterface:getStateMachine():_sceneMouseUp(scene, mouse)
    end
end

local SceneMouseMove = function(scene, mouse)
    if gInterface then
        gInterface:getStateMachine():_sceneMouseMove(scene, mouse)
    end
end

local SceneReceivedMemoryWarning = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneReceivedMemoryWarning(scene)
    end
end

local SceneWillResignActive = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneWillResignActive(scene)
    end
end

local SceneDidBecomeActive = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneDidBecomeActive(scene)
    end
end

local SceneDidEnterBackground = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneDidEnterBackground(scene)
    end
end

local SceneWillEnterForeground = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneWillEnterForeground(scene)
    end
end

local SceneWillTerminate = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneWillTerminate(scene)
    end
end

local SceneInterrupt = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneInterrupt(scene)
    end
end

local SceneResumeInterrupt = function(scene)
    if gInterface then
        gInterface:getStateMachine():_sceneResumeInterrupt(scene)
    end
end

local NodeEnterState = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeEnterState(node)
    end
end

local NodeUpdateState = function(node, timeStep)
    if gInterface then
        gInterface:getStateMachine():_nodeUpdateState(node, timeStep)
    end
end

local NodeExitState = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeExitState(node)
    end
end

local NodeOnMessage = function(node, message)
    if gInterface then
        gInterface:getStateMachine():_nodeOnMessage(node, message)
    end
end

local NodeCollide = function(node, otherNode, collisionPoint)
    if gInterface then
        gInterface:getStateMachine():_nodeCollide(node, otherNode, collisionPoint)
    end
end

local NodeNear = function(node, otherNode)
    if gInterface then
        gInterface:getStateMachine():_nodeNear(node, otherNode)
    end
end

local NodeActionUpdate = function(action, timeStep)
    if gInterface then
        gInterface:getStateMachine():_nodeActionUpdate(action, timeStep)
    end
end

local NodeActionComplete = function(action)
    if gInterface then
        gInterface:getStateMachine():_nodeActionComplete(action)
    end
end

local NodeRayTouchesDown = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchesDown(rayContact)
    end
end

local NodeRayTouchesUp = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchesUp(rayContact)
    end
end

local NodeRayTouchesMove = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchesMove(rayContact)
    end
end

local NodeRayTouchesCancelled = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchesCancelled(rayContact)
    end
end

local NodeRayTouchesMissed = function(node)
    if gInterface then
        gInterface:getStateMachine():_rayTouchesMissed(node)
    end
end

local NodeRayTouchDown = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchDown(rayContact)
    end
end

local NodeRayTouchUp = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchUp(rayContact)
    end
end

local NodeRayTouchMove = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchMove(rayContact)
    end
end

local NodeRayTouchCancelled = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayTouchCancelled(rayContact)
    end
end

local NodeRayMouseDown = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayMouseDown(rayContact)
    end
end

local NodeRayMouseUp = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayMouseUp(rayContact)
    end
end

local NodeRayMouseMove = function(rayContact)
    if gInterface then
        gInterface:getStateMachine():_rayMouseMove(rayContact)
    end
end

local NodeRayTouchMissed = function(node)
    if gInterface then
        gInterface:getStateMachine():_rayTouchMissed(node)
    end
end

local NodeRayMouseMissed = function(node)
    if gInterface then
        gInterface:getStateMachine():_rayMouseMissed(node)
    end
end

local NodeKeyboardShow = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeKeyboardShow(node)
    end
end

local NodeKeyboardCancel = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeKeyboardCancel(node)
    end
end

local NodeKeyboardReturn = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeKeyboardReturn(node)
    end
end

local NodeRenderHUD = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeRenderHUD(node)
    end
end

local NodeGamePause = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeGamePause(node)
    end
end

local NodeGameUnPause = function(node)
    if gInterface then
        gInterface:getStateMachine():_nodeGameUnPause(node)
    end
end

local NodeTouchesDown = function(node, touches)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchesDown(node, touches)
    end
end

local NodeTouchesUp = function(node, touches)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchesUp(node, touches)
    end
end

local NodeTouchesMove = function(node, touches)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchesMove(node, touches)
    end
end

local NodeTouchesCancelled = function(node, touches)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchesCancelled(node, touches)
    end
end

local NodeTouchDown = function(node, touch)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchDown(node, touch)
    end
end

local NodeTouchUp = function(node, touch)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchUp(node, touch)
    end
end

local NodeTouchMove = function(node, touch)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchMove(node, touch)
    end
end

local NodeTouchCancelled = function(node, touches)
    if gInterface then
        gInterface:getStateMachine():_nodeTouchCancelled(node, touches)
    end
end

local NodeMouseDown = function(node, mouse)
    if gInterface then
        gInterface:getStateMachine():_nodeMouseDown(node, mouse)
    end
end

local NodeMouseUp = function(node, mouse)
    if gInterface then
        gInterface:getStateMachine():_nodeMouseUp(node, mouse)
    end
end

local NodeMouseMove = function(node, mouse)
    if gInterface then
        gInterface:getStateMachine():_nodeMouseMove(node, mouse)
    end
end

RegisterCreate("Create",                                         function() pcall(Create) end)
RegisterDestroy("Destroy",                                       function() pcall(Destroy) end )
RegisterUpdate("Update",                                         function() pcall(Update) end )
RegisterRender("Render",                                         function() pcall(Render) end )
RegisterResize("Resize",                                         function(width, height, orientation) pcall(Resize, width, height, orientation) end )
RegisterTouchesDown("TouchesDown",                               function(touches) pcall(TouchesDown, touches) end )
RegisterTouchesUp("TouchesUp",                                   function(touches) pcall(TouchesUp, touches) end )
RegisterTouchesMove("TouchesMove",                               function(touches) pcall(TouchesMove, touches) end )
RegisterTouchesCancelled("TouchesCancelled",                     function(touches) pcall(TouchesCancelled, touches) end )
RegisterTouchDown("TouchDown",                                   function(touch) pcall(TouchDown, touch) end )
RegisterTouchUp("TouchUp",                                       function(touch) pcall(TouchUp, touch) end )
RegisterTouchMove("TouchMove",                                   function(touch) pcall(TouchMove, touch) end )
RegisterTouchCancelled("TouchCancelled",                         function(touch) pcall(TouchCancelled, touch) end )
RegisterMouseDown("MouseDown",                                   function(mouse) pcall(MouseDown, mouse) end )
RegisterMouseUp("MouseUp",                                       function(mouse) pcall(MouseUp, mouse) end )
RegisterMouseMove("MouseMove",                                   function(mouse) pcall(MouseMove, mouse) end )
RegisterWorldEnterState("WorldEnterState",                       function() pcall(WorldEnterState) end )
RegisterWorldUpdateState("WorldUpdateState",                     function(timeStep) pcall(WorldUpdateState, timeStep) end )
RegisterWorldExitState("WorldExitState",                         function() pcall(WorldExitState) end )
RegisterWorldOnMessage("WorldOnMessage",                         function(message) pcall(WorldOnMessage, message) end )
RegisterWorldKeyboardShow("WorldKeyboardShow",                   function() pcall(WorldKeyboardShow) end )
RegisterWorldKeyboardCancel("WorldKeyboardCancel",               function() pcall(WorldKeyboardCancel) end )
RegisterWorldKeyboardReturn("WorldKeyboardReturn",               function() pcall(WorldKeyboardReturn) end )
RegisterWorldReceivedMemoryWarning("WorldReceivedMemoryWarning", function() pcall(WorldReceivedMemoryWarning) end )
RegisterWorldGamePause("WorldGamePause",                         function() pcall(WorldGamePause) end )
RegisterWorldGameUnPause("WorldGameUnPause",                     function() pcall(WorldGameUnPause) end )
RegisterWorldRenderHUD("WorldRenderHUD",                         function() pcall(WorldRenderHUD) end )
RegisterWorldTouchesDown("WorldTouchesDown",                     function(touches) pcall(WorldTouchesDown, touches) end )
RegisterWorldTouchesUp("WorldTouchesUp",                         function(touches) pcall(WorldTouchesUp, touches) end )
RegisterWorldTouchesMove("WorldTouchesMove",                     function(touches) pcall(WorldTouchesMove, touches) end )
RegisterWorldTouchesCancelled("WorldTouchesCancelled",           function(touches) pcall(WorldTouchesCancelled, touches) end )
RegisterWorldTouchDown("WorldTouchDown",                         function(touch) pcall(WorldTouchDown, touch) end )
RegisterWorldTouchUp("WorldTouchUp",                             function(touch) pcall(WorldTouchUp, touch) end )
RegisterWorldTouchMove("WorldTouchMove",                         function(touch) pcall(WorldTouchMove, touch) end )
RegisterWorldTouchCancelled("WorldTouchCancelled",               function(touch) pcall(WorldTouchCancelled, touch) end )
RegisterWorldMouseDown("WorldMouseDown",                         function(mouse) pcall(WorldMouseDown, mouse) end )
RegisterWorldMouseUp("WorldMouseUp",                             function(mouse) pcall(WorldMouseUp, mouse) end )
RegisterWorldMouseMove("WorldMouseMove",                         function(mouse) pcall(WorldMouseMove, mouse) end )
RegisterWorldWillResignActive("WorldWillResignActive",           function() pcall(WorldWillResignActive) end )
RegisterWorldDidBecomeActive("WorldDidBecomeActive",             function() pcall(WorldDidBecomeActive) end )
RegisterWorldDidEnterBackground("WorldDidEnterBackground",       function() pcall(WorldDidEnterBackground) end )
RegisterWorldWillEnterForeground("WorldWillEnterForeground",     function() pcall(WorldWillEnterForeground) end )
RegisterWorldWillTerminate("WorldWillTerminate",                 function() pcall(WorldWillTerminate) end )
RegisterWorldInterrupt("WorldInterrupt",                         function() pcall(WorldInterrupt) end )
RegisterWorldResumeInterrupt("WorldResumeInterrupt",             function() pcall(WorldResumeInterrupt) end )
RegisterSceneEnterState("SceneEnterState",                       function(scene) pcall(SceneEnterState, scene) end )
RegisterSceneUpdateState("SceneUpdateState",                     function(scene, timeStep) pcall(SceneUpdateState, scene, timeStep) end )
RegisterSceneExitState("SceneExitState",                         function(scene) pcall(SceneExitState, scene) end )
RegisterSceneOnMessage("SceneOnMessage",                         function(scene, message) pcall(SceneOnMessage, scene, message) end )
RegisterSceneKeyboardShow("SceneKeyboardShow",                   function(scene) pcall(SceneKeyboardShow, scene) end )
RegisterSceneKeyboardCancel("SceneKeyboardCancel",               function(scene) pcall(SceneKeyboardCancel, scene) end )
RegisterSceneKeyboardReturn("SceneKeyboardReturn",               function(scene, text) pcall(SceneKeyboardReturn, scene, text) end )
RegisterSceneRenderHUD("SceneRenderHUD",                         function(scene) pcall(SceneRenderHUD, scene) end )
RegisterSceneGamePause("SceneGamePause",                         function(scene) pcall(SceneGamePause, scene) end )
RegisterSceneGameUnPause("SceneGameUnPause",                     function(scene) pcall(SceneGameUnPause, scene) end )
RegisterSceneTouchesDown("SceneTouchesDown",                     function(scene, touches) pcall(SceneTouchesDown, scene, touches) end )
RegisterSceneTouchesUp("SceneTouchesUp",                         function(scene, touches) pcall(SceneTouchesUp, scene, touches) end )
RegisterSceneTouchesMove("SceneTouchesMove",                     function(scene, touches) pcall(SceneTouchesMove, scene, touches) end )
RegisterSceneTouchesCancelled("SceneTouchesCancelled",           function(scene, touches) pcall(SceneTouchesCancelled, scene, touches) end )
RegisterSceneTouchDown("SceneTouchDown",                         function(scene, touch) pcall(SceneTouchDown, scene, touch) end )
RegisterSceneTouchUp("SceneTouchUp",                             function(scene, touch) pcall(SceneTouchUp, scene, touch) end )
RegisterSceneTouchMove("SceneTouchMove",                         function(scene, touch) pcall(SceneTouchMove, scene, touch) end )
RegisterSceneTouchCancelled("SceneTouchCancelled",               function(scene, touch) pcall(SceneTouchCancelled, scene, touch) end )
RegisterSceneMouseDown("SceneMouseDown",                         function(scene, mouse) pcall(SceneMouseDown, scene, mouse) end )
RegisterSceneMouseUp("SceneMouseUp",                             function(scene, mouse) pcall(SceneMouseUp, scene, mouse) end )
RegisterSceneMouseMove("SceneMouseMove",                         function(scene, mouse) pcall(SceneMouseMove, scene, mouse) end )
RegisterSceneReceivedMemoryWarning("SceneReceivedMemoryWarning", function(scene) pcall(SceneReceivedMemoryWarning) end )
RegisterSceneWillResignActive("SceneWillResignActive",           function(scene) pcall(SceneWillResignActive, scene) end )
RegisterSceneDidBecomeActive("SceneDidBecomeActive",             function(scene) pcall(SceneDidBecomeActive, scene) end )
RegisterSceneDidEnterBackground("SceneDidEnterBackground",       function(scene) pcall(SceneDidEnterBackground, scene) end )
RegisterSceneWillEnterForeground("SceneWillEnterForeground",     function(scene) pcall(SceneWillEnterForeground, scene) end )
RegisterSceneWillTerminate("SceneWillTerminate",                 function(scene) pcall(SceneWillTerminate, scene) end )
RegisterSceneInterrupt("SceneInterrupt",                         function(scene) pcall(SceneInterrupt, scene) end )
RegisterSceneResumeInterrupt("SceneResumeInterrupt",             function(scene) pcall(SceneResumeInterrupt, scene) end )
RegisterNodeEnterState("NodeEnterState",                         function(node) pcall(NodeEnterState, node) end )
RegisterNodeUpdateState("NodeUpdateState",                       function(node, timeStep) pcall(NodeUpdateState, node, timeStep) end )
RegisterNodeExitState("NodeExitState",                           function(node) pcall(NodeExitState, node) end )
RegisterNodeOnMessage("NodeOnMessage",                           function(node, message) pcall(NodeOnMessage, node, message) end )
RegisterNodeCollide("NodeCollide",                               function(node, otherNode, collisionPoint) pcall(NodeCollide, node, otherNode, collisionPoint) end )
RegisterNodeNear("NodeNear",                                     function(node, otherNode) pcall(NodeNear, node, otherNode) end )
RegisterNodeActionUpdate("NodeActionUpdate",                     function(action, timeStep) pcall(NodeActionUpdate, action, timeStep) end )
RegisterNodeActionComplete("NodeActionComplete",                 function(action, timeStep) pcall(NodeActionComplete, action, timeStep) end )
RegisterNodeRayTouchesDown("NodeRayTouchesDown",                 function(rayContact) pcall(NodeRayTouchesDown, rayContact) end )
RegisterNodeRayTouchesUp("NodeRayTouchesUp",                     function(rayContact) pcall(NodeRayTouchesUp, rayContact) end )
RegisterNodeRayTouchesMove("NodeRayTouchesMove",                 function(rayContact) pcall(NodeRayTouchesMove, rayContact) end )
RegisterNodeRayTouchesCancelled("NodeRayTouchesCancelled",       function(rayContact) pcall(NodeRayTouchesCancelled, rayContact) end )
RegisterNodeRayTouchesMissed("NodeRayTouchesMissed",             function(node) pcall(NodeRayTouchesMissed, node) end )
RegisterNodeRayTouchDown("NodeRayTouchDown",                     function(rayContact) pcall(NodeRayTouchDown, rayContact) end )
RegisterNodeRayTouchUp("NodeRayTouchUp",                         function(rayContact) pcall(NodeRayTouchUp, rayContact) end )
RegisterNodeRayTouchMove("NodeRayTouchMove",                     function(rayContact) pcall(NodeRayTouchMove, rayContact) end )
RegisterNodeRayTouchCancelled("NodeRayTouchCancelled",           function(rayContact) pcall(NodeRayTouchCancelled, rayContact) end )
RegisterNodeRayMouseDown("NodeRayMouseDown",                     function(rayContact) pcall(NodeRayMouseDown, rayContact) end )
RegisterNodeRayMouseUp("NodeRayMouseUp",                         function(rayContact) pcall(NodeRayMouseUp, rayContact) end )
RegisterNodeRayMouseMove("NodeRayMouseMove",                     function(rayContact) pcall(NodeRayMouseMove, rayContact) end )
RegisterNodeRayTouchMissed("NodeRayTouchMissed",                 function(node) pcall(NodeRayTouchMissed, node) end )
RegisterNodeRayMouseMissed("NodeRayMouseMissed",                 function(node) pcall(NodeRayMouseMissed, node) end )
RegisterNodeKeyboardShow("NodeKeyboardShow",                     function(node) pcall(NodeKeyboardShow, node) end )
RegisterNodeKeyboardCancel("NodeKeyboardCancel",                 function(node) pcall(NodeKeyboardCancel, node) end )
RegisterNodeKeyboardReturn("NodeKeyboardReturn",                 function(node) pcall(NodeKeyboardReturn, node) end )
RegisterNodeRenderHUD("NodeRenderHUD",                           function(node) pcall(NodeRenderHUD, node) end )
RegisterNodeGamePause("NodeGamePause",                           function(node) pcall(NodeGamePause, node) end )
RegisterNodeGameUnPause("NodeGameUnPause",                       function(node) pcall(NodeGameUnPause, node) end )
RegisterNodeTouchesDown("NodeTouchesDown",                       function(node, touches) pcall(NodeTouchesDown, node, touches) end )
RegisterNodeTouchesUp("NodeTouchesUp",                           function(node, touches) pcall(NodeTouchesUp, node, touches) end )
RegisterNodeTouchesMove("NodeTouchesMove",                       function(node, touches) pcall(NodeTouchesMove, node, touches) end )
RegisterNodeTouchesCancelled("NodeTouchesCancelled",             function(node, touches) pcall(NodeTouchesCancelled, node, touches) end )
RegisterNodeTouchDown("NodeTouchDown",                           function(node, touch) pcall(NodeTouchDown, node, touch) end )
RegisterNodeTouchUp("NodeTouchUp",                               function(node, touch) pcall(NodeTouchUp, node, touch) end )
RegisterNodeTouchMove("NodeTouchMove",                           function(node, touch) pcall(NodeTouchMove, node, touch) end )
RegisterNodeTouchCancelled("NodeTouchCancelled",                 function(node, touch) pcall(NodeTouchCancelled, node, touch) end )
RegisterNodeMouseDown("NodeMouseDown",                           function(node, mouse) pcall(NodeMouseDown, node, mouse) end )
RegisterNodeMouseUp("NodeMouseUp",                               function(node, mouse) pcall(NodeMouseUp, node, mouse) end )
RegisterNodeMouseMove("NodeMouseMove",                           function(node, mouse) pcall(NodeMouseMove, node, mouse) end )

--return gInterface

