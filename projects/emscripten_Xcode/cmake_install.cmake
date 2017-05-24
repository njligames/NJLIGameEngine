# Install script for directory: /Users/jamesfolk/Dropbox/Developer/NJLI/Engine

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/generated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/tests" TYPE FILE FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/cmake.in/Tests.in/lua/njli_test.lua")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data" TYPE FILE FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/cmake.in/DoxyFiles.in/images/logo.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/thirdparty/emscripten/Release" TYPE PROGRAM FILES
    "/Users/jamesfolk/Dropbox/Developer/NJLI/External/thirdparty/BUILD/lib/lua/emscripten/Release/bin/lua"
    "/Users/jamesfolk/Dropbox/Developer/NJLI/External/thirdparty/BUILD/lib/lua/emscripten/Release/bin/luac"
    "/Users/jamesfolk/Dropbox/Developer/NJLI/External/thirdparty/BUILD/lib/assimp/emscripten/Release/bin/assimp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/src/njli/platform/Game.h")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/swig/lua" TYPE FILE FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/lnjli.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/swig/lua" TYPE FILE FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/lbullet.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/emscripten/Release" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/Debug/libnjli.a")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/emscripten/Release" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/Release/libnjli.a")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/emscripten/Release" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/MinSizeRel/libnjli.a")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/emscripten/Release" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/RelWithDebInfo/libnjli.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/emscripten_Xcode/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
