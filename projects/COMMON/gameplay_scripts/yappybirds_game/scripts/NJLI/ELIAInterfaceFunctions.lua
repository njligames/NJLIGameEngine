
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

waitTime=0.5
resetTimer=waitTime

wordArray = 
{
 "Lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit", "Donec", "lobortis", "ac", "elit", "ut", "vehicula", "Nam", "vestibulum", "at", "diam", "eget", "pulvinar", "Nunc", "porta", "odio", "metus", "at", "egestas", "sem", "rhoncus", "eu", "Fusce", "sed", "scelerisque", "quam", "consequat", "mollis", "quam", "Pellentesque", "ut", "turpis", "vel", "mauris", "ultrices", "luctus", "Ut", "lorem", "ante", "dictum", "pharetra", "efficitur", "et", "luctus", "vitae", "ligula", "Cras", "pretium", "dolor", "eu", "fermentum", "fermentum", "Nulla", "quis", "urna", "commodo", "molestie", "velit", "vitae", "varius", "odio", "Nulla", "vitae", "fermentum", "justo", "Mauris", "tincidunt", "convallis", "condimentum", "Donec", "mollis", "laoreet", "purus", "ut", "elementum", "Donec", "consectetur", "vestibulum", "nisi", "a", "condimentum", "Sed", "magna", "ligula", "dapibus", "sed", "sagittis", "sed", "viverra", "ac", "nulla", "Aliquam", "quis", "tempor", "nisl", "nec", "dapibus", "ex", "Proin", "condimentum", "est", "ut", "dui", "iaculis", "in", "feugiat", "mauris", "euismod", "Maecenas", "eu", "laoreet", "purus", "Aenean", "blandit", "fermentum", "ligula", "iaculis", "suscipit", "Vivamus", "sagittis", "a", "tortor", "vitae", "egestas", "Nam", "hendrerit", "metus", "finibus", "molestie", "efficitur", "Nulla", "hendrerit", "nisl", "augue", "quis", "venenatis", "elit", "ultrices", "eget", "Integer", "ac", "mi", "vel", "ex", "sodales", "dignissim", "vitae", "vitae", "nunc", "Mauris", "vel", "dapibus", "urna", "at", "finibus", "massa", "Duis", "imperdiet", "malesuada", "sem", "nec", "imperdiet", "Sed", "commodo", "ex", "lacus", "Proin", "viverra", "turpis", "id", "egestas", "tempor", "Maecenas", "eget", "condimentum", "urna", "quis", "fermentum", "odio", "Donec", "facilisis", "nunc", "neque", "ut", "sodales", "tellus", "volutpat", "quis", "Morbi", "bibendum", "luctus", "sem", "Etiam", "consectetur", "dolor", "luctus", "urna", "tincidunt", "molestie", "Aliquam", "non", "purus", "malesuada", "rhoncus", "lectus", "nec", "fermentum", "eros", "Aliquam", "scelerisque", "leo", "lectus", "quis", "euismod", "velit", "mattis", "vitae", "Fusce", "sit", "amet", "lacus", "in", "enim", "porttitor", "dapibus", "quis", "vel", "tellus", "Nullam", "egestas", "tellus", "eu", "est", "viverra", "porttitor", "Sed", "feugiat", "semper", "libero", "Donec", "euismod", "libero", "vel", "molestie", "eleifend", "dui", "massa", "tincidunt", "sem", "vel", "fringilla", "elit", "eros", "at", "risus", "Nullam", "blandit", "laoreet", "purus", "a", "elementum", "tellus", "Integer", "nec", "dignissim", "quam", "Proin", "laoreet", "sodales", "metus", "a", "viverra", "Suspendisse", "scelerisque", "dapibus", "efficitur", "Pellentesque", "nibh", "tellus", "congue", "quis", "commodo", "a", "sagittis", "a", "orci", "Sed", "mauris", "nisl", "mattis", "at", "tellus", "quis", "tempor", "consectetur", "erat", "Quisque", "dignissim", "sem", "et", "auctor", "iaculis", "Duis", "at", "imperdiet", "massa", "Quisque", "id", "libero", "enim", "Mauris", "molestie", "sit", "amet", "dolor", "rutrum", "varius", "Duis", "ut", "massa", "eu", "orci", "euismod", "hendrerit", "Aliquam", "imperdiet", "commodo", "aliquam", "Ut", "elementum", "porttitor", "dictum", "Vestibulum", "fringilla", "feugiat", "erat", "ut", "mollis", "Vestibulum", "est", "nisi", "mattis", "sed", "facilisis", "mattis", "varius", "id", "nisl", "Etiam", "facilisis", "viverra", "suscipit", "Donec", "in", "risus", "fermentum", "gravida", "est", "at", "bibendum", "arcu", "Nullam", "ut", "purus", "ac", "lectus", "tincidunt", "pharetra", "vitae", "id", "est", "Mauris", "at", "ligula", "bibendum", "lacus", "aliquet", "aliquet", "id", "quis", "orci",
 }

