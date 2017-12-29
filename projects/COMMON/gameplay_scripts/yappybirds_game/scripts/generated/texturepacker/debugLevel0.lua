--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:44d16df03b5bf288a207cf5e1f274b18:0de42c1470a35ef61b7f1838bfe559d2:5fdc0a8de722d80554b4ddbd0594cf82$
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
            
            width=8,
            height=8,

	        widthFile=8,
	        heightFile=8,

            pivotx=4,
            pivoty=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8,

            trimmedName = "8x8_blue",
        },
    
        {
            x=1,
            y=11,
            
            width=8,
            height=8,

	        widthFile=8,
	        heightFile=8,

            pivotx=4,
            pivoty=4,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 8,
            sourceHeight = 8,

            trimmedName = "8x8_red",
        },
    
    },
    fileName = "images/debugLevel0.png",
    sheetContentWidth = 32,
    sheetContentHeight = 32,
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



    -- smartUpdateKey = $TexturePacker:SmartUpdate:44d16df03b5bf288a207cf5e1f274b18:0de42c1470a35ef61b7f1838bfe559d2:5fdc0a8de722d80554b4ddbd0594cf82$,
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

    ["8x8_blue"] = 1,
    ["8x8_red"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
