--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- TODO: Change this exmaple to make sense for NJLICEngine
-- $TexturePacker:SmartUpdate:df23b2f87897080aea1af91bdf14a279:b85027dccc397144e14e380877155842:fd8fcefa53e01cbdafda51de4331d180$
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
  fileName = "images/debug0.png",
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
  fixedTextureSizeHeight = -1

  -- _variantParams.scale = 1,
  -- _variantParams.shapePadding = 0,
  -- _variantParams.borderPadding = 0,
  -- _variantParams.commonDivisorX = 1,
  -- _variantParams.commonDivisorY = 1,
  -- _variantParams.extrude = 1,
  -- _variantParams.baseFactor = 1,
  -- _variantParams_maxTextureSize_width = 4096,
  -- _variantParams_maxTextureSize_height = 4096,
  -- _variantParams_fixedTextureSize_width = -1,
  -- _variantParams_fixedTextureSize_height = -1
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
