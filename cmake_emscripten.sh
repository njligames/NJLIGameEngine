#!/bin/sh

export EMSCRIPTEN_LOCATION=/Applications/Developer/emsdk_portable/emscripten/1.37.9
export EMSCRIPTEN_INCLUDE_LOCATION=${EMSCRIPTEN_LOCATION}/system/include 

BUILD=$1

build_emscripten_sublime()
{
  BUILD_TYPE=$1
  if [ "${BUILD_TYPE}" == "Debug" ]
  then
    export EMCC_DEBUG=1
    #export EMCC_AUTODEBUG=1
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
        -DNJLI_UNITY_BUILD:BOOL=OFF \
        -DCMAKE_AR=${EMSCRIPTEN_LOCATION}/emar \
        -DCMAKE_CXX_COMPILER=${EMSCRIPTEN_LOCATION}/em++ \
        -DCMAKE_C_COMPILER=${EMSCRIPTEN_LOCATION}/emcc

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
        emmake make -j8 lua
        emmake make -j8 luac

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

#https://www.npmjs.com/package/minifier
#minify --output emscripten_Sublime/NJLIGameEngine.min.js emscripten_Sublime/NJLIGameEngine.js
#minify --output emscripten_Sublime/NJLIGameEngine.min.js.mem emscripten_Sublime/NJLIGameEngine.js.mem

