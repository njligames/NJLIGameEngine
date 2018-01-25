
debugging = nil

local Interface = require 'NJLI.Interface'
local BitmapFont2 = require 'NJLI.BitmapFont2'
local TexturePacker = require "NJLI.TexturePacker"

ELIAFont = nil
OrthographicCameraNode = nil
PerspectiveCameraNode = nil

SCROLL_SPEED=3.0
WAIT_TIME=0.5

POINTS_PER_CORRECT_LETTER = 1.0

ELIATexturePacker = nil

previousGameplayStateName = "Endless Letter"
finalPointsAccumulated = 0
finalAccuracy = 100.0

WORD_ARRAY = 
{
 "Lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit", "Donec", "lobortis", "ac", "elit", "ut", "vehicula", "Nam", "vestibulum", "at", "diam", "eget", "pulvinar", "Nunc", "porta", "odio", "metus", "at", "egestas", "sem", "rhoncus", "eu", "Fusce", "sed", "scelerisque", "quam", "consequat", "mollis", "quam", "Pellentesque", "ut", "turpis", "vel", "mauris", "ultrices", "luctus", "Ut", "lorem", "ante", "dictum", "pharetra", "efficitur", "et", "luctus", "vitae", "ligula", "Cras", "pretium", "dolor", "eu", "fermentum", "fermentum", "Nulla", "quis", "urna", "commodo", "molestie", "velit", "vitae", "varius", "odio", "Nulla", "vitae", "fermentum", "justo", "Mauris", "tincidunt", "convallis", "condimentum", "Donec", "mollis", "laoreet", "purus", "ut", "elementum", "Donec", "consectetur", "vestibulum", "nisi", "a", "condimentum", "Sed", "magna", "ligula", "dapibus", "sed", "sagittis", "sed", "viverra", "ac", "nulla", "Aliquam", "quis", "tempor", "nisl", "nec", "dapibus", "ex", "Proin", "condimentum", "est", "ut", "dui", "iaculis", "in", "feugiat", "mauris", "euismod", "Maecenas", "eu", "laoreet", "purus", "Aenean", "blandit", "fermentum", "ligula", "iaculis", "suscipit", "Vivamus", "sagittis", "a", "tortor", "vitae", "egestas", "Nam", "hendrerit", "metus", "finibus", "molestie", "efficitur", "Nulla", "hendrerit", "nisl", "augue", "quis", "venenatis", "elit", "ultrices", "eget", "Integer", "ac", "mi", "vel", "ex", "sodales", "dignissim", "vitae", "vitae", "nunc", "Mauris", "vel", "dapibus", "urna", "at", "finibus", "massa", "Duis", "imperdiet", "malesuada", "sem", "nec", "imperdiet", "Sed", "commodo", "ex", "lacus", "Proin", "viverra", "turpis", "id", "egestas", "tempor", "Maecenas", "eget", "condimentum", "urna", "quis", "fermentum", "odio", "Donec", "facilisis", "nunc", "neque", "ut", "sodales", "tellus", "volutpat", "quis", "Morbi", "bibendum", "luctus", "sem", "Etiam", "consectetur", "dolor", "luctus", "urna", "tincidunt", "molestie", "Aliquam", "non", "purus", "malesuada", "rhoncus", "lectus", "nec", "fermentum", "eros", "Aliquam", "scelerisque", "leo", "lectus", "quis", "euismod", "velit", "mattis", "vitae", "Fusce", "sit", "amet", "lacus", "in", "enim", "porttitor", "dapibus", "quis", "vel", "tellus", "Nullam", "egestas", "tellus", "eu", "est", "viverra", "porttitor", "Sed", "feugiat", "semper", "libero", "Donec", "euismod", "libero", "vel", "molestie", "eleifend", "dui", "massa", "tincidunt", "sem", "vel", "fringilla", "elit", "eros", "at", "risus", "Nullam", "blandit", "laoreet", "purus", "a", "elementum", "tellus", "Integer", "nec", "dignissim", "quam", "Proin", "laoreet", "sodales", "metus", "a", "viverra", "Suspendisse", "scelerisque", "dapibus", "efficitur", "Pellentesque", "nibh", "tellus", "congue", "quis", "commodo", "a", "sagittis", "a", "orci", "Sed", "mauris", "nisl", "mattis", "at", "tellus", "quis", "tempor", "consectetur", "erat", "Quisque", "dignissim", "sem", "et", "auctor", "iaculis", "Duis", "at", "imperdiet", "massa", "Quisque", "id", "libero", "enim", "Mauris", "molestie", "sit", "amet", "dolor", "rutrum", "varius", "Duis", "ut", "massa", "eu", "orci", "euismod", "hendrerit", "Aliquam", "imperdiet", "commodo", "aliquam", "Ut", "elementum", "porttitor", "dictum", "Vestibulum", "fringilla", "feugiat", "erat", "ut", "mollis", "Vestibulum", "est", "nisi", "mattis", "sed", "facilisis", "mattis", "varius", "id", "nisl", "Etiam", "facilisis", "viverra", "suscipit", "Donec", "in", "risus", "fermentum", "gravida", "est", "at", "bibendum", "arcu", "Nullam", "ut", "purus", "ac", "lectus", "tincidunt", "pharetra", "vitae", "id", "est", "Mauris", "at", "ligula", "bibendum", "lacus", "aliquet", "aliquet", "id", "quis", "orci",
 }


