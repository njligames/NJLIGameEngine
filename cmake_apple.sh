#!/bin/sh

export NJLI_DEVELOPMENT_TEAM=SRBQ5SCF5X

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

export CMAKE_IOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk
export CMAKE_TVOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/
export CMAKE_WATCHOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/SDKs/WatchOS.sdk
export CMAKE_MACOS_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/

export CMAKE_IOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk -version SDKVersion`
export CMAKE_TVOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/ -version SDKVersion`
export CMAKE_WATCHOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/SDKs/WatchOS.sdk -version SDKVersion`
export CMAKE_MACOS_SYSTEM_VERSION=`xcodebuild -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/ -version SDKVersion`

export APP_LOADER_DIR="/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Versions/A/Support"
export PATH=${PATH}:${APP_LOADER_DIR}

build_apple_xcode()
{
  NJLI_PRODUCT_NAME=NJLIGameEngine
    MY_PLATFORM=$1
    MY_VERSION=$2
    MY_BUILD_PLAT=$3
    NJLI_BUILD_TYPE=Release

    MY_BUILD_DIR="${MY_PLATFORM}/${MY_VERSION}/${MY_BUILD_PLAT}"

    NJLI_INSTALL_PREFIX=../../generated
    INSTALL_DIR_FULL=`pwd`/${NJLI_INSTALL_PREFIX}/platform/${MY_BUILD_DIR}/${NJLI_BUILD_TYPE}/package

    echo 'hold on'
    echo ${INSTALL_DIR_FULL}

    MY_GRAPHICS_PLATFORM=opengl_es_2
    if [ $MY_PLATFORM == macOS ]
    then
        MY_GRAPHICS_PLATFORM=opengl_2
    fi

    cmake ../.. -G "Xcode" \
        -DCMAKE_CXX_FLAGS='-std=gnu++11' \
        -DCMAKE_INSTALL_PREFIX=${NJLI_INSTALL_PREFIX} \
        -DNJLI_THIRDPARTY_DIRECTORY:STRING=${MY_THIRDPARTY_DIR} \
        -DNJLI_BUILD_PLATFORM=${MY_PLATFORM} \
        -DNJLI_GRAPHICS_PLATFORM=${MY_GRAPHICS_PLATFORM} \
        -DNJLI_SOUND_PLATFORM=openal \
        -DCMAKE_BUILD_TYPE=${NJLI_BUILD_TYPE} \
        -DNJLI_BUILD_DIR=${MY_BUILD_DIR} \
        -DNJLI_PRODUCT_NAME=${NJLI_PRODUCT_NAME} \
        -DNJLI_PACKAGE_DIR=${INSTALL_DIR_FULL}

    mkdir -p ../../SETTINGS

    if [ ! -z "${BUILD}" ]; then

      mkdir -p ../../generated/ERRORS
      echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log

      xcodebuild \
        -configuration Release \
        -target install build \
        #> ../../generated/ERRORS/${MY_PLATFORM}.log
      cpack ../.. --config CPackSourceConfig.cmake

      SCHEME_NAME=EngineSource
      TARGET_SDK=iphoneos
      EXPORT_PLIST=`pwd`/../../appstore.plist
      ARCHIVEPATH=`pwd`/MyStage/Release/

      # Archive the application
      xcodebuild \
        -scheme "${SCHEME_NAME}" \
        -sdk "${TARGET_SDK}" \
        -archivePath "${ARCHIVEPATH}/${NJLI_PRODUCT_NAME}.xcarchive" \
        -configuration Release \
        -target install build \
        archive


      # Export the archive to an ipa
      xcodebuild \
        -allowProvisioningUpdates \
        -exportArchive \
        -archivePath "${ARCHIVEPATH}/${NJLI_PRODUCT_NAME}.xcarchive" \
        -exportOptionsPlist "${EXPORT_PLIST}" \
        -exportPath "${INSTALL_DIR_FULL}"

      # https://help.apple.com/itc/apploader/#/apdATD1E53-D1E1A1303-D1E53A1126
      #altool --validate-app -f file -u username [-p password] [--output-format xml]
      #altool --upload-app -f file -u username [-p password] [--output-format xml]

    fi
}

cd projects

##########################################3

#rm -rf ios_Xcode
#mkdir -p ios_Xcode
cd ios_Xcode
build_apple_xcode ios ${CMAKE_IOS_SYSTEM_VERSION} iphoneos 
cd ..

##########################################3

#rm -rf tvos_Xcode
#mkdir -p tvos_Xcode
#cd tvos_Xcode
#build_apple_xcode appletv ${CMAKE_TVOS_SYSTEM_VERSION} appletvos 
#cd ..

##########################################3

#rm -rf macOS_Xcode
#mkdir -p macOS_Xcode
#cd macOS_Xcode
#build_apple_xcode macOS ${CMAKE_MACOS_SYSTEM_VERSION}
#cd ..

##########################################3

