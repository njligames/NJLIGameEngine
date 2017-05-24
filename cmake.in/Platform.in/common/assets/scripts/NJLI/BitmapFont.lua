local BitmapFont = {}
BitmapFont.__index = BitmapFont

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor()
-- __dtor()
-- __load()
-- __unLoad()
--#############################################################################

local __ctor = function(self, init)
    assert(init, "init variable is nil.")
    assert(type(init) == "table", "Init variable is expecting a states table")
    assert(init.file ~= nil, "init.file is nil, expecting a *.fnt file")

    self._fntFile = init.file

    self._material = njli.Material.create()
    self._shader = njli.ShaderProgram.create()
    self._geometry = njli.Sprite2D.create()

    self._geometry:setMaterial(self._material)
    self._geometry:setShaderProgram(self._shader)

    self._font = nil
end

local __dtor = function(self)
  self._geometry:removeShaderProgram(self._shader)
  self._geometry:removeMaterial(self._material)
  
  njli.Sprite2D.destroy(self._geometry)
  self._geometry = nil
  
  njli.ShaderProgram.destroy(self._shader)
  self._shader = nil
  
  njli.Material.destroy(self._material)
  self._material = nil
end

local __load = function(self)
    local baseFontPath = "fonts/"
    local baseImagePath = "images/generated/"


    local fntFile = self._fntFile
    local path = nil

    local function loadFont( fntFile, path)
        local function extract( s, p )
            return string.match( s, p ), string.gsub( s, p, '', 1 )
        end
        local path = path or ""
        local font = { info = {}, spritesheets = {}, sprites = {}, chars = {}, kernings = {} }
        -- local readline = io.lines( system.pathForFile( path .. fntFile, system.ResourceDirectory ) )
        local fullPath = njli.ASSET_PATH(baseFontPath .. fntFile)
        assert(fullPath, "There is no file: " .. baseFontPath .. fntFile)

        local readline = io.lines(fullPath)
        for line in readline do
            local t = {}; local tag;
            tag, line = extract( line, '^%s*([%a_]+)%s*' )
            while string.len( line ) > 0 do
                local k, v
                k, line = extract( line, '^([%a_]+)=' )
                if not k then
                    break
                end
                v, line = extract( line, '^"([^"]*)"%s*' )
                if not v then
                    v, line = extract( line, '^([^%s]*)%s*' )
                end
                if not v then
                    break
                end
                t[ k ] = v
            end
            if tag == 'info' or tag == 'common' then
                for k, v in pairs( t ) do font.info[ k ] = v end
            elseif tag == 'page' then
                font.spritesheets[ 1 + t.id ] = { file = t.file, frames = {} }
            elseif tag == 'char' then
                t.letter = string.char( t.id )
                font.chars[ t.letter ] = {}
                for k, v in pairs( t ) do font.chars[ t.letter ][ k ] = v end
                if 0 + font.chars[ t.letter ].width > 0 and 0 + font.chars[ t.letter ].height > 0 then
                    font.spritesheets[ 1 + t.page ].frames[ #font.spritesheets[ 1 + t.page ].frames + 1 ] = {
                        --textureRect = { x = 0 + t.x, y = 0 + t.y, width = -1 + t.width, height = -1 + t.height }, --CLF removed the -1, it was causing issues with fonts with borders
                        textureRect = { x = 0 + t.x, y = 0 + t.y, width = t.width, height = t.height },
                        spriteSourceSize = { width = 0 + t.width, height = 0 + t.height },
                        spriteColorRect = { x = 0, y = 0, width = -1 + t.width, height = -1 + t.height },
                        spriteTrimmed = true
                    }
                    font.sprites[ t.letter ] = {
                        spritesheet = 1 + t.page,
                        frame = #font.spritesheets[ 1 + t.page ].frames
                    }
                end
            elseif( tag == 'kerning' ) then
                font.kernings[ string.char( t.first ) .. string.char( t.second ) ] = 0 + t.amount
            end
        end
        for k, v in pairs( font.spritesheets ) do
            -- font.spritesheets[ k ].sheet = sprite.newSpriteSheetFromData( path..v.file, v )
        end
        for k, v in pairs( font.sprites ) do
            -- font.sprites[ k ] = sprite.newSpriteSet( font.spritesheets[ v.spritesheet ].sheet, v.frame, 1 )
        end
        return font
    end

    local font = loadFont(self._fntFile)

    njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", self._shader)

    local imagePath = baseImagePath .. font.spritesheets[1].file
    assert(imagePath, "There is no file: " .. imagePath)
    local image = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
    self._geometry:getMaterial():getDiffuse():loadGPU(image)
    njli.Image.destroy(image)
    image = nil

    self._font = font
end

local __unLoad = function(self)
  self._font = nil
end

--#############################################################################