STATE_GAMEPLAY="gameplay"
STATE_SPLASH="splash"
STATE_RESULT="result"
STATE_LEADERBOARD="leaderboard"

local ELIA = {}

ELIA.states =
{ 
  {
    name=STATE_GAMEPLAY,
    vars=
    {
      currentResetTimer=WAIT_TIME,
      currentWordArrayIndex=1,
      currentNode = nil,
      currentNodeRect = nil,
      currentText = "",
      fontIndexTable = {},
      currentTypeIndex = 1,
      totalAccurateTyped=0.0,
      totalNumberOfLetters=0.0,
      currentNumberOfLetters=0.0,
      startOrigin = bullet.btVector3(0.0, 0.0, 0.0),
      currentNumberOfPoints = 0.0,
      pointsNode = nil,
      accuracyNode = nil,
      doneNode = nil,
      doneButtonDown = false,
      created=false
    },
    create = function()
      ELIA.states[1].vars.currentText = string.upper(WORD_ARRAY[ELIA.states[1].vars.currentWordArrayIndex])

      ELIA.states[1].vars.currentTypeIndex = string.len(ELIA.states[1].vars.currentText) + 1

      local vert_margin = njli.SCREEN():y() / 30.0
      local horiz_margin = njli.SCREEN():x() / 40.0

      ELIA.states[1].vars.startOrigin = bullet.btVector3(njli.SCREEN():x() + horiz_margin, njli.SCREEN():y() - (ELIAFont:maxLineHeight() + vert_margin), -1)

      ELIA.states[1].vars.pointsNode = DrawPoints(ELIA.states[1].vars.currentNumberOfPoints, ELIA.states[1].vars.pointsNode)
      ELIA.states[1].vars.accuracyNode = DrawAccuracy(100.0, ELIA.states[1].vars.accuracyNode)

      ELIA.states[1].vars.doneNode = DrawDoneButton(njli.SCREEN():x() * 0.5, njli.SCREEN():y() * 0.5, ELIA.states[1].vars.doneNode)


      ELIA.states[1].vars.created = true
    end,
    update = function(timeStep)
      njli.World.getInstance():setBackgroundColor(1.000, 1.000, 1.000)

      if not ELIA.states[1].vars.created then
        return
      end

      if ELIA.states[1].vars.currentNode then
        if (ELIA.states[1].vars.currentTypeIndex <=  string.len(ELIA.states[1].vars.currentText)) then
          ELIA.states[1].vars.currentNode:show(OrthographicCameraNode:getCamera())
        else
          if ELIA.states[1].vars.currentResetTimer >= WAIT_TIME then
            ELIA.states[1].vars.currentNode:hide(OrthographicCameraNode:getCamera())
          end
        end
        local origin = ELIA.states[1].vars.currentNode:getOrigin() - bullet.btVector3(SCROLL_SPEED, 0.0, 0.0)
        ELIA.states[1].vars.currentNode:setOrigin(origin)

        if  origin:x() + currentNodeRect.width  < 0 then
          ELIA.states[1].vars.currentTypeIndex = string.len(ELIA.states[1].vars.currentText) + 1
        end
      end
        
      if ELIA.states[1].vars.currentTypeIndex > string.len(ELIA.states[1].vars.currentText) then

        ELIA.states[1].vars.currentResetTimer = ELIA.states[1].vars.currentResetTimer + timeStep

        if ELIA.states[1].vars.currentResetTimer >= WAIT_TIME then

          if ELIA.states[1].vars.currentNode then
            ELIA.states[1].vars.currentNode:hide(OrthographicCameraNode:getCamera())
          end

          ELIA.states[1].vars.currentWordArrayIndex=ELIA.states[1].vars.currentWordArrayIndex+1
          ELIA.states[1].vars.currentText = string.upper(WORD_ARRAY[ELIA.states[1].vars.currentWordArrayIndex])
          ELIA.states[1].vars.currentTypeIndex = 1

          for i=1, string.len(ELIA.states[1].vars.currentText) do
            ELIA.states[1].vars.fontIndexTable[i] = 1
          end

          ELIA.states[1].vars.fontIndexTable[ELIA.states[1].vars.currentTypeIndex] = 2

          ELIA.states[1].vars.currentNode, currentNodeRect = ELIAFont:printf({
            mainNode=ELIA.states[1].vars.currentNode,
            text=ELIA.states[1].vars.currentText,
            fontIndexTable=ELIA.states[1].vars.fontIndexTable,
            align="Left",
          })

          ELIA.states[1].vars.currentNode:setOrigin(ELIA.states[1].vars.startOrigin)

          ELIA.states[1].vars.currentResetTimer = 0

          ELIA.states[1].vars.currentNumberOfLetters = string.len(ELIA.states[1].vars.currentText)
          ELIA.states[1].vars.totalNumberOfLetters = ELIA.states[1].vars.totalNumberOfLetters + ELIA.states[1].vars.currentNumberOfLetters

          ELIA.states[1].vars.accuracyNode = DrawAccuracy(AccuracyPercentage(ELIA.states[1].vars.totalNumberOfLetters, ELIA.states[1].vars.currentNumberOfLetters, ELIA.states[1].vars.totalAccurateTyped), ELIA.states[1].vars.accuracyNode)

        end

      end
    end,
    destroy = function()
      ELIA.states[1].vars.created = false

      njli.Node.destroy(ELIA.states[1].vars.pointsNode)
      ELIA.states[1].vars.pointsNode = nil

      njli.Node.destroy(ELIA.states[1].vars.accuracyNode)
      ELIA.states[1].vars.accuracyNode = nil

      local physicsBody = ELIA.states[1].vars.doneNode:getPhysicsBody()
      local physicsShape = physicsBody:getPhysicsShape()
      njli.PhysicsShapeBox.destroy(physicsShape)
      physicsShape = nil

      njli.PhysicsBodyRigid.destroy(physicsBody)
      physicsBody = nil

      njli.Node.destroy(ELIA.states[1].vars.doneNode)
      ELIA.states[1].vars.doneNode = nil
    end,
    mouseDown = function(rayContact)
      if not ELIA.states[1].vars.created then
        return
      end

      if not ELIA.states[1].vars.doneButtonDown then
        ELIA.states[1].vars.doneButtonDown = true
        ELIA.states[1].vars.doneNode, dimension = ELIATexturePacker:draw({name="btn_done_down", node=ELIA.states[1].vars.doneNode})
      end
    end,
    mouseUp = function(rayContact)
      if not ELIA.states[1].vars.created then
        return
      end

      if ELIA.states[1].vars.doneButtonDown then
        ELIA.states[1].vars.doneButtonDown = false
        ELIA.states[1].vars.doneNode, dimension = ELIATexturePacker:draw({name="btn_done_up", node=ELIA.states[1].vars.doneNode})
      end
    end,
    mouseMissed = function(node)
      if not ELIA.states[1].vars.created then
        return
      end

      if ELIA.states[1].vars.doneButtonDown then
        ELIA.states[1].vars.doneButtonDown = false
        ELIA.states[1].vars.doneNode, dimension = ELIATexturePacker:draw({name="btn_done_up", node=ELIA.states[1].vars.doneNode})
      end
    end,
    keyDown = function(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
      if not ELIA.states[1].vars.created then
        return
      end

      if ELIA.states[1].vars.currentResetTimer > 0 then
        return
      end

      local currentChar = string.upper(keycodeName)
      local targetChar = string.upper(string.sub(ELIA.states[1].vars.currentText, ELIA.states[1].vars.currentTypeIndex, ELIA.states[1].vars.currentTypeIndex))

      local correctlyTyped = (currentChar == targetChar)

      if correctlyTyped then
        ELIA.states[1].vars.fontIndexTable[ELIA.states[1].vars.currentTypeIndex] = 7

        ELIA.states[1].vars.totalAccurateTyped = ELIA.states[1].vars.totalAccurateTyped + 1.0

        ELIA.states[1].vars.currentNumberOfPoints = ELIA.states[1].vars.currentNumberOfPoints + POINTS_PER_CORRECT_LETTER
      else
        ELIA.states[1].vars.fontIndexTable[ELIA.states[1].vars.currentTypeIndex] = 4
        ELIA.states[1].vars.currentNumberOfPoints=0
      end

      ELIA.states[1].vars.currentTypeIndex = ELIA.states[1].vars.currentTypeIndex + 1

      if ELIA.states[1].vars.currentTypeIndex <= string.len(ELIA.states[1].vars.currentText) then
        ELIA.states[1].vars.fontIndexTable[ELIA.states[1].vars.currentTypeIndex] = 2
      end

      ELIA.states[1].vars.pointsNode = DrawPoints(ELIA.states[1].vars.currentNumberOfPoints, ELIA.states[1].vars.pointsNode)
      ELIA.states[1].vars.currentNode, ELIA.states[1].vars.currentNodeRect = ELIAFont:printf({
        mainNode=ELIA.states[1].vars.currentNode,
        text=ELIA.states[1].vars.currentText,
        fontIndexTable=ELIA.states[1].vars.fontIndexTable,
        align="Left",
      })
    end,
  },
  {
    name=STATE_SPLASH,
    vars=
    {
      titleNode = nil,
      endlessLetterNode = nil,
      learnMoreNode = nil,
    },
    create = function()
      ELIA.states[2].vars.titleNode = DrawTitle(nil, "ELIA")
      ELIA.states[2].vars.endlessLetterNode = DrawEndlessLetterButton(njli.SCREEN():x() * 0.5, (njli.SCREEN():y() * 0.5) - 100, ELIA.states[2].vars.endlessLetterNode)
      ELIA.states[2].vars.learnMoreNode = DrawLearnMoreButton(njli.SCREEN():x() * 0.5, (njli.SCREEN():y() * 0.5) - 195, ELIA.states[2].vars.learnMoreNode)

    end,
    update = function(timeStep)
      njli.World.getInstance():setBackgroundColor(1.000, 1.000, 1.000)
    end,
    destroy = function()
    end,
    mouseDown = function(rayContact)
    end,
    mouseUp = function(rayContact)
    end,
    mouseMissed = function(rayContact)
    end,
  },

  {
    name=STATE_RESULT,
    vars=
    {
      titleNode = nil,
      learnMoreNode = nil,
      quitNode = nil,
      pointsNode = nil,
      accuracyNode = nil,
    },
    create = function()
      ELIA.states[3].vars.titleNode = DrawTitle(nil, previousGameplayStateName)
      ELIA.states[3].vars.learnMoreNode = DrawLearnMoreButton(njli.SCREEN():x() * 0.5, (njli.SCREEN():y() * 0.5) + 95, ELIA.states[3].vars.learnMoreNode)
      ELIA.states[3].vars.replayNode = DrawReplayButton(njli.SCREEN():x() * 0.5, (njli.SCREEN():y() * 0.5) , ELIA.states[3].vars.replayNode)
      ELIA.states[3].vars.quitNode = DrawQuitButton(njli.SCREEN():x() * 0.5, (njli.SCREEN():y() * 0.5) - 95, ELIA.states[3].vars.quitNode)

      ELIA.states[3].vars.pointsNode = DrawPoints(finalPointsAccumulated, ELIA.states[3].vars.pointsNode)
      ELIA.states[3].vars.accuracyNode = DrawAccuracy(finalAccuracy, ELIA.states[3].vars.accuracyNode)
    end,
    update = function(timeStep)
      njli.World.getInstance():setBackgroundColor(1.000, 1.000, 1.000)
    end,
    destroy = function()
    end,
    mouseDown = function(rayContact)
    end,
    mouseUp = function(rayContact)
    end,
    mouseMissed = function(rayContact)
    end,
  },

  {
    name=STATE_LEADERBOARD,
    vars =
    {
      highScoreNodes = {},
    },
    create = function()
      local highScores = {0000, 1111, 2222, 3333, 4444, 5555, 6666, 7777, 8888, 9999}
      ELIA.states[4].vars.titleNode = DrawTitle(nil, "Leaderboard")

      local vert_margin = njli.SCREEN():y() / 30.0
      local horiz_margin = njli.SCREEN():x() / 40.0
      local half_horizontal = njli.SCREEN():x() * 0.5

      ELIA.states[4].vars.highScoreNodes[1], rect = DrawHighscorePoints(highScores[1], ELIA.states[4].vars.highScoreNodes[1], 1)
      ELIA.states[4].vars.highScoreNodes[1]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575, -1))

      ELIA.states[4].vars.highScoreNodes[2], rect = DrawHighscorePoints(highScores[2], ELIA.states[4].vars.highScoreNodes[2], 2)
      ELIA.states[4].vars.highScoreNodes[2]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 60, -1))

      ELIA.states[4].vars.highScoreNodes[3], rect = DrawHighscorePoints(highScores[3], ELIA.states[4].vars.highScoreNodes[3], 3)
      ELIA.states[4].vars.highScoreNodes[3]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 120, -1))

      ELIA.states[4].vars.highScoreNodes[4], rect = DrawHighscorePoints(highScores[4], ELIA.states[4].vars.highScoreNodes[4], 4)
      ELIA.states[4].vars.highScoreNodes[4]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 180, -1))

      ELIA.states[4].vars.highScoreNodes[5], rect = DrawHighscorePoints(highScores[5], ELIA.states[4].vars.highScoreNodes[5], 5)
      ELIA.states[4].vars.highScoreNodes[5]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 240, -1))

      ELIA.states[4].vars.highScoreNodes[6], rect = DrawHighscorePoints(highScores[6], ELIA.states[4].vars.highScoreNodes[6], 6)
      ELIA.states[4].vars.highScoreNodes[6]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 300, -1))

      ELIA.states[4].vars.highScoreNodes[7], rect = DrawHighscorePoints(highScores[7], ELIA.states[4].vars.highScoreNodes[7], 7)
      ELIA.states[4].vars.highScoreNodes[7]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 360, -1))

      ELIA.states[4].vars.highScoreNodes[8], rect = DrawHighscorePoints(highScores[8], ELIA.states[4].vars.highScoreNodes[8], 8)
      ELIA.states[4].vars.highScoreNodes[8]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 420, -1))

      ELIA.states[4].vars.highScoreNodes[9], rect = DrawHighscorePoints(highScores[9], ELIA.states[4].vars.highScoreNodes[9], 9)
      ELIA.states[4].vars.highScoreNodes[9]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 480, -1))

      ELIA.states[4].vars.highScoreNodes[10], rect = DrawHighscorePoints(highScores[10], ELIA.states[4].vars.highScoreNodes[10], 10)
      ELIA.states[4].vars.highScoreNodes[10]:setOrigin(bullet.btVector3(half_horizontal - (rect.width * 0.5), 575 - 540, -1))
    end,
    update = function(timeStep)
      njli.World.getInstance():setBackgroundColor(1.000, 1.000, 1.000)
    end,
    destroy = function()
    end,
    mouseDown = function(rayContact)
    end,
    mouseUp = function(rayContact)
    end,
    mouseMissed = function(rayContact)
    end,
  },
}

