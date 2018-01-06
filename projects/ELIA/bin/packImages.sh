#ROOT_NAME="interface"
ROOT_NAME=${1}
TRIM=${2}

#None       
#Trim       
#Crop       
#CropKeepPos
#Polygon    

COMMON_DIR=..
INPUT_IMAGE_FOLDER="${COMMON_DIR}/${ROOT_NAME}/TexturePacker"
OUTPUT_SHEET_FOLDER="${COMMON_DIR}/assets/images"
OUTPUT_DATA_FOLDER="${COMMON_DIR}/gameplay_scripts/yappybirds_game/scripts/generated"

FORMAT="corona-imagesheet"
#TEXTURE_FORMAT="pvr3"
TEXTURE_FORMAT="png"
#SHEET_EXTENSION="pvr"
SHEET_EXTENSION="png"
#--mipmap-min-size 1 --png-opt-level 7
/Applications/TexturePacker.app/Contents/MacOS/TexturePacker --opt RGBA8888  --reduce-border-artifacts  --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode ${TRIM} --force-publish --data ${OUTPUT_DATA_FOLDER}/${ROOT_NAME}{n}.lua --format ${FORMAT} --sheet ${OUTPUT_SHEET_FOLDER}/${ROOT_NAME}{n}.${SHEET_EXTENSION} --texture-format "${TEXTURE_FORMAT}" ${INPUT_IMAGE_FOLDER}

>&2 echo "Flipping the images, vertically..."
for i in $(find $OUTPUT_SHEET_FOLDER -type f -name "${ROOT_NAME}*.png" )
do
    convert $i -flip $i
    >&2 echo "Flipping ${i}"
done 

>&2 echo "Compressing the images..."
for i in $(find $OUTPUT_SHEET_FOLDER -type f -name "${ROOT_NAME}*.png" )
do
    PNGFILE=$i
    PVRFILE=${i/.png/.pvr}
    >&2 echo "Compressing ${PNGFILE} to ${PVRFILE}"

    #/Applications/Imagination/PowerVR_Graphics/PowerVR_Tools/PVRTexTool/CLI/OSX_x86/PVRTexToolCLI -i ${PNGFILE} -m -f PVRTC1_4_RGB,UB,lRGB -q pvrtcbest -o ${PVRFILE}
done 



















: <<'END'

TexturePacker - 4.0.1
(c) 2014 by CodeAndWeb GmbH - www.codeandweb.com
Licensed to:            James Folk
Updates included until: 2016-01-23

Usage: TexturePacker [options] [<*.png|gif|tif|jpg|swf|...>] [<imagefolder>] [<*.tps>*] 

You can specify one or more .png or .tps files or directories for processing.
   <folder>                     Recursively adds all known files in the sprite sheet
   <*.tps>                      *.tps file created with TexturePackerPro (requires pro license)
                                Additional set options override settings in the *.tps file
   <*.swf>                      Flash requires pro license
   <images>                     Image formats, supported: 
                                     bmp       Bitmap
                                     gif       Graphics Interchange Format
                                     ico       Icon (Windows)
                                     jpeg      Joint Photographic Experts Group
                                     jpg       Joint Photographic Experts Group
                                     mng       Multiple-image Network Graphics
                                     pbm       Portable Bitmap
                                     pgm       Portable Gray Map
                                     pkm       PKM file format (etc1)
                                     png       Portable Network Graphics
                                     ppm       Netpbm color image format
                                     psd       Photoshop image format
                                     pvr       PowerVR image format
                                     pvr.ccz   PowerVR image format (zlib)
                                     pvr.gz    PowerVR image format (gz)
                                     pvrtc     PowerVR image format
                                     svg       Scalable Vector Graphics
                                     svgz      Scalable Vector Graphics
                                     swf       Flash
                                     tga       Targa image format
                                     tif       Tagged Image File Format
                                     tiff      Tagged Image File Format
                                     webp      WebP format
                                     xbm       X Bitmap
                                     xpm       X Pixmap

