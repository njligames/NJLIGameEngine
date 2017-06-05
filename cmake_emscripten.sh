#!/bin/sh

BUILD=$1

build_emscripten_sublime()
{
    emcmake cmake -G "Sublime Text 2 - Unix Makefiles" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_es_2 \
        -DCMAKE_CXX_FLAGS="-std=gnu++11" \
        -DNJLI_BUILD_PLATFORM="emscripten" \
        -DCMAKE_BUILD_TYPE=Debug \
        -DNJLI_BUILD_DIR="emscripten" \
        -DNJLI_SOUND_PLATFORM=openal

    if [ ! -z ${BUILD} ]
    then
        mkdir -p ../../ERRORS
        echo "" > ../../ERRORS/emscripen.log
        emmake make 2> ../../ERRORS/emscripen.log
        emmake make install
    fi
}


build_emscripten_xcode()
{
    emcmake cmake -G "Xcode" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DCMAKE_TOOLCHAIN_FILE=/Applications/Developer/emsdk_portable/emscripten/1.37.9/cmake/Modules/Platform/Emscripten.cmake  \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DCMAKE_CXX_FLAGS="-std=gnu++11 -Wall -Walmost-asm" \
        -DNJLI_BUILD_PLATFORM="emscripten" \
        -DCMAKE_BUILD_TYPE=Release \
        -DNJLI_BUILD_DIR="emscripten" \
        -DNJLI_SOUND_PLATFORM=openal

    if [ ! -z ${BUILD} ]
    then
        mkdir -p ../../ERRORS
        echo "" > ../../ERRORS/emscripen.log
        emmake make 2> ../../ERRORS/emscripen.log
        emmake make install
    fi
}

cd projects

#rm -rf emscripten_Sublime
mkdir -p emscripten_Sublime
cd emscripten_Sublime
build_emscripten_sublime
cd ..

#rm -rf emscripten_Xcode
#mkdir -p emscripten_Xcode
#cd emscripten_Xcode
#build_emscripten_xcode
#cd ..
