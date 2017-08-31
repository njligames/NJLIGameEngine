#!/bin/sh

BUILD=$1

build_emscripten_sublime()
{
  EMCC_DEBUG=0

  BUILD_TYPE=$1
  if [ "${BUILD_TYPE}" == "Debug" ]
  then
    EMCC_DEBUG=1
  else
    BUILD_TYPE=Release
  fi

    emcmake cmake -G "Sublime Text 2 - Unix Makefiles" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_es_2 \
        -DCMAKE_CXX_FLAGS="-std=gnu++11" \
        -DNJLI_BUILD_PLATFORM="emscripten" \
        -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
        -DNJLI_BUILD_DIR="emscripten" \
        -DNJLI_SOUND_PLATFORM=openal \
        -DCMAKE_AR=/Applications/Developer/emsdk_portable/emscripten/1.37.9/emar \
        -DCMAKE_CXX_COMPILER=/Applications/Developer/emsdk_portable/emscripten/1.37.9/em++ \
        -DCMAKE_C_COMPILER=/Applications/Developer/emsdk_portable/emscripten/1.37.9/emcc

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
#build_emscripten_sublime Debug
build_emscripten_sublime
cd ..

