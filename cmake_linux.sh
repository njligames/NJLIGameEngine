#!/bin/bash

BUILD=$1

build_linux()
{
    cmake -G "Unix Makefiles" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_2 \
        -DCMAKE_CXX_FLAGS="-std=gnu++11" \
        -DNJLI_BUILD_PLATFORM="linux" \
        -DCMAKE_BUILD_TYPE=Debug \
        -DNJLI_BUILD_DIR="linux" \
        -DNJLI_SOUND_PLATFORM=openal

    if [ ! -z ${BUILD} ]
    then
        mkdir -p ../../ERRORS
        echo "" > ../../ERRORS/linux.log
        make 2> ../../ERRORS/linux.log
        make -16
    fi
}

cd projects

#rm -rf linux_Makefiles
mkdir -p linux_Makefiles
cd linux_Makefiles
build_linux
cd ..

