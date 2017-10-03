#!/bin/sh

BUILD=$1

build_emscripten_sublime()
{
  BUILD_TYPE=$1
  if [ "${BUILD_TYPE}" == "Debug" ]
  then
    export EMCC_DEBUG=1
    export EMCC_AUTODEBUG=1
  else
    BUILD_TYPE=Release
    #export EMCC_DEBUG=0
    #export EMCC_AUTODEBUG=0
  fi

    emcmake cmake -G "Sublime Text 2 - Unix Makefiles" ../.. \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_es_2 \
        -DCMAKE_CXX_FLAGS="-std=gnu++11" \
        -DNJLI_BUILD_PLATFORM="emscripten" \
        -DNJLI_BUILD_DIR="emscripten" \
        -DNJLI_BUILD_TYPE=${BUILD_TYPE} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DCMAKE_AR=/Applications/Developer/emsdk_portable/emscripten/1.37.9/emar \
        -DCMAKE_CXX_COMPILER=/Applications/Developer/emsdk_portable/emscripten/1.37.9/em++ \
        -DCMAKE_C_COMPILER=/Applications/Developer/emsdk_portable/emscripten/1.37.9/emcc

    if [ ! -z ${BUILD} ]
    then
        mkdir -p ../../generated/ERRORS
        echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log

        #mkdir -p ../../ERRORS
        #echo "" > ../../ERRORS/emscripen.log
        #emmake make install 2> ../../generated/ERRORS/emscripen.log
        #emmake make -j8 install 
        #cpack ../.. --config CPackConfig.cmake      

        emmake make -j8 EngineSource

    fi
}

cd projects
rm emscripten_Sublime/NJLIGameEngine.js.mem

rm -rf emscripten_Sublime
#rm emscripten_Sublime/CMakeCache.txt
mkdir -p emscripten_Sublime
cd emscripten_Sublime

#build_emscripten_sublime Debug
build_emscripten_sublime

cd ..

#if [ ! -z ${BUILD} ]
#then
#  ./seperate_asm.sh
#fi