Options:
  --help                        Display help text
  --version                     Print version information
  --gui                         Launch in with graphical user interface

  Output:
  --sheet <filename>            Name of the sheet to write, see texture-format for formats available
  --texture-format <id>         Sets the format for the textures.
                                The format type is automatically derived from the sheet's file name
                                if possible.
                                Available formats:
                                    png               PNG (32bit)
                                    pvr3              PowerVR Texture Format, PVR Version 3
                                    pvr3gz            PowerVR Texture Format, PVR Version 3, compressed with gzip
                                    pvr3ccz           PowerVR Texture Format, PVR Version 3, compressed with zlib, cocos2d header
                                    jpg               JPG image format, lossy compression, no transparency
                                    bmp               24 bit BMP
                                    tga               Targa Image Format
                                    tiff              Tagged Image File Format
                                    pkm               PKM image format, ETC1 compression
                                    ppm_ascii         Netpbm color image format, ascii version
                                    ppm_binary        Netpbm color image format, binary version
                                    webp              WebP lossless / lossy format
                                    atf               Adobe Texture Format
                                    pvr2              PowerVR Texture Format, PVR Version 2, deprected
                                    pvr2gz            PowerVR Texture Format, PVR Version 2, compressed with gzip, deprected
                                    pvr2ccz           PowerVR Texture Format, PVR Version 2, compressed with zlib, cocos2d header, deprected

  --format <format>             Format to write, default is cocos2d
                                Available formats:
                                    2dtoolkit           2D Toolkit exporter
                                    andengine           Format for AndEngine
                                    agk                 Format for AppGameKit
                                    batterytech         BatteryTech Exporter
                                    bhive               Format for BHive
                                    caat                Exporter for CAAT - the Canvas Advanced Animation Toolkit
                                    cegui               Format for CEGUI / OGRE
                                    cocos2d             plist format version 3 for cocos2d
                                    cocos2d-v2          old plist format version 2 for cocos2d (deprecated)
                                    cocos2d-x           plist format version 3 for cocos2d-x with polygon packing
                                    corona-imagesheet   Exporter for Corona(TM) SDK using new image sheet format.
                                    css                 css format for web design
                                    easeljs             Exporter for EaselJS.
                                    gideros             Format for Gideros
                                    json-array          Text file for json/html as array
                                    json                Text file for json/html as hash
                                    kwik                Exporter for Kwik using new image sheet format.
                                    less                Creates a LESS file that can be incorporated into a sprites arrangement
                                    libgdx              text file for lib GDX
                                    libRocket           Exporter to demonstrate how to crate your own exporters
                                    melonjs             Data file for MelonJS
                                    moai                Format for Moai
                                    molecule            Exporter for Molecule Framework
                                    monogame            Input format for the MonoGame TexturePacker Importer
                                    orx                 Orx Exporter
                                    panda               Exporter for Panda Engine
                                    phaser-json-array   JSON array data for Phaser
                                    phaser-json-hash    JSON hash data for Phaser
                                    pixijs              Data file for PixiJS
                                    sass-mixins         Exporter for SASS.
                                    shiva3d-jpsprite    Shiva3D with JPSprite extension
                                    shiva3d             Exporter for Shiva3D.
                                    slick2d             Format for Slick2D
                                    sparrow             xml file for Sparrow/Starling SDK
                                    spine               text file for Spine
                                    spritesheet-only    Exports only the sprite sheet without data file
                                    spritekit           plist format for SpriteKit, Objective-C header file
                                    spritekit-swift     plist format for SpriteKit, with swift class file
                                    spriter             JSON file for Spriter
                                    spritestudio        OPTPiX SpriteStudio 5 CellMap File.
                                    tresensa            Exporter for TreSensa TGE.
                                    uikit               Exporter for UIKit
                                    unity               Text file for Unity(R), json format with .txt ending
                                    unity-texture2d     Input format for the Unity(R) TexturePacker Importer
                                    unreal-paper2d      Format for UnrealEngine / Paper2d
                                    vplay               JSON file for V-Play engine
                                    wave-engine-1       WaveEngine Sprite Sheet
                                    x2d                 Export to x2d engine format.
                                    xml                 Generic XML format
                                    plain               Exporter to demonstrate how to crate your own exporters

  --data <filename>             Name of the data file to write

  --class-file <filename>       Name of the class output file (spritekit-swift)

  --classfile-file <filename>   Name of the classfile output file (monogame)

  --header-file <filename>      Name of the header output file (spritekit, plain)

  --java-file <filename>        Name of the java output file (andengine)

  --force-publish               Ignore smart update hash and force re-publishing of the files
  --auto-sd                     Automatically creates additional standard definition file (50% scale)
                                Requires data and texture file name to end with @2x or -hd
                                e.g. sheet-hd.plist 
                                This is a convenience function for compatibility with TexturePacker 2.x.x
                                For more powerful options see section AutoSD below
  --texturepath <path>          Adds the path to the texture file name stored in the data file.
                                Use this if your sprite sheets are not stored in another folder than your data files.
  --trim-sprite-names           Removes .png, .bmp and .jpg from sprite names
  --prepend-folder-name         Adds the smart folders name to the sprite names
  --replace <regexp>=<string>   Replaces matching parts of the sprite's name with <string>
                                Uses full regular expressions, make sure to escape the expression
  --ignore-files <wildcard>     Ignores all images fitting the given pattern (may be used several times)
                                You can use * and ?, make sure to escape the wildcards when working with bash

  AutoSD:
  --variant <expr>              Adds an AutoSD-Variant. Format of the expr 
                                <scale>:<name>[:<filter>[:allowfraction][:<width>:<height>]]
                                   <scale>          floating point value, e.g. 0.5
                                   <name>           name of the variant, used to replace {v} in file names, e.g. @2x
                                   <filter>         only sprites which match this filter will be added to the variant
                                   allowfraction    allow floating point values for this scaling if no common
                                                    base factor can be calculated (force identical layout)
                                   <width>:<height> optional maximum size of the texture, if not set the
                                                    maximum texture size will be used (default: 2048x2048)
  --force-identical-layout      Preserves the layout across multiple AutoSD variants
                                Might require enabling allowfraction on some variants if no common
                                base factor can be derived

  Algorithm settings:
  --algorithm <name>            Choose algorithm
                                    MaxRects        Powerful packing algorithm (extended)
                                    Basic           Simple algorithm for tilemaps and atlases (free)
                                    Polygon         Tight polygon packing
    MaxRects
      --maxrects-heuristics     Heuristic for MaxRects algorithm
                                    Best              Best
                                    ShortSideFit      ShortSideFit
                                    LongSideFit       LongSideFit
                                    AreaFit           AreaFit
                                    BottomLeft        BottomLeft
                                    ContactPoint      ContactPoint

    Basic
      --basic-sort-by           Sort order for the sprite list
                                    Best              Best
                                    Name              Name
                                    Width             Width
                                    Height            Height
                                    Area              Area
                                    Circumference     Circumference
      --basic-order             Sorting direction
                                    Ascending         Ascending
                                    Descending        Descending


  Dimensions and layout:
  --width <int>                 Sets fixed width for texture
  --height <int>                Sets fixed height for texture
  --max-width <int>             Sets the maximum width for the texture in auto size mode, default is 2048
  --max-height <int>            Sets the maximum height for the texture in auto size mode, default is 2048
  --max-size <int>              Sets the maximum width and height for the texture in auto size mode, default is 2048
  --size-constraints <value>    Restrict sizes
                                    POT               Power of 2 (2,4,8,16,32,...)
                                    AnySize           Any size
  --force-squared               Force squared texture
  --force-word-aligned          Forces word alignment of the texture
  --pack-mode <mode>            Optimization mode: Fast, Good, Best
  --multipack                   Create multiple sprite sheets if not all sprites match into a single one
  --common-divisor-x <int>      Resizes sprites - widths will be divisible by this value
  --common-divisor-y <int>      Resizes sprites - heights will be divisible by this value

  Padding and rotation:
  --shape-padding <int>         Sets a padding around each shape, value is in pixels, default is 2
  --border-padding <int>        Sets a padding around each the border, value is in pixels, default is 2
  --padding <int>               Sets a padding around each shape, and to the border, value is in pixels, default is 2
  --enable-rotation             Enables rotation of sprites (overriding file format's defaults)
  --disable-rotation            Disables rotation of sprites (overriding file format's defaults)
  --trim-mode <value>           Remove transparent parts of a sprite to shrink atlas size and speed up rendering
                                    None              Keep transparent pixels
                                    Trim              Remove transparent pixels, use original size.
                                    Crop              Remove transparent pixels, use trimmed size, flush position.
                                    CropKeepPos       Remove transparent pixels, use trimmed size, keep position.
                                    Polygon           Approximate sprite contour with polygon path.
  --trim-threshold <int>        Trim alpha values under the threshold value 1..255, default is 1
  --trim-margin <int>           Transparent margin which is left over after trimming, default is 0
  --tracer-tolerance <int>      Deviation of the polygon approximation from the exact sprite outline, default is 200
  --disable-auto-alias          Disables automated alias creation
  --disable-clean-transparency  Keep color channels of transparent pixels

  Graphics optimization (extended only):
  --opt <pixelformat>           Optimized output for given pixel formats. Supported formats are:
                                    RGBA8888          32bit, 8bit/channel, 8bit transparency
                                    BGRA8888          32bit, 8bit/channel, 8bit transparency
                                    RGBA4444          16bit, 4bit/channel, 4bit transparency
                                    RGB888            24bit, 8bit/channel, no transparency
                                    RGB565            16bit, 5bit red, 6bit green, 5bit blue, no transparancy
                                    RGBA5551          16bit, 5bit/channel, 1bit transparancy
                                    RGBA5555          20bit, 5bit/channel, 5bit transparancy
                                    PVRTC2            PVRTC compression, 2bit per pixel, (PVR + ATF files)
                                    PVRTC4            PVRTC compression, 4bit per pixel, (PVR + ATF files)
                                    PVRTC2_NOALPHA    PVRTC compression, 2bit per pixel, (PVR + ATF files)
                                    PVRTC4_NOALPHA    PVRTC compression, 4bit per pixel, (PVR + ATF files)
                                    ALPHA             8bit transparency
                                    ALPHA_INTENSITY   8bit intensity, 8bit transparency
                                    ETC1              ETC1 compression (ATF + PKM files)
                                    ETC1_ALPHA        ETC1 RGB + ETC1 Alpha (ATF file)
                                    DXT1              Compressed with DXT1, no transparency (ATF file)
                                    DXT5              Compressed with DXT5, transparency (ATF file)
                                    ATF_NOALPHA       ETC1+DXT1+PVRTC4, no transparency (ATF file)
                                    ATF_ALPHA         ETC1/ETC1+DXT5+PVRTC4, no transparency (ATF file)
                                    INDEXED           INDEXED (8Bit, pngquant)
  --dither-type <dithertype>    Dithering to improve quality of color reduced images
                                    NearestNeighbour  no dithering
                                    Linear            no dithering
                                    FloydSteinberg    Floyd Steinberg, no alpha
                                    FloydSteinbergAlpha Floyd Steinberg, with alpha
                                    Atkinson          Atkinson, no alpha
                                    AtkinsonAlpha     Atkinson, alpha
                                    PngQuantLow       Index color format only: minimum dithering
                                    PngQuantMedium    Index color format only: medium dithering
                                    PngQuantHigh      Index color format only: strong dithering
  --background-color <rrggbb>   Set solid background color, default is none, which is transparent
                                The value is a tuple of 3 hexadezimal digit pairs, each pair represents
                                a color channel in order red, green, blue, E.g. ff0000 for red, ffffff for white
  --jpg-quality <value>         Sets the quality for jpg export: -1 for default, 0..100 where 0 is low quality
  --flip-pvr                    Flips PVR files vertically (used for unity framework)
  --pvr-quality <value>         Set quality for PVRTC codecs
                                   verylow - low quality, fast
                                   low
                                   normal
                                   high
                                   best     - best quality, very slow (default)
  --etc1-quality <value>        Set quality for ETC1 compression: low, low-perceptual (default), high, high-perceptual
  --dxt-mode <value>            DXT1/5 compression mode: linear, perceptual
  --jxr-color-mode <value>      Color sampling mode for JXR compression: YUV444, YUV422, YUV420
  --jxr-compression <value>     Compression level for JXR. 0=lossless, 1..100 lossy compression
  --jxr-trim-flexbits <value>   Number of flexbits to trim, 0 (default) .. 15
  --compress-atf                Adds JXR compression after ETC1/PVRTC/DXT - might be incompatible with some devices
  --mipmap-min-size <value>     Minimum size of the mipmaps to create, default 32768, ATF only
  --premultiply-alpha           Premultiply alpha values (shoud be used with PVRs for cocos2d)
  --dpi <value>                 Set dpi for output image (default is 72)
  --heuristic-mask              Removes equal colored pixels from the border of sprites. Creating a transparency mask 
                                on sprites which use one unique color as transparent color.
  --png-opt-level <value>       Optimization level for pngs (0=off, 1=use 8-bit, 2..7=png-opt)
  --webp-quality <value>        Quality level for WebP format (0=low, 100=high, >100=lossless), default is lossless
  --content-protection <key>    Content protection: Encrypt pvr.ccz files.
                                Key: 128 bit, 32 hex digits [A-F0-9]

  --reduce-border-artifacts     Removes dark shadows around sprites
  --extrude <int>               Extrudes the sprites by given value of pixels to fix flickering problems in tile maps
  --scale <float>               Scales all images before creating the sheet. E.g. use 0.5 for half size
  --scale-mode <mode>           Use mode for scaling:
                                    Smooth            Smooth
                                    Fast              Fast (Nearest Neighbor)
                                    Scale2x           Scale2x (fixed 2x upscaling)
                                    Scale3x           Scale3x (fixed 3x upscaling)
                                    Scale4x           Scale4x (fixed 4x upscaling)
                                    Eagle             Eagle2x (fixed 2x upscaling)
                                    Hq2x              Hq2x (fixed 2x upscaling)

  Normal maps:
  --pack-normalmaps             Packs normal maps on separate sheet, with same layout as sprites
  --normalmap-filter <string>   Sprites with file paths containing this string are treated as normal maps
  --normalmap-suffix <string>   Suffix which is added to a sprite name to find the corresponding normal map
  --normalmap-sheet <filename>  File to which the normal map sprite sheet is written

  Additional settings for AndEngine:
  --andengine-packagename <name>         Package name for the java definitions
  --andengine-wraps <Clamp|Repeat>       Texture wrapping parameter (see opengl/andengine documentation)
  --andengine-wrapt <Clamp|Repeat>       Texture wrapping parameter (see opengl/andengine documentation)
  --andengine-minfilter <name>           Min filter (Nearest, Linear, LinearMipmapLinear, LinearMipmapNearest, NearestMipmapLinear, NearestMipmapNearest)
  --andengine-magfilter <name>           Mag filter (MagNearest, MagLinear)

  Debugging:
  --shape-debug                 Creates boxes around shapes for debugging
  --verbose                     Be verbose
  --quiet                       No output except for errors

  License management:
  --license-info                Prints information about the currently installed license
  --activate-license <key>      Activate a license key


Examples:

  TexturePacker assets
        creates out.plist (cocos2d) and out.png from all png files in the 'assets' directory
        trimming all files and creating a texture with max. 2048x2048px 

  TexturePacker --data main-hd.plist --format cocos2d --sheet main-hd.png assets
        same as above, but with output files main-hd.plist, main-hd.png

  TexturePacker --scale 0.5 --max-size 1024 --data main.plist --format cocos2d --sheet main.png assets
        creates main.plist and main.png from all files in assets
        scaling all images to 50%, trimming all files and creating 
        a texture with max. 1024x1024px 

  TexturePacker --variant 1:-hd --variant 0.5: --data main{v}.plist --sheet main{v}.png --format cocos2d assets
        combines the two TexturePacker calls shown above: it creates variants with scaling
        factors 1.0 and 0.5, and stores them in main.plist/png and main-hd.plist/png
        ({v} is replaced by variant name)

  TexturePacker --variant 1:-hd:@2x --variant 1: --data main{v}.plist --sheet main{v}.png --format cocos2d assets
        similar to the example before, but TexturePacker expects that you already provide sprites
        named like 'a.png', 'b.png', 'a@2x.png', 'b@2x.png'. It selects the '@2x' sprites and put them
        on the 'main-hd' sprite sheet, and the other ones on the 'main' sprite sheet.

  TexturePacker --data main.atlasc --format spritekit assets
        the SpriteKit exporter uses variant filters by default, and puts sprites with the following suffixes
        to separate sprite sheets:
        '~iphone', '~ipad', '@2x~iphone', '@2x~ipad', '@2x', '@3x~iphone', '@3x', all remaining sprites



















PVRTexToolCL version 4.16
SDK Version: 16.1@3959323
PVRTexLib 4.16 | JpegLib version 8` | LibPNG version 1.5.12

Valid arguments:
-i [filepath],<additionalfiles...>
-o <filepath>
-d <filepath>
-cube <faceorder>
-array 
-pad [2|4|8]
-legacypvr 
-r [width],[height]
-square <+|->
-pot <+|->
-rfilter [nearest|linear|cubic]
-rotate [z],<+|->
-flip [x|y],<"flag">
-b <width>,<height>
-p 
-l 
-n [scale],<channelorder>
-m <numberofmipmaps>
-mfilter ['nearest'|'linear'|'cubic']
-c 
-f [format],<variabletype>,<colourspace>
-q ['pvrtcfastest'|'pvrtcfast'|'pvrtcnormal'|'pvrtchigh'|'pvrtcbest'|'etcfast'|'etcslow'|'etcfastperceptual'|'etcslowperceptual'|'astcveryfast'|'astcfast'|'astcmedium'|'astcthorough'|'astcexhaustive']
-dither 
-shh 
-help <commandargument>
-red [filename],<channelname>
-green [filename],<channelname>
-blue [filename],<channelname>
-alpha [filename],<channelname>
-diff [filename],<mode>,<modifier>
-rcanvas [width],[height]
-squarecanvas <+|->
-potcanvas <+|->
-offsetcanvas [xoffset],[yoffset]
-centrecanvas 


Input File: 
REQUIRED
Set the input file or files. Must be a JPEG, PNG, BMP, PVR, KTX, DDS or ASTC file. If either the cube map or texture array flag is set, multiple files should be explicitly specified.
Usage
	-i [filepath],<additionalfiles...>
Example
	-i picture.jpg, otherpicture.png

Output File: 
Set the output file destination. If specified, must be a PVR, H, KTX or DDS file. Otherwise will output a file with the same name as the first input file. If the input file was also a .pvr file, the name will have ".Out" inserted before the file extension. 
Usage
	-o <filepath>
Example
	-o texture.pvr

Decompress Output: 
Whether or not to save a decompressed file alongside the input. A filename can be specified which must be a JPEG, PNG or BMP. Otherwise will decompress to a file with the same name as the first input file, but with '.Out' inserted between the name and the extension. For cubemaps and texture arrays, behaviour is special - a series of files are output in the following format: <Name>.Face<FaceNumber>.Array<ArrayNumber>.<Extension> - e.g. Texture.Out.Face1.Array12.png
Usage
	-d <filepath>
Example
	-d decompressed.png

Cube Map: 
Will construct a cube map from available input files. If present, the input file argument must contain at least 6 textures, or a multiple of 6 textures if the array flag is present. Textures of different sizes will all be resized with a linear filter into the size of the original texture, or the specified size if resizing.
Usage
	-cube <faceorder>
Example
	-cube +X,-X,+Y,-Y,+Z,-Z

Texture Array: 
Will construct a texture array from available input files. If present, the input file argument should contain multiple files, or a multiple of 6 textures if the cube map flag is present.
Usage
	-array 
Example
	-array 

Pad Meta Data: 
Will add padding to the meta data, so that the texture data sits on a 2,4 or 8 byte boundary, according to the parameter specified. Must have a parameter in the form of an integer, valid values are 2,4 or 8.
Usage
	-pad [2|4|8]
Example
	-pad 4

Legacy PVR: DEPRECATED 
Will force the output file to be saved out as a legacy PVR file (PVR v2) for backwards compatibility purposes.
Usage
	-legacypvr 
Example
	-legacypvr 

Resize: 
Resizes a texture to the given size. Accepts two unsigned integer parameters - width and height. Values up to 8192x8192 are supported. Option is incompatible with Square or Power of Two resize options.
Usage
	-r [width],[height]
Example
	-r 512,256

Resize Square: 
Forces the texture into a square. A single character parameter, '-' or '+', can be specified to specify whether it is resized smaller(-) or larger(+). Incompatible with standard resize.
Usage
	-square <+|->
Example
	-square +

Resize Power of Two: 
Forces the texture into power of two dimensions. A single character parameter, '-' or '+', can be specified to specify whether it is resized smaller(-) or larger(+). Incompatible with standard resize.
Usage
	-pot <+|->
Example
	-pot +

Resize Filter: 
By default, a linear filter is used to resize textures. Setting this flag to 'nearest','linear' or 'cubic' will force it to use the specified filter instead.Usage
	-rfilter [nearest|linear|cubic]
Example
	-rfilter cubic

Rotate: 
Rotate the texture around a given axis 'x','y' or 'z'. Currently only 'z' is supported - this is a standard 2D rotate. Also requires a second argument '-' or '+' to choose the rotate direction. In the context of a 2D rotation, + is clockwise, - is anti-clockwise.
Usage
	-rotate [z],<+|->
Example
	-rotate z,+

Flip: 
Flips the texture over a given axis 'x', 'y', or 'z'. Currently only 'x' and 'y' are supported providing a standard 2D flip. Also accepts an optional second argument, "flag", that adds meta-data to the texture marking it as being flipped.  This is useful when knowledge of the orientation is required ahead of time.  For example, displaying a flipped texture in its original orientation.
Usage
	-flip [x|y],<"flag">
Example
	-flip y,flag

Add Border: 
Adds a mirrored border to the texture. If no arguments are specified, PVRTexTool will choose an appropriate border size for the texture. Alternative, border sizes can be chosen manually for the width and height. Specifying just the width is allowed, and will result in the vertical border having a height of 0.
Usage
	-b <width>,<height>
Example
	-b 4,4

Pre-Multiply Alpha: 
Pre-Multiplies the texture by its alpha value.
Usage
	-p 
Example
	-p 

Alpha Bleed: 
Discards any data in fully transparent areas to optimise the texture for better compression.
Usage
	-l 
Example
	-l 

Normal Map Generation: 
Using the input texture as a height map (by creating an intensity texture from the r,g and b channels), will generate a normal map. Accepts two arguments: A positive float which determines the scale that the height map is assumed to be on, and a string of a combination of the four characters 'x','y','z' and 'h'. These specify the channel order as saved out into the texture. x,y and z specify these components, and h specifies the original height value used. Duplicate channels are not allowed, but channels can be missed off. This argument is optional, and will default to 'xyz'.
Usage
	-n [scale],<channelorder>
Example
	-n 1.0,xyzh

MIP-Map Generation: 
Generates MIP-Maps for the current texture. An optional unsigned integer can be added to specify the number of MIP Map levels which should be generated, otherwise a full chain are created.
Usage
	-m <numberofmipmaps>
Example
	-m 9

MIP-Map Filter: 
By default, a linear filter is used to generate MIP-Maps. Setting this flag to 'nearest','linear' or 'cubic' will force it to use the specified filter instead.
Usage
	-mfilter ['nearest'|'linear'|'cubic']
Example
	-mfilter cubic

Colour MIP-Maps: 
Saturates the tail of the MIP-Map chain with colours for debugging purposes - if you never see the original colour of a texture, then you know it's using MIP-Maps at all times and some upper levels can be removed from the texture to reduce memory consumption.
Usage
	-c 
Example
	-c 

Encode Format: 
REQUIRED
Sets the format to encode to. 
First argument (required) is the format, which can be either a compressed format (see Usage for a list) or a non-compressed format in the form 'r8g8b8a8'. Any number of channels up to 4 can be specified, but must be matched with a size (in bits) at all times. Valid channel names are 'r','g','b','a','i','l' or 'x'. Valid sizes range from 1 to 32, but the total of all sizes must be a multiple of 8 (byte aligned).
The second argument is the channel type. This is optional - defaults to Normalised Unsigned Byte. Specifying a type is generally not required for compressed formats, but generally is for uncompressed formats. See usage table for valid values. 
The third and final argument specifies the colour space, which will accept either sRGB or lRGB - default is lRGB for linear rgb.
Usage
	-f [format],<variabletype>,<colourspace>
Example
	-f PVRTC1_2,UBN,lRGB 

-Valid Formats: PVRTC1_2, PVRTC1_4, PVRTC1_2_RGB, PVRTC1_4_RGB, PVRTC2_2, PVRTC2_4, ETC1, UYVY, YUY2, 1BPP, RGBE9995, RGBG8888, GRGB8888, ETC2_RGB, ETC2_RGBA, ETC2_RGB_A1, EAC_R11, EAC_RG11, ASTC_4x4, ASTC_5x4, ASTC_5x5, ASTC_6x5, ASTC_6x6, ASTC_8x5, ASTC_8x6, ASTC_8x8, ASTC_10x5, ASTC_10x6, ASTC_10x8, ASTC_10x10, ASTC_12x10, ASTC_12x12, ASTC_3x3x3, ASTC_4x3x3, ASTC_4x4x3, ASTC_4x4x4, ASTC_5x4x4, ASTC_5x5x4, ASTC_5x5x5, ASTC_6x5x5, ASTC_6x6x5, ASTC_6x6x6

-Valid Variable Types: UB, UBN, SB, SBN, US, USN, SS, SSN, UI, UIN, SI, SIN, UF, SF. 
 - Key: 
 - First Char- S=Signed, U=Unsigned. 
 - Second Char- B=Byte, S=Short, I=Integer, F=Float. 
 - Third Character (optional) N=Normalised.
-Valid Colourspaces: lRGB, sRGB.

Encode Quality: 
Sets the quality level to compress with. See usage table for valid options. Only currently useful with PVRTC, ETC and ASTC formats.
Usage
	-q ['pvrtcfastest'|'pvrtcfast'|'pvrtcnormal'|'pvrtchigh'|'pvrtcbest'|'etcfast'|'etcslow'|'etcfastperceptual'|'etcslowperceptual'|'astcveryfast'|'astcfast'|'astcmedium'|'astcthorough'|'astcexhaustive']
Example
	-q pvrtcfast

Dither: 
Tells the compressor to dither the texture before compression to avoid banding artifacts.
Usage
	-dither 
Example
	-dither 

Silence: 
Tells the utility to not output messages of any kind.
Usage
	-shh 
Example
	-shh 

Help: 
Requests help with either a list of all commands or for help on a specified argument, if the argument name is listed as a parameter.
Usage
	-help <commandargument>
Example
	-help "flip"

Red Channel: 
Sets the Red channel in the input texture to match the channel specified in a second image. A filename is specified for the source, and an optional channel name (single character) can be specified to select the source. By default, the channel will draw from its equivalent in the new texture. E.g. Red will draw from red, green from green etc. Valid source channels are 'r','g','b','a','l','i'. These represent red, green, blue, alpha, luminance and intensity.
Usage
	-red [filename],<channelname>
Example
	-red Red.png,g

Green Channel: 
Sets the Green channel in the input texture to match the channel specified in a second image. A filename is specified for the source, and an optional channel name (single character) can be specified to select the source. By default, the channel will draw from its equivalent in the new texture. E.g. Red will draw from red, green from green etc. Valid source channels are 'r','g','b','a','l','i'. These represent red, green, blue, alpha, luminance and intensity.
Usage
	-green [filename],<channelname>
Example
	-green Green.dds,b

Blue Channel: 
Sets the Blue channel in the input texture to match the channel specified in a second image. A filename is specified for the source, and an optional channel name (single character) can be specified to select the source. By default, the channel will draw from its equivalent in the new texture. E.g. Red will draw from red, green from green etc. Valid source channels are 'r','g','b','a','l','i'. These represent red, green, blue, alpha, luminance and intensity.
Usage
	-blue [filename],<channelname>
Example
	-blue Blue.pvr,r

Alpha Channel: 
Sets the Alpha channel in the input texture to match the channel specified in a second image. A filename is specified for the source, and an optional channel name (single character) can be specified to select the source. By default, the channel will draw from its equivalent in the new texture. E.g. Red will draw from red, green from green etc. Valid source channels are 'r','g','b','a','l','i'. These represent red, green, blue, alpha, luminance and intensity.
Usage
	-alpha [filename],<channelname>
Example
	-alpha Alpha.bmp,i

Difference: 
Calculates the difference between the input and a supplied file, providing error metrics, and is incompatible with performing compression (-f). A visual representation of the differences can be output by selecting an output mode;
 - 'Colour' Outputs the absolute delta of each channel into a texture.
   The modifier multiplies the deltas to highlight any issues (Default: 1.0)
 - 'Tolerance' will diff using the modifier as threshold (Default: 0.1):
   Deltas of 0 are black, above the threshold are red, below are blue.
 - 'Blend' will blend the images using the modifier
   as a weighting of the first texture against the second. (Default: 0.5)
 - 'None' (Default) will supress any output, so that it only provides metrics.
Usage
	-diff [filename],<mode>,<modifier>
Example
	-diff Other.png,Tolerance,0.5f

Resize Canvas: 
Resizes a texture to the given size, without changing the image data. This takes effect after resizing. Accepts two unsigned integer parameters - width and height. Values up to 8192x8192 are supported. Option is incompatible with Square or Power of Two canvas resize options.
Usage
	-rcanvas [width],[height]
Example
	-rcanvas 512,256

Resize Canvas Square: 
Forces the texture into a square, without changing the image data. This takes effect after resizing. A single character parameter, '-' or '+', can be specified to specify whether it is resized smaller(-) or larger(+). Incompatible with standard resize.
Usage
	-squarecanvas <+|->
Example
	-squarecanvas +

Resize Canvas Power of Two: 
Forces the texture into power of two dimensions, without changing the image data. This takes effect after resizing. A single character parameter, '-' or '+', can be specified to specify whether it is resized smaller(-) or larger(+). Incompatible with standard resize.
Usage
	-potcanvas <+|->
Example
	-potcanvas +

Offset Canvas: 
Sets the offset when performing a canvas resize (including square or pot resizes). Accepts two signed integer parameters - xoffset and yoffset. Values from -8192x-8192 to 8192x8192 are supported. Incompatible with canvas centring. 
Usage
	-offsetcanvas [xoffset],[yoffset]
Example
	-offsetcanvas -12,56

Offset Canvas: 
Sets the offset when performing a canvas resize (including square or pot resizes) so that the image resides in the centre of the canvas. Incompatible with canvas offset. 
Usage
	-centrecanvas 
Example
	-centrecanvas 



END