currentWordArrayIndex=1
currentNode = nil
currentNodeRect = nil
currentText = string.upper(wordArray[currentWordArrayIndex])
fontIndexTable = {}
currentTypeIndex = string.len(currentText) + 1

totalAccurateTyped=0.0
totalNumberOfLetters=0.0
currentNumberOfLetters=0.0

startOrigin = bullet.btVector3(0.0, 0.0, 0.0)


currentNumberOfPoints = 0.0
pointsPerCorrectLetter = 1.0
pointsNode = nil
pointsNodeRect = nil

currentAccuracy = 100.0
accuracyNode = nil
accuracyNodeRect = nil

--[[
https://www.speedtypingonline.com/typing-equations

Accuracy
Typing accuracy is defined as the percentage of correct entries out of the total entries typed. To calculate this mathematically, take the number of correct characters typed divided by the total number, multiplied by 100%. So if you typed 90 out of 100 characters correctly you typed with 90% accuracy.

It is interesting to note that all errors, whether corrected or not, should be counted in the accuracy calculation, unlike the net WPM calculation. This is because the calculation is more "live" than typing speed and literally describes the likelihood that the next character will be typed correctly, regardless of whether it will be corrected or not.
]]--

local AccuracyPercentage = function()
  local total = (totalNumberOfLetters - currentNumberOfLetters)
  if total > 0 then
    local percentage = ((totalAccurateTyped / total)  * 100.0)
    return math.min(100.0, percentage)
  end
  return 100.0
end


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
  
  ELIAFont = BitmapFont2(
  {
    "ELIABasic",
    "ELIABlue",
    "ELIAGreen",
    "ELIARed",
    "ELIAYellow",
    "ELIABlack",
    "TimesNewRomanBasic",
  })

  ELIAFont:show(OrthographicCameraNode:getCamera())
  ELIAFont:hide(PerspectiveCameraNode:getCamera())

  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0

  startOrigin = bullet.btVector3(bullet.btVector3(njli.SCREEN():x() + horiz_margin, njli.SCREEN():y() - (ELIAFont:maxLineHeight() + vert_margin), -1))
  







  local pointsString = string.format("%.4d", tostring(currentNumberOfPoints))
  local pointsFontTable = {}
  for i=1, string.len(pointsString) do
    pointsFontTable[i] = 6
  end

  pointsNode, pointsNodeRect = ELIAFont:printf({
    mainNode=nil,
    text=pointsString,
    fontIndexTable=pointsFontTable,
    align="Left",
  })
  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0

  pointsNode:setOrigin(bullet.btVector3(bullet.btVector3(0 + horiz_margin, 0 + vert_margin, -1)))
  pointsNode:show(OrthographicCameraNode:getCamera())








  local accuracyString = string.format("%.0f", currentAccuracy) .. "%"

  local accuracyFontTable = {}
  for i=1, string.len(accuracyString) do
    accuracyFontTable[i] = 6
  end

  accuracyNode, accuracyNodeRect = ELIAFont:printf({
    mainNode=nil,
    text=accuracyString,
    fontIndexTable=accuracyFontTable,
    align="Left",
  })

  accuracyNode:setOrigin(bullet.btVector3(bullet.btVector3((njli.SCREEN():x()) - (accuracyNodeRect.width + horiz_margin), 0 + vert_margin, -1)))
  accuracyNode:show(OrthographicCameraNode:getCamera())








end
  
local Destroy = function()
  
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

  if currentNode then
    if (currentTypeIndex <=  string.len(currentText)) then
      currentNode:show(OrthographicCameraNode:getCamera())
    else
      if resetTimer >= 0.5 then
        currentNode:hide(OrthographicCameraNode:getCamera())
      end
    end
    local origin = currentNode:getOrigin() - bullet.btVector3(3.0, 0.0, 0.0)
    currentNode:setOrigin(origin)

    if  origin:x() + currentNodeRect.width  < 0 then
      currentTypeIndex = string.len(currentText) + 1
    end
  end

  if debugging == nil then
        debugging = false
        return false
    end

    if not debugging then
        require("mobdebug").start()
        debugging = true
    end
    
  if currentTypeIndex > string.len(currentText) then

    resetTimer = resetTimer + timeStep

    if resetTimer >= 0.5 then

      if currentNode then
        currentNode:hide(OrthographicCameraNode:getCamera())
      end

      currentWordArrayIndex=currentWordArrayIndex+1
      currentText = string.upper(wordArray[currentWordArrayIndex])
      currentTypeIndex = 1

      for i=1, string.len(currentText) do
        fontIndexTable[i] = 1
      end

      fontIndexTable[currentTypeIndex] = 2

      currentNode, currentNodeRect = ELIAFont:printf({
        mainNode=currentNode,
        text=currentText,
        fontIndexTable=fontIndexTable,
        align="Left",
      })
      local vert_margin = njli.SCREEN():y() / 30.0
      local horiz_margin = njli.SCREEN():x() / 40.0

      startOrigin = bullet.btVector3(bullet.btVector3(njli.SCREEN():x() + horiz_margin, njli.SCREEN():y() - (ELIAFont:maxLineHeight() + vert_margin), -1))
      currentNode:setOrigin(startOrigin)

      resetTimer = 0

      currentNumberOfLetters = string.len(currentText)
      totalNumberOfLetters = totalNumberOfLetters + currentNumberOfLetters






      currentAccuracy = AccuracyPercentage()
      local accuracyString = string.format("%.0f", currentAccuracy) .. "%"

      local accuracyFontTable = {}
      for i=1, string.len(accuracyString) do
        accuracyFontTable[i] = 6
      end

      accuracyNode, accuracyNodeRect = ELIAFont:printf({
        mainNode=accuracyNode,
        text=accuracyString,
        fontIndexTable=accuracyFontTable,
        align="Left",
      })

      accuracyNode:setOrigin(bullet.btVector3(bullet.btVector3((njli.SCREEN():x()) - (accuracyNodeRect.width + horiz_margin), 0 + vert_margin, -1)))
      accuracyNode:show(OrthographicCameraNode:getCamera())






    end

  end








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