function BitmapFont:printf(text)
    local font = self._font
    local geometry = self._geometry

    local function Count_Substring( s1, s2 )
        local magic = "[%^%$%(%)%%%.%[%]%*%+%-%?]"
        local percent = function(s)return "%"..s end
        return select( 2, s1:gsub( s2:gsub(magic,percent), "" ) )
    end

    local mainNode = njli.Node.create()
    mainNode:setName(text)

    local t =
    {
        raw_font = font,
        raw_text = text,
    }

    local rect =
    {
        0, 0, 0, 0
    }

    local numLines = tonumber(Count_Substring( text, "\n" )) + 1
    local oldAlign = ( t.align or 'left' )
    t.align = 'left'
    local x = 0; local y = -(numLines - 1) * t.raw_font.info.lineHeight
    local last = ''; local xMax = 0; local yMax = numLines * t.raw_font.info.lineHeight
    if t.raw_font then
        for c in string.gmatch( t.raw_text..'\n', '(.)' ) do
            if c == '\n' then
                x = 0; y = y + t.raw_font.info.lineHeight
            elseif c == '\t' then
                local numSpaces = 4
                c = " "

                for i=1,numSpaces do
                    if 0 + t.raw_font.chars[ c ].width > 0 and 0 + t.raw_font.chars[ c ].height > 0 then
                        local node = njli.Node.create()
                        node:setName(c)
                        node:setGeometry(geometry)

                        local letter = {}

                        if t.raw_font.kernings[ last .. c ] then
                            x = x + font.kernings[ last .. c ]
                        end

                        letter.anchorX = 0
                        letter.anchorY = 0

                        letter.x = t.raw_font.chars[ c ].xoffset + x
                        letter.y = (t.raw_font.info.lineHeight - t.raw_font.chars[ c ].yoffset) - t.raw_font.chars[ c ].height - (t.raw_font.info.lineHeight - t.raw_font.info.base) - y

                        geometry:setSpriteAtlasFrame(node,
                            t.raw_font.chars[ c ].x,
                            t.raw_font.chars[ c ].y,
                            t.raw_font.chars[ c ].width,
                            t.raw_font.chars[ c ].height)
                        geometry:setDimensions(node,
                            bullet.btVector2( t.raw_font.chars[ c ].width*2, t.raw_font.chars[ c ].height*2),
                            bullet.btVector2( letter.anchorX, letter.anchorY ))

                        node:setOrigin(bullet.btVector3(letter.x, letter.y, 0))

                        mainNode:addChildNode(node)

                        last = c
                    end
                    x = x + t.raw_font.chars[ c ].xadvance + (t.raw_font.info.outline or 0)
                    if x >= xMax then
                        xMax = x
                    end
                end
            elseif t.raw_font.chars[ c ] then
                local rfc = t.raw_font.chars[ c ]

                if 0 + t.raw_font.chars[ c ].width > 0 and 0 + t.raw_font.chars[ c ].height > 0 then
                    local node = njli.Node.create()
                    node:setName(c)
                    node:setGeometry(geometry)

                    local letter = {}

                    if t.raw_font.kernings[ last .. c ] then
                        x = x + font.kernings[ last .. c ]
                    end

                    letter.anchorX = 0
                    letter.anchorY = 0

                    letter.x = t.raw_font.chars[ c ].xoffset + x
                    letter.y = (t.raw_font.info.lineHeight - t.raw_font.chars[ c ].yoffset) - t.raw_font.chars[ c ].height - (t.raw_font.info.lineHeight - t.raw_font.info.base) - y

                    geometry:setSpriteAtlasFrame(node,
                        t.raw_font.chars[ c ].x,
                        t.raw_font.chars[ c ].y,
                        t.raw_font.chars[ c ].width,
                        t.raw_font.chars[ c ].height)
                    geometry:setDimensions(node,
                        bullet.btVector2( t.raw_font.chars[ c ].width*2, t.raw_font.chars[ c ].height*2),
                        bullet.btVector2( letter.anchorX, letter.anchorY ))

                    node:setOrigin(bullet.btVector3(letter.x, letter.y, 0))

                    mainNode:addChildNode(node)

                    last = c
                end
                x = x + t.raw_font.chars[ c ].xadvance + (t.raw_font.info.outline or 0)
                if x >= xMax then
                    xMax = x
                end
            end
        end

        rect =
        {
            x=x, y=(yMax-y), width=xMax, height=yMax
        }
    end

    return mainNode, rect
end


function BitmapFont:hide(camera)
    if nil ~= self._geometry then
        self._geometry:hide(camera)
    end
end

function BitmapFont:show(camera)
    if nil ~= self._geometry then
        self._geometry:show(camera)
    end
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BitmapFont, {
        __call = function (cls, ...)
            local self = setmetatable({}, cls)
            self:_create(...)
            return self
        end,
    })

function BitmapFont:className()
    return "BitmapFont"
end

function BitmapFont:class()
    return self
end

function BitmapFont:superClass()
    return nil
end

function BitmapFont:isa(theClass)
    local b_isa = false
    local cur_class = theClass:class()
    while ( nil ~= cur_class ) and ( false == b_isa ) do
        if cur_class == theClass then
            b_isa = true
        else
            cur_class = cur_class:superClass()
        end
    end

    return b_isa
end

function BitmapFont:__gc()
    BitmapFont._destroy(self)
end

function BitmapFont:__tostring()
    local ret = self:className() .. " =\n{\n"

    for pos,val in pairs(self) do
        ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
    end

    return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BitmapFont:_destroy()
    assert(not self.__BitmapFontCalledLoad, "Must unload before you destroy")

    __dtor(self)
end

function BitmapFont:_create(init)
    self.__BitmapFontCalledLoad = false

    __ctor(self, init)
end

function BitmapFont:load()
    __load(self)

    self.__BitmapFontCalledLoad = true
end

function BitmapFont:unLoad()
    assert(self.__BitmapFontCalledLoad, "Must load before unloading")

    __unLoad(self)
    self.__BitmapFontCalledLoad = false
end

return BitmapFont
