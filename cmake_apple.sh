#!/bin/sh

BUILD=$1

MY_IOS_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/OpenGLES.framework 


export CMAKE_IOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
export CMAKE_TVOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/
export CMAKE_WATCHOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/SDKs/WatchOS.sdk
export CMAKE_MACOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/

export CMAKE_IOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -version SDKVersion`
export CMAKE_TVOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/ -version SDKVersion`
export CMAKE_WATCHOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/SDKs/WatchOS.sdk -version SDKVersion`
export CMAKE_MACOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/ -version SDKVersion`

#codesign -s "James Folk" /Users/jamesfolk/Dropbox/Developer/NJLI/NJLIGameEngine-0.1.1-Darwin/module/ios/10.2/SIMULATOR/Release/njli.so

build_apple_test()
{
    MY_PLATFORM=$1

    PWD=`pwd`
    PLIST="${PWD}/../../cmake.in/Platform.in/${MY_PLATFORM}/Info.plist"
    
    xcodebuild -project NJLIGameEngine.xcodeproj -target EngineSource -configuration Release DEVELOPMENT_TEAM=SRBQ5SCF5X

    ${PWD}/../../updateXcodeBuild.py ${PLIST}
}

build_apple_xcode()
{
    MY_PLATFORM=$1
    MY_VERSION=$2
    MY_BUILD_PLAT=$3

    MY_BUILD_DIR="${MY_PLATFORM}/${MY_VERSION}/${MY_BUILD_PLAT}"

    MY_GRAPHICS_PLATFORM=opengl_es_2
    if [ $MY_PLATFORM == macOS ]
    then
        MY_GRAPHICS_PLATFORM=opengl_2
    fi


        #-DCMAKE_BUILD_TYPE=Release \
        #-DCMAKE_IOS_INSTALL_UNIVERSAL_LIBS=YES \
        #-DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
    cmake ../.. -G "Xcode" \
        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_BUILD_PLATFORM=${MY_PLATFORM} \
        -DNJLI_GRAPHICS_PLATFORM=${MY_GRAPHICS_PLATFORM} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DCMAKE_BUILD_TYPE=Release \
        -DNJLI_BUILD_DIR=${MY_BUILD_DIR}

    mkdir -p ../../SETTINGS

    if [ ! -z "${BUILD}" ]; then
        mkdir -p ../../generated/ERRORS
        echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log

        xcodebuild -project ${MY_PLATFORM}.xcodeproj -target install build -showBuildSettings > ../../generated/SETTINGS/${MY_PLATFORM}.txt
        xcodebuild -configuration Release DEVELOPMENT_TEAM=SRBQ5SCF5X -target install build #> ../../generated/ERRORS/${MY_PLATFORM}.log

        #cpack ../.. --config CPackConfig.cmake
        cpack ../.. --config CPackSourceConfig.cmake







        #cmake --build . --config Release
        #xcodebuild -project ${MY_PLATFORM}.xcodeproj -target EngineSource -configuration Release DEVELOPMENT_TEAM=SRBQ5SCF5X 2> ../../ERRORS/${MY_PLATFORM}.log || { echo "${MY_PLATFORM} failed"; exit 1; }
        #<cmake> --build . [--config <config>] [--target <target>] [-- -i]
        #cmake install


        #cmake install
        #xcodebuild -target install
        #/usr/bin/xcrun -sdk iphoneos PackageApplication -v "${RELEASE_BUILDDIR}/${APPLICATION_NAME}.app" -o "${BUILD_HISTORY_DIR}/${APPLICATION_NAME}.ipa" --sign "${DEVELOPER_NAME}" --embed "${PROVISONING_PROFILE}"

        
    fi
}

