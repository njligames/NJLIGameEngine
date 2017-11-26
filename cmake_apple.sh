#!/bin/bash



WORK_DIR=`mktemp -d`

if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
else
  echo "Created temp working directory $WORK_DIR"
fi

function cleanup {
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

trap cleanup EXIT

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
EXPORT=$2

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

  if [ ! -z "${EXPORT}" ]; then
    FILE=../../.${NJLI_PRODUCT_NAME}.${MY_PLATFORM}
    if [ -e $FILE ]
    then
      if IFS= read -r var
      then
        export NJLIGameEngine_BUILD_NUMBER=$var
      fi < ${FILE}
    else
      export NJLIGameEngine_BUILD_NUMBER=0
    fi

    RELEASE=$((NJLIGameEngine_BUILD_NUMBER + 1))
    export NJLIGameEngine_BUILD_NUMBER=$RELEASE

    echo ${RELEASE} > ${FILE}
  fi

  
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
    -DNJLI_PACKAGE_DIR=${NJLI_INSTALL_PREFIX}
  
  mkdir -p ../../SETTINGS
  
  if [ ! -z "${BUILD}" ]; then
    
    mkdir -p ../../generated/ERRORS
    echo "" > ../../generated/ERRORS/${MY_PLATFORM}.log
    
    xcodebuild \
      -configuration Release \
      -target install build \
      #> ../../generated/ERRORS/${MY_PLATFORM}.log
    
    cpack ../.. --config CPackSourceConfig.cmake
  fi
  
  if [ ! -z "${EXPORT}" ]; then
    
    SCHEME_NAME=${NJLI_PRODUCT_NAME}
    TARGET_SDK=${MY_BUILD_PLAT}
    EXPORT_PLIST=`pwd`/../../appstore.plist
    ARCHIVEPATH=`pwd`/MyStage/Release/
    export CFG_IGNORE_ITEM=".DS_Store"





    xcodebuild \
      -scheme "${SCHEME_NAME}" \
      -sdk "${TARGET_SDK}" \
      -configuration AppStoreDistribution \
      archive \
      -archivePath "${WORK_DIR}/${NJLI_PRODUCT_NAME}.xcarchive"

    xcodebuild \
      -exportArchive \
      -archivePath "${WORK_DIR}/${NJLI_PRODUCT_NAME}.xcarchive" \
      -exportOptionsPlist "${EXPORT_PLIST}" \
      -exportPath "${INSTALL_DIR_FULL}/xcarchive"

     






    ## Archive the application
    #xcodebuild \
    #  -scheme "${SCHEME_NAME}" \
    #  -sdk "${TARGET_SDK}" \
    #  -archivePath "${WORK_DIR}/${NJLI_PRODUCT_NAME}.xcarchive" \
    #  -configuration Release \
    #  -target install build \
    #  archive
    #
    ## Export the archive to an ipa
    #xcodebuild \
    #  -exportFormat IPA \
    #  -allowProvisioningUpdates \
    #  -exportArchive \
    #  -archivePath "${WORK_DIR}/${NJLI_PRODUCT_NAME}.xcarchive" \
    #  -exportOptionsPlist "${EXPORT_PLIST}" \
    #  -exportPath "${INSTALL_DIR_FULL}/xcarchive"

    #cp -r "${WORK_DIR}/${NJLI_PRODUCT_NAME}.xcarchive" ${ARCHIVEPATH}
      
    
    # https://help.apple.com/itc/apploader/#/apdATD1E53-D1E1A1303-D1E53A1126
    altool --validate-app -f "${INSTALL_DIR_FULL}/xcarchive/${NJLI_PRODUCT_NAME}.ipa" -u $username -p $password
    altool --upload-app -f "${INSTALL_DIR_FULL}/xcarchive/${NJLI_PRODUCT_NAME}.ipa" -u $username -p $password 
  
  fi
}

cd projects

##########################################3

#rm -rf ios_Xcode
#mkdir -p ios_Xcode
#cd ios_Xcode
#build_apple_xcode ios ${CMAKE_IOS_SYSTEM_VERSION} iphoneos 
#cd ..

##########################################3

rm -rf tvos_Xcode
mkdir -p tvos_Xcode
cd tvos_Xcode
build_apple_xcode appletv ${CMAKE_TVOS_SYSTEM_VERSION} appletvos 
cd ..

##########################################3

#rm -rf macOS_Xcode
#mkdir -p macOS_Xcode
#cd macOS_Xcode
#build_apple_xcode macOS ${CMAKE_MACOS_SYSTEM_VERSION} macosx
#cd ..

##########################################3

