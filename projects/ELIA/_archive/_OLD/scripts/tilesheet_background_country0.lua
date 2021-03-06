









local SheetInfo = {}

SheetInfo.sheet =
{
 frames = {
 
 {
 x=729,
 y=1907,
 
 width=128,
 height=105,

 widthFile=128,
 heightFile=105,

 pivotx=0,
 pivoty=105,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 128,
 sourceHeight = 105,

 trimmedName = "128cloud00",
 },
 
 {
 x=729,
 y=1778,
 
 width=101,
 height=128,

 widthFile=101,
 heightFile=128,

 pivotx=0,
 pivoty=128,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 101,
 sourceHeight = 128,

 trimmedName = "128tree00",
 },
 
 {
 x=0,
 y=888,
 
 width=2048,
 height=376,

 widthFile=2048,
 heightFile=376,

 pivotx=0,
 pivoty=376,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 2048,
 sourceHeight = 376,

 trimmedName = "2048hills00",
 },
 
 {
 x=0,
 y=0,
 
 width=2048,
 height=463,

 widthFile=2048,
 heightFile=463,

 pivotx=0,
 pivoty=463,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 2048,
 sourceHeight = 463,

 trimmedName = "2048hills01",
 },
 
 {
 x=0,
 y=464,
 
 width=2048,
 height=423,

 widthFile=2048,
 heightFile=423,

 pivotx=0,
 pivoty=423,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 2048,
 sourceHeight = 423,

 trimmedName = "2048hills02",
 },
 
 {
 x=472,
 y=1778,
 
 width=256,
 height=209,

 widthFile=256,
 heightFile=209,

 pivotx=0,
 pivoty=209,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 256,
 sourceHeight = 209,

 trimmedName = "256cloud00",
 },
 
 {
 x=238,
 y=1778,
 
 width=233,
 height=256,

 widthFile=233,
 heightFile=256,

 pivotx=0,
 pivoty=256,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 233,
 sourceHeight = 256,

 trimmedName = "256house00",
 },
 
 {
 x=0,
 y=1778,
 
 width=237,
 height=256,

 widthFile=237,
 heightFile=256,

 pivotx=0,
 pivoty=256,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 237,
 sourceHeight = 256,

 trimmedName = "256tree00",
 },
 
 {
 x=457,
 y=1265,
 
 width=454,
 height=512,

 widthFile=454,
 heightFile=512,

 pivotx=0,
 pivoty=512,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 454,
 sourceHeight = 512,

 trimmedName = "512tree00",
 },
 
 {
 x=0,
 y=1265,
 
 width=456,
 height=512,

 widthFile=512,
 heightFile=512,

 pivotx=0,
 pivoty=512,

 sourceX = 28,
 sourceY = 0,
 sourceWidth = 456,
 sourceHeight = 512,

 trimmedName = "512tree01",
 },
 
 {
 x=472,
 y=1988,
 
 width=32,
 height=32,

 widthFile=32,
 heightFile=32,

 pivotx=0,
 pivoty=32,

 sourceX = 0,
 sourceY = 0,
 sourceWidth = 32,
 sourceHeight = 32,

 trimmedName = "8x8",
 },
 
 },
 fileName = "images/tilesheet_background_country0.png",
 sheetContentWidth = 2048,
 sheetContentHeight = 2048,
 scale = 1,
 shapePadding = 1,
 borderPadding = 0,
 commonDivisorX = 1,
 commonDivisorY = 1,
 extrude = 0,
 baseFactor = 1,
 maxTextureSizeWidth = 4096,
 maxTextureSizeHeight = 4096,
 fixedTextureSizeWidth = -1,
 fixedTextureSizeHeight = -1,



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
}

SheetInfo.frameIndex =
{

 ["128cloud00"] = 1,
 ["128tree00"] = 2,
 ["2048hills00"] = 3,
 ["2048hills01"] = 4,
 ["2048hills02"] = 5,
 ["256cloud00"] = 6,
 ["256house00"] = 7,
 ["256tree00"] = 8,
 ["512tree00"] = 9,
 ["512tree01"] = 10,
 ["8x8"] = 11,
}

function SheetInfo:getSheet()
 return self.sheet;
end

function SheetInfo:getFrameIndex(name)
 return self.frameIndex[name];
end

return SheetInfo
