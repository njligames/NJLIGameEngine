# Version Scripts

Scripts to update the release are as follows

*njli-update-major.sh
  Run this to update the major version number.
  This should be run everytime the public interface has changed.
*njli-update-minor.sh
  Run this to update the minor version number.
  This should be run whenever there is a new feature added.
*njli-update-release.sh
  Run this to update the release version number.
  This should be run on every push to the repository.

./Engine
    /bin.......................................tools used for development of games
    /projects..................................project files to build engine per platform.
        /android
        /androidVR
        /emscripten
        /iOS
        /linux
        /macOS
        /tvOS
        /windows
    /src.......................................source of njli game engine
        /genrated_swig
            /lua
        /njli
            /ComponentsLayer
            /HardwareAbstractionLayer
                /android
                /emscripten
                /iOS
                /linux
                /macOS
                /tvOS
                /windows
            /RenderLayer
                /OpenGL
                /OpenGLES20
                /OpenGLES30
            /SoundLayer
                /fmod
                /openAl
        /platform
            /android
            /emscripten
            /iOS
            /linux
            /macOS
            /tvOS
            /windows

./External
    /thirdparty
    /tools
        /glsl-optimizer

./Games
    /Yappybirds
        /_common
            /generated_assets
                /cameras
                /curves
                /fonts
                /images
                /materials
                /meshes
                /particles
                /scripts
                /shaders
                /sounds
                /strings
            /work_area
                /scripts
                    /lua
                        /game
                        /NJLI
        /projects..................................project files to build engine per platform.
            /android
            /androidVR
            /emscripten
            /iOS
            /iOSVR
            /linux
            /macOS
            /tvOS
            /windows
/Package.......................The files created by cpack
    /bin
    /data
        /swig
            /lua
    /doc
    /include
    /lib
        /android
        /emscripten
        /iOS
        /linux
        /macOS
        /tvOS
        /windows
    /module
        /lua
            /android
            /emscripten
            /iOS
            /linux
            /macOS
            /tvOS
            /windows
