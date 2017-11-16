#!/bin/bash

OUTPUT=icons
if [ ! -z "${1}" ]; then
  OUTPUT=$1
fi

echo "The output directory for cmake_icons.sh is ${OUTPUT}"

sh GenerateIcons/generateSystemImages.sh `pwd`/projects/COMMON/icons/  ${OUTPUT}

cp ${OUTPUT}/emscripten/* cmake.in/Platform.in/emscripten/EngineSource/

rm -rf cmake.in/Platform.in/ios/Assets.xcassets/
cp -r ${OUTPUT}/ios/* cmake.in/Platform.in/ios/

rm -rf cmake.in/Platform.in/appletv/Assets.xcassets/
cp -r ${OUTPUT}/tvOS/* cmake.in/Platform.in/appletv/

rm -rf cmake.in/Platform.in/macOS/Assets.xcassets/
cp -r ${OUTPUT}/macOS/* cmake.in/Platform.in/macOS/

rm -rf cmake.in/Platform.in/watchOS/Assets.xcassets/
cp -r ${OUTPUT}/watchkit/* cmake.in/Platform.in/watchOS/

rm -rf cmake.in/Platform.in/android/icons/*
cp -r ${OUTPUT}/android/* cmake.in/Platform.in/android/icons/

sips -Z 32 `pwd`/src/lua/etc/lua.ico --out `pwd`/cmake.in/Platform.in/emscripten/lua/favicon-32x32.ico
sips -Z 32 `pwd`/src/lua/etc/lua_lang.ico --out `pwd`/cmake.in/Platform.in/emscripten/luac/favicon-32x32.ico

sips -Z 16 `pwd`/src/lua/etc/lua.ico --out `pwd`/cmake.in/Platform.in/emscripten/lua/favicon-16x16.ico
sips -Z 16 `pwd`/src/lua/etc/lua_lang.ico --out `pwd`/cmake.in/Platform.in/emscripten/luac/favicon-16x16.ico