local KeyDown = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) 
  if resetTimer > 0 then
    return
  end

  local currentChar = string.upper(keycodeName)
  local targetChar = string.upper(string.sub(currentText, currentTypeIndex, currentTypeIndex))

  if currentChar == targetChar then
    local print_it = false

    if currentTypeIndex <= string.len(currentText) then
      -- Set the correct letter to regular font face
      fontIndexTable[currentTypeIndex] = 7

      -- Set the current letter to blue
      if (currentTypeIndex + 1) <= string.len(currentText) then
        fontIndexTable[currentTypeIndex + 1] = 2
        print_it = true
      elseif currentTypeIndex == string.len(currentText) then
        print_it = true
      end

      -- currentTypeIndex = currentTypeIndex + 1
    end

    if print_it then
      currentNode, currentNodeRect = ELIAFont:printf({
        mainNode=currentNode,
        text=currentText,
        fontIndexTable=fontIndexTable,
        align="Left",
      })
    end
    local vert_margin = njli.SCREEN():y() / 30.0
    local horiz_margin = njli.SCREEN():x() / 40.0

    -- print("yes")
    totalAccurateTyped = totalAccurateTyped + 1.0

    currentNumberOfPoints = currentNumberOfPoints + pointsPerCorrectLetter


  local pointsString = string.format("%.4d", tostring(currentNumberOfPoints))
  local pointsFontTable = {}
  for i=1, string.len(pointsString) do
    pointsFontTable[i] = 6
  end

  pointsNode, pointsNodeRect = ELIAFont:printf({
    mainNode=pointsNode,
    text=pointsString,
    fontIndexTable=pointsFontTable,
    align="Left",
  })
  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0

  pointsNode:setOrigin(bullet.btVector3(bullet.btVector3(0 + horiz_margin, 0 + vert_margin, -1)))
  pointsNode:show(OrthographicCameraNode:getCamera())














  else
    -- Set the current letter to Red
    fontIndexTable[currentTypeIndex] = 4

    -- Set the current letter to blue
    if (currentTypeIndex + 1) <= string.len(currentText) then
      fontIndexTable[currentTypeIndex + 1] = 2
      print_it = true
    elseif currentTypeIndex == string.len(currentText) then
      print_it = true
    end

    currentNode, currentNodeRect = ELIAFont:printf({
      mainNode=currentNode,
      text=currentText,
      fontIndexTable=fontIndexTable,
      align="Left",
    })
    local vert_margin = njli.SCREEN():y() / 30.0
    local horiz_margin = njli.SCREEN():x() / 40.0

    -- startOrigin = bullet.btVector3(bullet.btVector3(njli.SCREEN():x() + horiz_margin, njli.SCREEN():y() - (ELIAFont:maxLineHeight() + vert_margin), -1))
    -- currentNode:setOrigin(startOrigin)
    -- print("no")

    currentNumberOfPoints=0
  local pointsString = string.format("%.4d", tostring(currentNumberOfPoints))
  local pointsFontTable = {}
  for i=1, string.len(pointsString) do
    pointsFontTable[i] = 6
  end

  pointsNode, pointsNodeRect = ELIAFont:printf({
    mainNode=pointsNode,
    text=pointsString,
    fontIndexTable=pointsFontTable,
    align="Left",
  })
  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0

  pointsNode:setOrigin(bullet.btVector3(bullet.btVector3(0 + horiz_margin, 0 + vert_margin, -1)))
  pointsNode:show(OrthographicCameraNode:getCamera())
  end

  currentTypeIndex = currentTypeIndex + 1
end

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
RegisterUpdate("Update",                                         function(timeStep) pcall(Update, timeStep) end )
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

