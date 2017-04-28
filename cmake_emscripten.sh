#!/bin/sh

BUILD=$1

build_emscripten()
{
    emcmake cmake -G "Sublime Text 2 - Unix Makefiles" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
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
    fi
}

cd projects

rm -rf emscripten_Sublime
mkdir -p emscripten_Sublime
cd emscripten_Sublime
build_emscripten
cd ..

