#!/bin/bash

export JAVA_HEAP_SIZE=4096m

source /Users/jamesfolk/Work/tools/emsdk/emsdk_env.sh
# emcc --clear-cache
# source ~/.bash_profile

# export EMSCRIPTEN_VERSION=1.37.9
# export EMSCRIPTEN_VERSION=1.37.40
# export EMSCRIPTEN_LOCATION=/Users/jamesfolk/Work/tools/emsdk/emscripten/${EMSCRIPTEN_VERSION}
# export EMSCRIPTEN_INCLUDE_LOCATION=${EMSCRIPTEN_LOCATION}/system/include 

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_MAJOR=$var
fi < ".NJLI_VERSION_MAJOR.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_MINOR=$var
fi < ".NJLI_VERSION_MINOR.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_RELEASE=$var
fi < ".NJLI_VERSION_RELEASE.txt"

BUILD=$1

build_emscripten_sublime()
{
  NJLI_INSTALL_PREFIX=../../generated
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
        -DCMAKE_INSTALL_PREFIX=${NJLI_INSTALL_PREFIX} \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_es_2 \
        -DCMAKE_CXX_FLAGS="-std=gnu++11" \
        -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
        -DNJLI_BUILD_PLATFORM="emscripten" \
        -DNJLI_BUILD_DIR="emscripten" \
        -DNJLI_PACKAGE_DIR=${NJLI_INSTALL_PREFIX} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DNJLI_UNITY_BUILD:BOOL=OFF #\

        # -DCMAKE_AR=${EMSCRIPTEN_LOCATION}/emar \
        # -DCMAKE_CXX_COMPILER=${EMSCRIPTEN_LOCATION}/em++ \
        # -DCMAKE_C_COMPILER=${EMSCRIPTEN_LOCATION}/emcc

    if [ ! -z ${BUILD} ]
    then
      mkdir -p ../../generated/ERRORS
      echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log

      # make -j8 NJLIGameEngine install

       # make -j8 install
	 make -j8 NJLIGameEngine
      
      #emmake make -j8 install
      #emmake make -j8

      # cpack ../.. --config CPackSourceConfig.cmake

    fi
}

cd projects

#rm emscripten_Sublime/CMakeCache.txt
# rm emscripten_Sublime/build/index.html.mem

rm -rf emscripten_Sublime

mkdir -p emscripten_Sublime
cd emscripten_Sublime

build_emscripten_sublime Debug
# build_emscripten_sublime

cd ..

#if [ ! -z ${BUILD} ]
#then
#  ./seperate_asm.sh
#fi

#https://www.npmjs.com/package/minifier
#minify --output emscripten_Sublime/NJLIGameEngine.min.js emscripten_Sublime/NJLIGameEngine.js
#minify --output emscripten_Sublime/NJLIGameEngine.min.js.mem emscripten_Sublime/NJLIGameEngine.js.mem

