# Install script for directory: /Users/jamesfolk/Documents/NJLI/Engine

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/jamesfolk/Documents/NJLI/Engine/generated")
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
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/NJLI.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/NJLI.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/NJLI.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/NJLI.framework" USE_SOURCE_PERMISSIONS)
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/framework/NJLI.framework/Versions/A/NJLI")
      endif()
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/libnjli.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/libnjli.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/libnjli.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static" TYPE STATIC_LIBRARY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/libnjli.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/static/libnjli.a")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/src/njli/platform/Engine.h")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE SHARED_LIBRARY FILES
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/libnjli.1.0.0.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/libnjli.1.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/libnjli.dylib"
      )
    foreach(file
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.0.0.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.dylib"
        )
      if(EXISTS "${file}" AND
         NOT IS_SYMLINK "${file}")
        if(CMAKE_INSTALL_DO_STRIP)
          execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
        endif()
      endif()
    endforeach()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE SHARED_LIBRARY FILES
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/libnjli.1.0.0.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/libnjli.1.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/libnjli.dylib"
      )
    foreach(file
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.0.0.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.dylib"
        )
      if(EXISTS "${file}" AND
         NOT IS_SYMLINK "${file}")
        if(CMAKE_INSTALL_DO_STRIP)
          execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
        endif()
      endif()
    endforeach()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE SHARED_LIBRARY FILES
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/libnjli.1.0.0.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/libnjli.1.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/libnjli.dylib"
      )
    foreach(file
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.0.0.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.dylib"
        )
      if(EXISTS "${file}" AND
         NOT IS_SYMLINK "${file}")
        if(CMAKE_INSTALL_DO_STRIP)
          execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
        endif()
      endif()
    endforeach()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE SHARED_LIBRARY FILES
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/libnjli.1.0.0.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/libnjli.1.dylib"
      "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/libnjli.dylib"
      )
    foreach(file
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.0.0.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.1.dylib"
        "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/libnjli.dylib"
        )
      if(EXISTS "${file}" AND
         NOT IS_SYMLINK "${file}")
        if(CMAKE_INSTALL_DO_STRIP)
          execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
        endif()
      endif()
    endforeach()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/src/njli/platform/Engine.h")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE MODULE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/njli.so")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE MODULE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/njli.so")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE MODULE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/njli.so")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib" TYPE MODULE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/njli.so")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/lib/njli.so")
      endif()
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/src/njli/platform/Engine.h")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/lua")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/lua")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/lua")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/lua")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/lua")
      endif()
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Debug/luac")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/luac")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/MinSizeRel/luac")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      endif()
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE EXECUTABLE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/RelWithDebInfo/luac")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin/luac")
      endif()
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/platform/macOS/10.13/macosx/Release/bin" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/build/Release/NJLIGameEngine.app" USE_SOURCE_PERMISSIONS)
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/cmake.in/ldoc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc" TYPE DIRECTORY FILES "/Users/jamesfolk/Documents/NJLI/Engine/cmake.in/html")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/swig/lua" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/lnjli.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/swig/lua" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/lbullet.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data/swig/lua" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/opengl_2.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/data" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/projects/COMMON/icons/IconInput.png")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/tests" TYPE FILE FILES "/Users/jamesfolk/Documents/NJLI/Engine/cmake.in/Tests.in/lua/njli_test.lua")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_macOS_Xcode/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
