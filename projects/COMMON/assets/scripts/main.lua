--package.path = package.path .. ":/Applications/Developer/ZeroBraneStudio.app/Contents/ZeroBraneStudio/lualibs/mobdebug/?.lua"
--require('mobdebug').start()
--http://notebook.kulchenko.com/zerobrane/debugging-wireshark-lua-scripts-with-zerobrane-studio

Interface = require "NJLI.InterfaceFunctions"
YappyGame = require "YAPPYBIRDS.YappyGame"

NJLIButtonControl =
{
    class = require "NJLI.STATEMACHINE.UI.BUTTON.Button",
    name = "NJLI.STATEMACHINE.UI.BUTTON.Button",
    states =
    {
        {
            class = require "NJLI.STATEMACHINE.UI.BUTTON.STATES.Default",
            name = "NJLI.STATEMACHINE.UI.BUTTON.STATES.Default",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.BUTTON.STATES.Disabled",
            name = "NJLI.STATEMACHINE.UI.BUTTON.STATES.Disabled",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.BUTTON.STATES.Focused",
            name = "NJLI.STATEMACHINE.UI.BUTTON.STATES.Focused",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.BUTTON.STATES.Highlighted",
            name = "NJLI.STATEMACHINE.UI.BUTTON.STATES.Highlighted",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.BUTTON.STATES.Selected",
            name = "NJLI.STATEMACHINE.UI.BUTTON.STATES.Selected",
        },
    }
}

NJLIImageControl =
{
    class = require "NJLI.STATEMACHINE.UI.IMAGE.Image",
    name = "NJLI.STATEMACHINE.UI.IMAGE.Image",
    states =
    {
        {
            class = require "NJLI.STATEMACHINE.UI.IMAGE.STATES.Default",
            name = "NJLI.STATEMACHINE.UI.IMAGE.STATES.Default",
        },
    }
}

NJLISwitchControl =
{
    class = require "NJLI.STATEMACHINE.UI.SWITCH.Switch",
    name = "NJLI.STATEMACHINE.UI.SWITCH.Switch",
    states =
    {
        {
            class = require "NJLI.STATEMACHINE.UI.SWITCH.STATES.On",
            name = "NJLI.STATEMACHINE.UI.SWITCH.STATES.On",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.SWITCH.STATES.Off",
            name = "NJLI.STATEMACHINE.UI.SWITCH.STATES.Off",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.SWITCH.STATES.Disabled",
            name = "NJLI.STATEMACHINE.UI.SWITCH.STATES.Disabled",
        },
        {
            class = require "NJLI.STATEMACHINE.UI.SWITCH.STATES.Phasing",
            name = "NJLI.STATEMACHINE.UI.SWITCH.STATES.Phasing",
        },
    }
}

 NJLILabelControl =
 {
     class = require "NJLI.STATEMACHINE.UI.LABEL.Label",
     name = "NJLI.STATEMACHINE.UI.LABEL.Label",
     states =
     {
         {
             class = require "NJLI.STATEMACHINE.UI.LABEL.STATES.Default",
             name = "NJLI.STATEMACHINE.UI.LABEL.STATES.Default",
         },
     }
 }


local BalloonNodeEntity =
{
  class = require "YAPPYBIRDS.NODES.BALLOON.Balloon",
  name = "YAPPYBIRDS.NODES.BALLOON.Balloon",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Spawn",
          name = "YAPPYBIRDS.NODES.BALLOON.STATES.Spawn"
      },
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Lob",
          name = "YAPPYBIRDS.NODES.BALLOON.STATES.Lob"
      },
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Hit",
          name = "YAPPYBIRDS.NODES.BALLOON.STATES.Hit"
      },
  },
  nodes = {} --The childen Nodes for the Node.
}

local BirdBeakNodeEntity =
{
    name = "YAPPYBIRDS.NODES.BIRDBEAK.BirdBeak",
  class = require "YAPPYBIRDS.NODES.BIRDBEAK.BirdBeak",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Idle",
          name = "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Idle"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Grab",
          name = "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Grab"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Hit",
          name = "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Hit"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Yap",
          name = "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Yap"
      },
  },
  nodes = {} --The childen Nodes for the Node.
}

local BirdNodeEntity =
{
    name = "YAPPYBIRDS.NODES.BIRD.Bird",
  class = require "YAPPYBIRDS.NODES.BIRD.Bird",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Spawn",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Spawn"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Fly",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Fly",
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Grabbed",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Grabbed"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Grabbing",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Grabbing"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Hit",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Hit"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Pursue",
          name = "YAPPYBIRDS.NODES.BIRD.STATES.Pursue"
      }
  },
  nodes = {
    BirdBeakNodeEntity,
  } --The childe Nodes for the Node.
}

local MenuScene =
{
    name = "YAPPYBIRDS.SCENES.MENU.Menu",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.About",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.About",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
      nodes = {}, --The nodes for the SceneState.
    }
  },
  nodes = {
    } --The nodes for the Scene.
}

local GameplayScene =
{
    name = "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
  --The first state is the start state.
  states =
  {
    {
        name = "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
      nodes = {
        BalloonNodeEntity,
        BirdNodeEntity,
      } --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Lose",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Lose",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Playing",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Playing",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Win",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Win",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = {
      BalloonNodeEntity,
      BirdNodeEntity,
    }
 --The nodes for the Scene.
}

local ResultsScene =
{
    name = "YAPPYBIRDS.SCENES.RESULTS.Results",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.RESULTS.Results",
  --The first state is the start state.
  states =
  {
    {
        name = "YAPPYBIRDS.SCENES.RESULTS.STATES.Loading",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.RESULTS.STATES.Lose",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Lose",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "YAPPYBIRDS.SCENES.RESULTS.STATES.Win",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Win",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = {} --The nodes for the Scene.
}

local Worlds =
{
  yappygame =
  {
      name = "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
    class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
    states =
    {
      --The first state is the start state.
      {
       name = "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Menu",
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Menu",
        scene = MenuScene
      },
--      {
--          name = "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
--        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
--        scene = GameplayScene
--      },
--      {
--          name = "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Results",
--        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Results",
--        scene = ResultsScene
--      },
    }
  }
}

local function CreatePerspectiveCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic(false)
    camera:setRenderCategory(RenderCategories.perspective)
    camera:setName("perspectiveCamera")

    node:setCamera(camera)

    return node
end

local function CreateOrthoCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic()
    camera:setRenderCategory(RenderCategories.orthographic)
    camera:setName("orthoCamera")

    node:setCamera(camera)

    return node
end

local BitmapFont = require 'NJLI.BitmapFont'
RanchersFont = BitmapFont({file='Ranchers_GlyphDesigner.fnt'})

local material = njli.Material.create()
local shader = njli.ShaderProgram.create()
Geometry2D = njli.Sprite2D.create()

OrthographicCameraNode = CreateOrthoCameraNode("orthoCamera")
PerspectiveCameraNode = CreatePerspectiveCameraNode("perspectiveCamera")

material:setName("YappyBird Material")
shader:setName("YappyBird Shader")
Geometry2D:setName("YappyBird Geometry")

njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)


Geometry2D:setMaterial(material)
Geometry2D:setShaderProgram(shader)
Geometry2D:show(OrthographicCameraNode:getCamera())
Geometry2D:hide(PerspectiveCameraNode:getCamera())

RanchersFont:load()
RanchersFont:show(OrthographicCameraNode:getCamera())
RanchersFont:hide(PerspectiveCameraNode:getCamera())

MyGame = YappyGame(Worlds.yappygame)

MyGame:startStateMachine()


