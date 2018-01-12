
debugging = nil

local Interface = require 'NJLI.Interface'
local BitmapFont = require 'NJLI.BitmapFont'
local BitmapFont2 = require 'NJLI.BitmapFont2'
local YappyGame = require "YAPPYBIRDS.YappyGame"

RanchersFont = nil
ELIAFont = nil
Geometry2D = nil
OrthographicCameraNode = nil
PerspectiveCameraNode = nil
MyGame = nil
gInterface = nil

local Create = function()


  local scene = njli.Scene.create()
  local rootNode = njli.Node.create()
  
  local physicsWorld = njli.PhysicsWorld.create()
  scene:setPhysicsWorld(physicsWorld)
  
  scene:setRootNode(rootNode)
  
  njli.World.getInstance():setScene(scene)
  
  
  
  
  

  if nil == OrthographicCameraNode then
    OrthographicCameraNode = njli.Node.create()
    OrthographicCameraNode:setName("orthoCamera")

    local camera = njli.Camera.create()
    camera:enableOrthographic()
    camera:setRenderCategory(RenderCategories.orthographic)
    camera:setName("orthoCamera")

    OrthographicCameraNode:setCamera(camera)
    
    njli.World.getInstance():enableDebugDraw(OrthographicCameraNode:getCamera())
    
    rootNode:addChildNode(OrthographicCameraNode)
  end
  
  if nil == PerspectiveCameraNode then
    PerspectiveCameraNode = njli.Node.create()
    PerspectiveCameraNode:setName("perspectiveCamera")

    local camera = njli.Camera.create()
    camera:enableOrthographic(false)
    camera:setRenderCategory(RenderCategories.perspective)
    camera:setName("perspectiveCamera")

    PerspectiveCameraNode:setCamera(camera)
    
    rootNode:addChildNode(PerspectiveCameraNode)
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
  
  -- if nil == RanchersFont then
  --   RanchersFont = BitmapFont({file='Ranchers_GlyphDesigner.fnt'})
  --   RanchersFont:load()
  --   RanchersFont:show(OrthographicCameraNode:getCamera())
  --   RanchersFont:hide(PerspectiveCameraNode:getCamera())
  -- end
  -- 
  -- if nil == ELIAFont then
  --   ELIAFont = BitmapFont({file='Elia_GlyphDesigner.fnt'})
  --   ELIAFont:load()
  --   ELIAFont:show(OrthographicCameraNode:getCamera())
  --   ELIAFont:hide(PerspectiveCameraNode:getCamera())
  -- end 
  
  
  local bitmapfont2_test = BitmapFont2({"Elia_GlyphDesigner"})
  
  
  
    
    
    
  
  
  
  
  
  
    
  -- -- local points = (arg and arg.points) or 1234567890
  -- local vert_margin = njli.SCREEN():y() / 30.0
  -- local horiz_margin = njli.SCREEN():x() / 40.0
  -- -- local node, rect = ELIAFont:printf(string.format("%.5d", points), njli.SCREEN():x(), 'left')
  -- local node, rect = ELIAFont:printf("jim", njli.SCREEN():x(), 'left')
  -- node:setOrigin(bullet.btVector3(njli.SCREEN():x() - rect.width - horiz_margin, njli.SCREEN():y() - rect.height - vert_margin, -1))
  -- node:show(OrthographicCameraNode:getCamera())
  -- node:setCurrentScene(njli.World.getInstance():getScene())
  -- 
  -- rootNode:addChildNode(node)
  
  
  
  
  
  
  
--  if nil == MyGame then
--    MyGame = YappyGame(Worlds.yappygame)
--    MyGame:startStateMachine()
--  end
  

end
  
local Destroy = function()

--  if MyGame then
--    MyGame:stopStateMachine()
--    MyGame = nil
--  end
  
  
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

local Update = function(timeStep)

  if debugging == nil then
        debugging = false
        return false
    end

    if not debugging then
        require("mobdebug").start()
        --require("mobdebug").coro()
        debugging = true
    end
    
    

--  local pos = bullet.btVector3(100, 100, -1)
--  local color = bullet.btVector4(0.202, 0.643, 0.000, 1)
--  njli.World.getInstance():getDebugDrawer():point(pos, color, 100)--, 100000, 10)
  
--  if gInterface then
--    gInterface:getDeviceEntity():update(timeStep)
--  end
  
 njli.World.getInstance():setBackgroundColor(1.000, 1.000, 1.000)
end