ELIA.frameIndex =
{
  [STATE_GAMEPLAY] = 1,
  [STATE_SPLASH] = 2,
  [STATE_RESULT] = 3,
  [STATE_LEADERBOARD] = 4,
}

function ELIA:getFrameIndex(name)
    return self.frameIndex[name];
end

-- function ELIA:getGameplayState()
--   local frameIndex = ELIA:getFrameIndex("gameplay")
--   return ELIA.states[frameIndex]
-- end
-- 
-- function ELIA:getSplashState()
--   local frameIndex = ELIA:getFrameIndex("splash")
--   return ELIA.states[frameIndex]
-- end
-- 
-- function ELIA:getResultState()
--   local frameIndex = ELIA:getFrameIndex("result")
--   return ELIA.states[frameIndex]
-- end
-- 
-- function ELIA:getLeaderboardState()
--   local frameIndex = ELIA:getFrameIndex("leaderboard")
--   return ELIA.states[frameIndex]
-- end


-- currentStateName = STATE_GAMEPLAY
-- currentStateName = STATE_SPLASH 
-- currentStateName = STATE_RESULT 
currentStateName = STATE_LEADERBOARD 

--[[
https://www.speedtypingonline.com/typing-equations

Accuracy
Typing accuracy is defined as the percentage of correct entries out of the total entries typed. To calculate this mathematically, take the number of correct characters typed divided by the total number, multiplied by 100%. So if you typed 90 out of 100 characters correctly you typed with 90% accuracy.

It is interesting to note that all errors, whether corrected or not, should be counted in the accuracy calculation, unlike the net WPM calculation. This is because the calculation is more "live" than typing speed and literally describes the likelihood that the next character will be typed correctly, regardless of whether it will be corrected or not.
]]--