build_apple_unix()
{
    MY_PLATFORM=$1
    MY_VERSION=$2
    MY_BUILD_PLAT=$3

    MY_BUILD_DIR="${MY_PLATFORM}/${MY_VERSION}/${MY_BUILD_PLAT}"

    MY_GRAPHICS_PLATFORM=opengl_es_2
    if [ $MY_PLATFORM == macOS ]
    then
        MY_GRAPHICS_PLATFORM=opengl_2
    fi


        #-DCMAKE_BUILD_TYPE=Release \
        #-DCMAKE_IOS_INSTALL_UNIVERSAL_LIBS=YES \
        #-DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
    cmake ../.. -G "Unix Makefiles" \
        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_BUILD_PLATFORM=${MY_PLATFORM} \
        -DNJLI_GRAPHICS_PLATFORM=${MY_GRAPHICS_PLATFORM} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DCMAKE_BUILD_TYPE=Release \
        -DNJLI_BUILD_DIR=${MY_BUILD_DIR}

    mkdir -p ../../SETTINGS

    if [ ! -z "${BUILD}" ]; then
        mkdir -p ../../generated/ERRORS
        echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log

        xcodebuild -project ${MY_PLATFORM}.xcodeproj -target install build -showBuildSettings > ../../generated/SETTINGS/${MY_PLATFORM}.txt
        xcodebuild -configuration Release DEVELOPMENT_TEAM=SRBQ5SCF5X -target install build #> ../../generated/ERRORS/${MY_PLATFORM}.log

        #cpack ../.. --config CPackConfig.cmake
        cpack ../.. --config CPackSourceConfig.cmake







        #cmake --build . --config Release
        #xcodebuild -project ${MY_PLATFORM}.xcodeproj -target EngineSource -configuration Release DEVELOPMENT_TEAM=SRBQ5SCF5X 2> ../../ERRORS/${MY_PLATFORM}.log || { echo "${MY_PLATFORM} failed"; exit 1; }
        #<cmake> --build . [--config <config>] [--target <target>] [-- -i]
        #cmake install


        #cmake install
        #xcodebuild -target install
        #/usr/bin/xcrun -sdk iphoneos PackageApplication -v "${RELEASE_BUILDDIR}/${APPLICATION_NAME}.app" -o "${BUILD_HISTORY_DIR}/${APPLICATION_NAME}.ipa" --sign "${DEVELOPER_NAME}" --embed "${PROVISONING_PROFILE}"

        
    fi
}

#build_apple_ninja()
#{
#    MY_PLATFORM=$1
#    MY_VERSION=$2
#    MY_BUILD_PLAT=$3
#
#    MY_BUILD_DIR="${MY_PLATFORM}/${MY_VERSION}/${MY_BUILD_PLAT}"
#
#    MY_GRAPHICS_PLATFORM=opengl_es_2
#    if [ $MY_PLATFORM == macOS ]
#    then
#        MY_GRAPHICS_PLATFORM=opengl_2
#    fi
#
#
#    cmake ../.. -G "Ninja" \
#        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
#        -DCMAKE_INSTALL_PREFIX=../../generated/ \
#        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
#        -DNJLI_BUILD_PLATFORM=${MY_PLATFORM} \
#        -DCMAKE_BUILD_TYPE=Release \
#        -DNJLI_GRAPHICS_PLATFORM=${MY_GRAPHICS_PLATFORM} \
#        -DNJLI_SOUND_PLATFORM=openal \
#        -DNJLI_BUILD_DIR=${MY_BUILD_DIR}
#}

build_apple()
{
    #Debug Release MinsizeRel RelWithDebugInfo
    MY_BUILD_TYPE=$1
    #ios appletvos applewatchos
    MY_PLATFORM=$2
    MY_SIMULATOR=$3
    MY_BUILD_PLAT=$4
    MY_LIBRARY=$5
    MY_VERSION=$6

    MY_BUILD_DIR="${MY_PLATFORM}/${MY_VERSION}/${MY_BUILD_PLAT}"

    MY_GRAPHICS_PLATFORM=opengl_es_2
    if [ $MY_PLATFORM == macOS ]
    then
        MY_GRAPHICS_PLATFORM=opengl_2
    fi

    MY_BUILD_DIRECTORY=.build
    rm -rf ${MY_BUILD_DIRECTORY}
    mkdir -p ${MY_BUILD_DIRECTORY}
    cd ${MY_BUILD_DIRECTORY}

    cmake .. -G "Unix Makefiles" \
        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
        -DCMAKE_INSTALL_PREFIX=../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_BUILD_PLATFORM=${MY_PLATFORM} \
        -DCMAKE_BUILD_TYPE=${MY_BUILD_TYPE} \
        -DNJLI_GRAPHICS_PLATFORM=${MY_GRAPHICS_PLATFORM} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DNJLI_BUILD_DIR=${MY_BUILD_DIR} \
        -DCMAKE_TOOLCHAIN_FILE=${MY_THIRDPARTY_DIR}/apple.toolchain.cmake \
        -DSIMULATOR:BOOL=${MY_SIMULATOR} \
        -DENABLE_BITCODE:BOOL=OFF \
        -DPLATFORM=${MY_PLATFORM}

    make SWIGLua
    #ninja -C.
    make -j8
    #ninja install
    make install

    cd ..
}

