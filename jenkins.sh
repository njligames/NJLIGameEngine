
export MY_THIRDPARTY_DIR=/Users/jamesfolk/Dropbox/Developer/NJLI/External/thirdparty

export MY_NJLI_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/jli_game_engine/version-1.0/src 

export MY_NJLICORE_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/core 
export MY_ANDROID_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/android 
export MY_EMSCRIPTEN_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/emscripten 
export MY_IOS_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/ios 
export MY_MAC_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/mac 
export MY_TVOS_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/platform/tvos 

export GLES20_DIR=/Users/jamesfolk/Dropbox/Developer/GameEngine/Source/jli_game_engine/version-1.0/src/render/OpenGLES20 

export MY_ANDROID_NDK=/Users/jamesfolk/Library/Android/sdk/ndk-bundle
export MY_ANDROID_API_LEVEL=24

./cmake_apple.sh TRUE
./cmake_emscripten.sh TRUE

#/usr/bin/xcrun -sdk iphoneos PackageApplication -v "${RELEASE_BUILDDIR}/${APPLICATION_NAME}.app" -o "${BUILD_HISTORY_DIR}/${APPLICATION_NAME}.ipa" --sign "${DEVELOPER_NAME}" --embed "${PROVISONING_PROFILE}"
#http://blog.octo.com/en/automating-over-the-air-deployment-for-iphone/

#mkdir -p .build
#cd .build
#cpack .. --config CPackConfig.cmake
#cd ..

#rm -rf install
#mkdir -p install
#cp ./.build/NJLIGameEngine* ./install
#cp ./.build/install_manifest.txt ./install