local AccuracyPercentage = function(totalLetters, numberOfLetters, accurateTyped)
  local total = (totalLetters - numberOfLetters)
  if total > 0 then
    local percentage = ((accurateTyped / total)  * 100.0)
    return math.min(100.0, percentage)
  end
  return 100.0
end

function DrawLabel(...)
  local arg=... or {}
  local text = arg.text or "?"
  local mainNode = arg.mainNode or nil

  local fontTable = {}
  for i=1, string.len(text) do
    fontTable[i] = 8
  end

  local mainNode, mainNodeRect = ELIAFont:printf({
    mainNode=mainNode,
    text=text,
    fontIndexTable=fontTable,
    align="Left",
  })

  mainNode:show(OrthographicCameraNode:getCamera())

  return mainNode, mainNodeRect

end

function DrawTitleHelper(...)
  local arg=... or {}
  local text = arg.text or "?"
  local mainNode = arg.mainNode or nil

  local fontTable = {}
  for i=1, string.len(text) do
    fontTable[i] = 9
  end

  local mainNode, mainNodeRect = ELIAFont:printf({
    mainNode=mainNode,
    text=text,
    fontIndexTable=fontTable,
    align="Left",
  })

  mainNode:show(OrthographicCameraNode:getCamera())

  return mainNode, mainNodeRect