build_ios()
{
    build_apple Debug ios ON iphonesimulator ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
    build_apple Debug ios OFF iphoneos ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}

    build_apple Release ios ON iphonesimulator ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
    build_apple Release ios OFF iphoneos ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}

#    build_apple MinsizeRel ios ON iphonesimulator ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
#    build_apple MinsizeRel ios OFF iphoneos ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
#
#    build_apple RelWithDebugInfo ios ON iphonesimulator ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
#    build_apple RelWithDebugInfo ios OFF iphoneos ${MY_IOS_PATH} ${CMAKE_IOS_SYSTEM_VERSION}
}

build_appletvos()
{
    build_apple Debug appletvos ON appletvsimulator ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
    build_apple Debug appletvos OFF appletvos ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}

    build_apple Release appletvos ON appletvsimulator ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
    build_apple Release appletvos OFF appletvos ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}

#    build_apple MinsizeRel appletvos ON appletvsimulator ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
#    build_apple MinsizeRel appletvos OFF appletvos ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
#
#    build_apple RelWithDebugInfo appletvos ON appletvsimulator ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
#    build_apple RelWithDebugInfo appletvos OFF appletvos ${MY_IOS_PATH} ${CMAKE_TVOS_SYSTEM_VERSION}
}

build_applewatchos()
{
    build_apple Debug applewatchos ON SIMULATOR ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}
    build_apple Debug applewatchos OFF OS ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}

    build_apple Release applewatchos ON SIMULATOR ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}
    build_apple Release applewatchos OFF OS ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}

    build_apple MinsizeRel applewatchos ON SIMULATOR ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}
    build_apple MinsizeRel applewatchos OFF OS ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}

    build_apple RelWithDebugInfo applewatchos ON SIMULATOR ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}
    build_apple RelWithDebugInfo applewatchos OFF OS ${MY_IOS_PATH} ${CMAKE_WATCHOS_SYSTEM_VERSION}
}

_build_macos()
{
    MY_BUILD_DIRECTORY=.build
    #rm -rf ${MY_BUILD_DIRECTORY}
    mkdir -p ${MY_BUILD_DIRECTORY}
    cd ${MY_BUILD_DIRECTORY}

    #Debug Release MinsizeRel RelWithDebugInfo
    MY_BUILD_TYPE=$1
    MY_VERSION=$2
    MY_BUILD_DIR="macOS/${MY_VERSION}"

    cmake ../.. -G "Unix Makefiles" \
        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
        -DCMAKE_INSTALL_PREFIX=../../generated/ \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_GRAPHICS_PLATFORM=opengl_2 \
        -DNJLI_BUILD_PLATFORM="macOS" \
        -DCMAKE_BUILD_TYPE=${MY_BUILD_TYPE} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DNJLI_BUILD_DIR=${MY_BUILD_DIR}

    #make SWIGLua
    #make -j8 install
    make install

    cd ..
}

build_macos()
{
    #BUILD_TYPES=(Debug Release MinsizeRel RelWithDebugInfo)
    BUILD_TYPES=(Debug Release)

    for BUILD_TYPE in ${BUILD_TYPES[@]};do
        _build_macos ${BUILD_TYPE} ${CMAKE_MACOS_SYSTEM_VERSION}
    done
}

#build_ios
#build_appletvos
#build_macos

cd projects

##########################################3

rm -rf ios_Xcode
mkdir -p ios_Xcode
cd ios_Xcode
build_apple_xcode ios ${CMAKE_IOS_SYSTEM_VERSION} iphoneos 
cd ..

##########################################3

rm -rf tvos_Xcode
mkdir -p tvos_Xcode
cd tvos_Xcode
build_apple_xcode appletv ${CMAKE_TVOS_SYSTEM_VERSION} appletvos 
cd ..

##########################################3

rm -rf macOS_Xcode
mkdir -p macOS_Xcode
cd macOS_Xcode
build_apple_xcode macOS ${CMAKE_MACOS_SYSTEM_VERSION}
cd ..

##########################################3

rm -rf macOS_UnixMakefiles
mkdir -p macOS_UnixMakefiles
cd macOS_UnixMakefiles
build_apple_unix macOS ${CMAKE_MACOS_SYSTEM_VERSION}
cd ..