local Render = function() end
local Resize = function(width, height, orientation) end
local TouchesDown = function(touches) end
local TouchesUp = function(touches) end
local TouchesMove = function(touches) end
local TouchesCancelled = function(touches) end
local TouchDown = function(touch) end
local TouchUp = function(touch) end
local TouchMove = function(touch) end
local TouchCancelled = function(touches) end
local MouseDown = function(mouse) end
local MouseUp = function(mouse) end
local MouseMove = function(mouse) end
local KeyDown = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end
local KeyUp = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end
local WorldEnterState = function() end
local WorldUpdateState = function(timeStep) end
local WorldExitState = function() end
local WorldOnMessage = function(message) end
local WorldKeyboardShow = function() end
local WorldKeyboardCancel = function() end
local WorldKeyboardReturn = function(text) end
local WorldReceivedMemoryWarning = function() end
local WorldGamePause = function() end
local WorldGameUnPause = function() end
local WorldRenderHUD = function() end
local WorldTouchesDown = function(touches) end
local WorldTouchesUp = function(touches) end
local WorldTouchesMove = function(touches) end
local WorldTouchesCancelled = function(touches) end
local WorldTouchDown = function(touch) end
local WorldTouchUp = function(touch) end
local WorldTouchMove = function(touch) end
local WorldTouchCancelled = function(touch) end
local WorldMouseDown = function(mouse) end
local WorldMouseUp = function(mouse) end
local WorldMouseMove = function(mouse) end
local WorldKeyDown = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end
local WorldKeyUp = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end
local WorldWillResignActive = function() end
local WorldDidBecomeActive = function() end
local WorldDidEnterBackground = function() end
local WorldWillEnterForeground = function() end
local WorldWillTerminate = function() end
local WorldInterrupt = function() end
local WorldResumeInterrupt = function() end
local SceneEnterState = function(scene) end
local SceneUpdateState = function(scene, timeStep) end
local SceneExitState = function(scene) end
local SceneOnMessage = function(scene, message) end
local SceneKeyboardShow = function(scene) end
local SceneKeyboardCancel = function(scene) end
local SceneKeyboardReturn = function(scene, text) end
local SceneRenderHUD = function(scene) end
local SceneGamePause = function(scene) end
local SceneGameUnPause = function(scene) end
local SceneTouchesDown = function(scene, touches) end
local SceneTouchesUp = function(scene, touches) end
local SceneTouchesMove = function(scene, touches) end
local SceneTouchesCancelled = function(scene, touches) end
local SceneTouchDown = function(scene, touch) end
local SceneTouchUp = function(scene, touch) end
local SceneTouchMove = function(scene, touch) end
local SceneTouchCancelled = function(scene, touch) end
local SceneMouseDown = function(scene, mouse) end
local SceneMouseUp = function(scene, mouse) end

local SceneMouseMove = function(scene, mouse)
    if gInterface then
        gInterface:getStateMachine():_sceneMouseMove(scene, mouse)
    end
end





local SceneKeyDown = function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
--    print('SceneKeyDown')
-- if gInterface then
--   gInterface:getDeviceEntity():mouseMove(mouse)
-- end
end

local SceneKeyUp = function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
--    print('SceneKeyUp')
-- if gInterface then
--   gInterface:getDeviceEntity():mouseMove(mouse)
-- end
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

local NodeKeyDown = function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
--    print('NodeKeyDown')
-- if gInterface then
--   gInterface:getDeviceEntity():mouseMove(mouse)
-- end
end

local NodeKeyUp = function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
--    print('NodeKeyUp')
-- if gInterface then
--   gInterface:getDeviceEntity():mouseMove(mouse)
-- end
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



RegisterKeyDown("KeyDown",                                       function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(KeyDown, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )
RegisterKeyUp("KeyUp",                                         function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(KeyUp, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )


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


RegisterWorldKeyDown("WorldKeyDown",                                       function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(WorldKeyDown, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )
RegisterWorldKeyUp("WorldKeyUp",                                         function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(WorldKeyUp, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )



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


RegisterSceneKeyDown("SceneKeyDown",                              function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(SceneKeyDown, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )
RegisterSceneKeyUp("SceneKeyUp",                                   function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(SceneKeyUp, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )



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

RegisterNodeKeyDown("NodeKeyDown",                              function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(NodeKeyDown, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )
RegisterNodeKeyUp("NodeKeyUp",                                   function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) pcall(NodeKeyUp, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end )


--return gInterface