end

function DrawPoints(points, node)
  local pointsString = string.format("%.4d", tostring(points)) .. " Points"
  local arg = {mainNode=node,text=pointsString}

  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0
  local half_horizontal = njli.SCREEN():x() * 0.5
  
  local node_ret, rect = DrawLabel(arg)
  node_ret:setOrigin(bullet.btVector3(bullet.btVector3(half_horizontal - (rect.width * 0.5), vert_margin, -1)))
  node_ret:show(OrthographicCameraNode:getCamera())

  return node_ret, rect
end

function DrawHighscorePoints(points, node, place)
  local pointsString = string.format("%d. %.4d", place, tostring(points)) 
  local arg = {mainNode=node,text=pointsString}

  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0
  local half_horizontal = njli.SCREEN():x() * 0.5
  
  local node_ret, rect = DrawLabel(arg)
  -- node_ret:setOrigin(bullet.btVector3(bullet.btVector3(half_horizontal - (rect.width * 0.5), vert_margin, -1)))
  node_ret:show(OrthographicCameraNode:getCamera())

  return node_ret, rect
end

function DrawAccuracy(accuracy, node)
  local accuracyString = string.format("%.0f", accuracy) .. "% Accuracy"
  local arg = {mainNode=node, text=accuracyString}

  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0
  local half_horizontal = njli.SCREEN():x() * 0.5
  
  local node_ret, rect = DrawLabel(arg)
  node_ret:setOrigin(bullet.btVector3(bullet.btVector3(half_horizontal - (rect.width * 0.5), vert_margin * 4, -1)))
  node_ret:show(OrthographicCameraNode:getCamera())

  return node_ret
