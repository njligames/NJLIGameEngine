--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:79de9ff6fe4c7603ea3f7c2cfe7266f1:b85027dccc397144e14e380877155842:5fdc0a8de722d80554b4ddbd0594cf82$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            x=1,
            y=1,
            
            width=32,
            height=32,

	        widthFile=32,
	        heightFile=32,

            pivotx=16,
            pivoty=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32,

            trimmedName = "blue",
        },
    
        {
            x=1,
            y=35,
            
            width=32,
            height=32,

	        widthFile=32,
	        heightFile=32,

            pivotx=16,
            pivoty=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32,

            trimmedName = "green",
        },
    
        {
            x=1,
            y=69,
            
            width=32,
            height=32,

	        widthFile=32,
	        heightFile=32,

            pivotx=16,
            pivoty=16,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 32,
            sourceHeight = 32,

            trimmedName = "red",
        },
    
    },
    fileName = "images/debugLevel0.png",
    sheetContentWidth = 128,
    sheetContentHeight = 128,
    scale = 1,
    shapePadding = 0,
    borderPadding = 0,
    commonDivisorX = 1,
    commonDivisorY = 1,
    extrude = 1,
    baseFactor = 1,
    maxTextureSizeWidth = 4096,
    maxTextureSizeHeight = 4096,
    fixedTextureSizeWidth = -1,
    fixedTextureSizeHeight = -1,



    -- smartUpdateKey = $TexturePacker:SmartUpdate:79de9ff6fe4c7603ea3f7c2cfe7266f1:b85027dccc397144e14e380877155842:5fdc0a8de722d80554b4ddbd0594cf82$,
    -- settings_autoSDSettings = {
    -- 
    --     {
    --         settings_autoSDSettings_scale = 1,
    --         settings_autoSDSettings_extension = ,
    --         settings_autoSDSettings_spriteFilter = ,
    --         settings_autoSDSettings_acceptFractionalValues = false,
    --         settings_autoSDSettings_maxTextureSize_width = -1,
    --         settings_autoSDSettings_maxTextureSize_height = -1,
    --     },
    -- 
    -- },
    -- settings_ditherType = NearestNeighbour,
    -- settings_textureFormat = png,
    -- settings_outputFormat = RGBA8888,
    -- settings_contentProtection_key = ,
    -- settings_tpsName = unsaved,
    -- settings_allowRotation = false,
    -- settings_flipPVR = false,
    -- settings_forceIdenticalLayout = false,
    -- settings_multiPack = true,
    -- settings_shapeDebug = ,
    -- settings_trimSpriteNames = false,
    -- settings_autoAliasEnabled = true,
    -- settings_premultiplyAlpha = false,
    -- settings_reduceBorderArtifacts = true,
    -- settings_fixedTextureSize_width = -1,
    -- settings_fixedTextureSize_height = -1,
    -- settings_dataFormat = corona-imagesheet,
    -- settings_textureSubPath = ,
    -- settings_borderPadding = 0,
    -- settings_shapePadding = 0,
    -- settings_commonDivisorX = 1,
    -- settings_commonDivisorY = 1,
    -- settings_dpi = 72,
    -- settings_backgroundColor = 0,
    -- variantIndex = 0,
    -- multipackIndex = ,

    -- variantParams_scale = 1,
    -- variantParams_shapePadding = 0,
    -- variantParams_borderPadding = 0,
    -- variantParams_commonDivisorX = 1,
    -- variantParams_commonDivisorY = 1,
    -- variantParams_extrude = 1,
    -- variantParams_baseFactor = 1,
    -- variantParams_maxTextureSize_width = 4096,
    -- variantParams_maxTextureSize_height = 4096,
    -- variantParams_fixedTextureSize_width = -1,
    -- variantParams_fixedTextureSize_height = -1,
}

SheetInfo.frameIndex =
{

    ["blue"] = 1,
    ["green"] = 2,
    ["red"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
