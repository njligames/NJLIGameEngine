--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2b1f311020c071bdcbd0f79dc168406c:0dfdc75a0105a5197a0402fce265a34c:e5221e08a01648a6cecb05e53395f223$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local ParamInfo = {}

ParamInfo =
{
    World =
    {
        Gravity = bullet.btVector3(0,-60.81,0),
        -- LayerDistance = 15.24, --meters (50 feet), How far each layer is from eachother
        LayerDistance = 0.1, --meters (50 feet), How far each layer is from eachother
        LayerMax = 60.4125, --meters (200 feet), How far the 4th (farthest) layer is from the camera
        WorldOffset = bullet.btVector2(0.00, 19.52),
        -- WorldOffset = bullet.btVector2(0.10, 19.45),
        WorldScale = 89.0430,
        -- WorldScale = 88,
        MinBrightnessForDistance = 0.8, --value from 0.0 (black) to 1.0 (the image's brightness)
    },
	Projectile = 
	{
		WaterBalloon =
		{
			Azimuth = 10, --Angle fro mthe ground up
			Magnitude = 45, --How fast the balloon goes when you tap the screen.
			DieY = -50, --Y position for when the balloon's memory gets cleaned up.
            Mass = 1, --The mass of the balloon.
            FramesPerSecond = 30.0, -- must be: 1 <= fps <= 60
            Hues = {
                0,
                10,
                20,
                30,
                40,
                50,
                60,
                70,
                80,
                90,
                100,
                110,
                120,
                130,
                140,
                150,
                160,
                170,
                180,
                -10,
                -20,
                -30,
                -40,
                -50,
                -60,
                -70,
                -80,
                -90,
                -100,
                -110,
                -120,
                -130,
                -140,
                -150,
                -160,
                -170,
                -180,
            },
            ScaleMin = 0.9,
            ScaleMax = 2.0,
            --Still have to make these variables live...
            DeathVariables = {
                FramesPerSecond = 30.0, -- must be: 1 <= fps <= 60
                ShowParticles = false,
            },
		},
	},
	Dog = 
	{
		MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
		MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),		
		DazedTime = (0.5 * 1000),
		CapturedHeight = 20,
	},
	Bird =
	{
		chubiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = 1,
            PursueTime = (6 * 1000),
			StealSpeed = 1,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
            --David add your variables after here..
            ScalarVariableExample=0,
            ArrayVariableExample={
                Example1 = true,
                Example2 = "hello i'm  string",
                Example3 = 1.0,
                Example4 = {
                    AnotherVariable = 0
                },

            }
		},
		garuBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (5 * 1000),
			StealSpeed = 2,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		momiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (4 * 1000),
			StealSpeed = 3,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		puffyBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (3 * 1000),
			StealSpeed = 4,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		weboBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (2 * 1000),
			StealSpeed = 5,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		zuruBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (1 * 1000),
			StealSpeed = 6,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		
	},
	originForLayer = function(self, tileInfo)
		local x        = tileInfo.x
		local y        = tileInfo.y
		local layer    = tileInfo.layer or 1
		local sublayer = tileInfo.sublayer or 1
		local width    = 1.0
		local height   = 1.0
		if tileInfo.tile then
			width    = tileInfo.tile.width or 1.0
			height   = tileInfo.tile.height or 1.0
		end

		-- assert((layer >= 1 and layer <= 4), "The layer (" .. layer .. ") number must be one of (1, 2, 3, 4)")

		-- print("width", width)
		-- print("height", height)

		function transformCoordinate(origin, layerMax)
			function adjustPosition(oldPosition, newDistance)
		        local ret                     = oldPosition
		        local totalDistanceFromCamera = layerMax

		        if newDistance ~= totalDistanceFromCamera then
		            local theta       = math.atan(oldPosition, totalDistanceFromCamera)
		            local newPosition = math.tan(theta) * newDistance
		            ret               = newPosition
		        end

		        return ret
		    end

		    local zz = origin:z() 
		    local xx = adjustPosition(origin:x() , zz)
		    local yy = adjustPosition(origin:y() , zz)

		    return bullet.btVector3(xx, yy, zz)
		end

		-- local subLayerOffset = -0.1
		local divisor = self:getGameViewDivisor() --self:getDivisor()

		local x_offset = ( 0.5 * self.World.WorldScale )
		local y_offset = ( 0.5 * self.World.WorldScale )

		local xx = ((self.World.WorldOffset:x()) + (((x + (width * 0.5)) / divisor) - x_offset))
		local yy = ((self.World.WorldOffset:y()) + (((y + (height * 0.5)) / divisor) - y_offset))
		-- local offset = 0
		-- if sublayer ~= nil then
		-- 	offset = (sublayer * subLayerOffset)
		-- end

		-- print("sublayer, subLayerOffset", sublayer, subLayerOffset)

		-- 4th layer is the furthest layer number.

		-- local layer_offset = self.World.LayerDistance * ((4 - layer) + 1)

		
		-- local zz = self.World.LayerMax - (self.World.LayerDistance * 0) -- furthest layer (4th)
		-- local zz = self.World.LayerMax - (self.World.LayerDistance * 1) -- second furthest layer (3rd)
		-- local zz = self.World.LayerMax - (self.World.LayerDistance * 2) -- second closest layer (2nd)
		-- local zz = self.World.LayerMax - (self.World.LayerDistance * 3) -- closest layer (1st)

		-- local zz = self.World.LayerMax + (0.1 - (self.World.LayerDistance * (layer - 1))) -- + offset

		-- print_r(tileInfo)
		local zz = self.World.LayerMax - (self.World.LayerDistance * (4 - layer))
		-- print(zz)

		local origin = bullet.btVector3(xx, yy, zz)

		return transformCoordinate(origin, self.World.LayerMax)
	end,
	tileDimensions = function(self, tile, z)
		local width, height = 256, 256
		if tile then
			width = tile.width or width
			height = tile.height or height
		end
		
		local scaleFactor = (z / self.World.LayerMax)
		local width = (width) * scaleFactor
    	local height = (height) * scaleFactor
    	local divisor = self:getGameViewDivisor()

		return bullet.btVector2( (width / divisor) * 2, (height / divisor) * 2 )
	end,
	getGameViewDivisor = function(self)
		local scale = self.World.WorldScale
    	return math.floor(2048.0 / scale)
	end,
	setupSpriteFrame = function(self, frameName, node, characterSheetInfo, spriteAtlas, geometry)
		for k,v in pairs(characterSheetInfo) do
			if v:getFrameIndex(frameName) then
				local frameIndex = v:getFrameIndex(frameName)
				local width = v:getSheet().frames[frameIndex].width - 2
				local height = v:getSheet().frames[frameIndex].height - 2
				local divisor = self:getGameViewDivisor()
				local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )

				node:addGeometry(geometry[k])

				node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas[k], frameName, false)
				node:getGeometry():setDimensions(node, dimSprite)
			end
		end
	end,
	getSpriteAlasFromFrameName = function(self, frameName, spriteAtlasArray)
		for k, v in pairs(spriteAtlasArray) do
			print(k)
			print(v)
			print('end')
		end
	end

}

return ParamInfo