end

function DrawDoneButton(x, y, node)
  local node, dimension = ELIATexturePacker:draw({name="btn_done_up", node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  local donePhysicsShape = njli.PhysicsShapeBox.create()

  local donePhysicsBody = njli.PhysicsBodyRigid.create()
  donePhysicsBody:setStaticPhysics()
  donePhysicsBody:setPhysicsShape(donePhysicsShape)

  node:setPhysicsBody(donePhysicsBody)

  donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
end

function DrawTitle(node, str)
  local accuracyString = str
  local arg = {mainNode=node, text=accuracyString}

  local vert_margin = njli.SCREEN():y() / 30.0
  local horiz_margin = njli.SCREEN():x() / 40.0
  local half_horizontal = njli.SCREEN():x() * 0.5
  local half_vertical = njli.SCREEN():y() * 0.5
  
  local node_ret, rect = DrawTitleHelper(arg)
  node_ret:setOrigin(bullet.btVector3(bullet.btVector3(half_horizontal - (rect.width * 0.5), njli.SCREEN():y() - rect.height - vert_margin, -1)))
  node_ret:show(OrthographicCameraNode:getCamera())

  return node_ret
end

function DrawEndlessLetterButton(x, y, node)
  local node, dimension = ELIATexturePacker:draw({name="btn_endless_letter_up", node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  local donePhysicsShape = njli.PhysicsShapeBox.create()

  local donePhysicsBody = njli.PhysicsBodyRigid.create()
  donePhysicsBody:setStaticPhysics()
  donePhysicsBody:setPhysicsShape(donePhysicsShape)

  node:setPhysicsBody(donePhysicsBody)

  donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
end

function DrawLearnMoreButton(x, y, node)
  local node, dimension = ELIATexturePacker:draw({name="btn_learn_more_up", node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  local donePhysicsShape = njli.PhysicsShapeBox.create()

  local donePhysicsBody = njli.PhysicsBodyRigid.create()
  donePhysicsBody:setStaticPhysics()
  donePhysicsBody:setPhysicsShape(donePhysicsShape)

  node:setPhysicsBody(donePhysicsBody)

  donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
end

function DrawQuitButton(x, y, node)
  local node, dimension = ELIATexturePacker:draw({name="btn_quit_up", node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  local donePhysicsShape = njli.PhysicsShapeBox.create()

  local donePhysicsBody = njli.PhysicsBodyRigid.create()
  donePhysicsBody:setStaticPhysics()
  donePhysicsBody:setPhysicsShape(donePhysicsShape)

  node:setPhysicsBody(donePhysicsBody)

  donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
end

function DrawReplayButton(x, y, node)
  local node, dimension = ELIATexturePacker:draw({name="btn_replay_up", node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  local donePhysicsShape = njli.PhysicsShapeBox.create()

  local donePhysicsBody = njli.PhysicsBodyRigid.create()
  donePhysicsBody:setStaticPhysics()
  donePhysicsBody:setPhysicsShape(donePhysicsShape)

  node:setPhysicsBody(donePhysicsBody)

  donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
end


function DrawPlaceGraphic(x, y, node, place)
  local graphicName = "gfg_10th"

  if place == 1 then
    graphicName = "gfg_1st"
  elseif place == 2 then
    graphicName = "gfg_2nd"
  elseif place == 3 then
    graphicName = "gfg_3rd"
  elseif place == 4 then
    graphicName = "gfg_4th"
  elseif place == 5 then
    graphicName = "gfg_5th"
  elseif place == 6 then
    graphicName = "gfg_6th"
  elseif place == 7 then
    graphicName = "gfg_7nd"
  elseif place == 8 then
    graphicName = "gfg_8th"
  elseif place == 9 then
    graphicName = "gfg_9th"
  elseif place == 10 then
    graphicName = "gfg_10th"
  end

  local node, dimension = ELIATexturePacker:draw({name=graphicName, node=node})

  local origin = bullet.btVector3(x, y, -1)
  node:setOrigin(origin)
  node:show(OrthographicCameraNode:getCamera())

  local scene = njli.World.getInstance():getScene()
  scene:getRootNode():addChildNode(node)

  -- local donePhysicsShape = njli.PhysicsShapeBox.create()

  -- local donePhysicsBody = njli.PhysicsBodyRigid.create()
  -- donePhysicsBody:setStaticPhysics()
  -- donePhysicsBody:setPhysicsShape(donePhysicsShape)

  -- node:setPhysicsBody(donePhysicsBody)

  -- donePhysicsShape:setHalfExtends(bullet.btVector3( dimension:x(), dimension:y(), 1.0 ))

  return node
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
  scene:setTouchCamera(OrthographicCameraNode:getCamera())
  
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
  
  ELIAFont = BitmapFont2(
  {
    "ELIABasic",
    "ELIABlue",
    "ELIAGreen",
    "ELIARed",
    "ELIAYellow",
    "ELIABlack",
    "TimesNewRomanBasic",
    "HUD",
    "Title",
  })


  ELIATexturePacker = TexturePacker({file="elia_gameplay0"})

  ELIA.states[ELIA:getFrameIndex(currentStateName)].create()

end
  
local Destroy = function()
  
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

  ELIA.states[ELIA:getFrameIndex(currentStateName)].destroy()
  
end

local Update = function(timeStep)

  if debugging == nil then
    debugging = false
    return false
  end

  if not debugging then
    require("mobdebug").start()
    debugging = true
  end

  ELIA.states[ELIA:getFrameIndex(currentStateName)].update(timeStep)

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
  ELIA.states[ELIA:getFrameIndex(currentStateName)].keyDown(keycodeName, withCapsLock, withControl, withShift, withAlt, withGui)
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
local SceneMouseMove = function(scene, mouse) end 
local SceneKeyDown = function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end 
local SceneKeyUp = function(scene, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end 
local SceneReceivedMemoryWarning = function(scene) end 
local SceneWillResignActive = function(scene) end 
local SceneDidBecomeActive = function(scene) end 
local SceneDidEnterBackground = function(scene) end 
local SceneWillEnterForeground = function(scene) end 
local SceneWillTerminate = function(scene) end 
local SceneInterrupt = function(scene) end 
local SceneResumeInterrupt = function(scene) end 
local NodeEnterState = function(node) end 
local NodeUpdateState = function(node, timeStep) end 
local NodeExitState = function(node) end 
local NodeOnMessage = function(node, message) end
local NodeCollide = function(node, otherNode, collisionPoint) end 
local NodeNear = function(node, otherNode) end 
local NodeActionUpdate = function(action, timeStep) end 
local NodeActionComplete = function(action) end 
local NodeRayTouchesDown = function(rayContact) end 
local NodeRayTouchesUp = function(rayContact) end
local NodeRayTouchesMove = function(rayContact) end 
local NodeRayTouchesCancelled = function(rayContact) end 
local NodeRayTouchesMissed = function(node) end 
local NodeRayTouchDown = function(rayContact) end 
local NodeRayTouchUp = function(rayContact) end 
local NodeRayTouchMove = function(rayContact) end 
local NodeRayTouchCancelled = function(rayContact) end 

local NodeRayMouseDown = function(rayContact)
  ELIA.states[ELIA:getFrameIndex(currentStateName)].mouseDown(rayContact)
end

local NodeRayMouseUp = function(rayContact)
  ELIA.states[ELIA:getFrameIndex(currentStateName)].mouseUp(rayContact)
end

local NodeRayMouseMove = function(rayContact) end 
local NodeRayTouchMissed = function(node) end

local NodeRayMouseMissed = function(node)
  ELIA.states[ELIA:getFrameIndex(currentStateName)].mouseMissed(node)
end

local NodeKeyboardShow = function(node) end 
local NodeKeyboardCancel = function(node) end 
local NodeKeyboardReturn = function(node) end 
local NodeRenderHUD = function(node) end 
local NodeGamePause = function(node) end 
local NodeGameUnPause = function(node) end 
local NodeTouchesDown = function(node, touches) end 
local NodeTouchesUp = function(node, touches) end 
local NodeTouchesMove = function(node, touches) end 
local NodeTouchesCancelled = function(node, touches) end 
local NodeTouchDown = function(node, touch) end 
local NodeTouchUp = function(node, touch) end 
local NodeTouchMove = function(node, touch) end 
local NodeTouchCancelled = function(node, touches) end 
local NodeMouseDown = function(node, mouse) end 
local NodeMouseUp = function(node, mouse) end 
local NodeMouseMove = function(node, mouse) end 
local NodeKeyDown = function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end 
local NodeKeyUp = function(node, keycodeName, withCapsLock, withControl, withShift, withAlt, withGui) end


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



