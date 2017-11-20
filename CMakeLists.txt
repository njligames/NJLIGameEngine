cmake_minimum_required(VERSION 3.5.2)

if(APPLE)
  if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(MACOSX TRUE)
  else()
  endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
elseif(UNIX)
  set(LINUX TRUE)
else()
  if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(WINDOWS TRUE)
  else()
    MESSAGE("NOT SET!! ${CMAKE_SYSTEM_NAME}")
  endif()
endif(APPLE)

set( NJLI_BUILD_PLATFORM "macOS" CACHE STRING "The platform to build for." )

PROJECT (${NJLI_BUILD_PLATFORM})

SET(CMAKE_INCLUDES_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_BUNDLE_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_PRIVATE_HEADER_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_PUBLIC_HEADER_OUTPUT_DIRECTORY MyStage)
SET(CMAKE_RESOURCE_OUTPUT_DIRECTORY MyStage)

SET ( NJLIGameEngine_PACKAGE "NJLIGameEngine-${NJLI_BUILD_PLATFORM}" )
SET ( NJLIGameEngine_PACKAGE_TARNAME "NJLIGameEngine" )
SET ( NJLIGameEngine_PACKAGE_NAME "The NJLIGames LLC. Game Engine" )
SET ( NJLIGameEngine_BUGREPORT "jamesfolk1@gmail.com" )
SET ( OPERATING_SYSTEM "${CMAKE_SYSTEM_NAME}")

SET( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

STRING( COMPARE EQUAL "${OPERATING_SYSTEM}" "Linux" IS_LINUX )
STRING( COMPARE EQUAL "${CMAKE_BUILD_TYPE}" "Debug" IS_DEBUG )
STRING( COMPARE EQUAL "${CMAKE_BUILD_TYPE}" "Release" IS_RELEASE )

SET ( NJLIGameEngine_VERSION_MAJOR $ENV{NJLIGameEngine_VERSION_MAJOR} )
SET ( NJLIGameEngine_VERSION_MINOR $ENV{NJLIGameEngine_VERSION_MINOR} )
SET ( NJLIGameEngine_VERSION_RELEASE $ENV{NJLIGameEngine_VERSION_RELEASE} )
SET ( NJLIGameEngine_VERSION "${NJLIGameEngine_VERSION_MAJOR}.${NJLIGameEngine_VERSION_MINOR}.${NJLIGameEngine_VERSION_RELEASE}")

SET ( NJLIGameEngine_PACKAGE_STRING "${NJLIGameEngine_PACKAGE_NAME} ${NJLIGameEngine_VERSION}")

SET ( NJLIGameEngine_COMMON_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/common")

ADD_DEFINITIONS(-DSWIG_TYPE_TABLE=myprojectname)

ADD_DEFINITIONS(-DNJLI_VERSION_MAJOR=\"${NJLIGameEngine_VERSION_MAJOR}\")
ADD_DEFINITIONS(-DNJLI_VERSION_MINOR=\"${NJLIGameEngine_VERSION_MINOR}\")
ADD_DEFINITIONS(-DNJLI_VERSION_RELEASE=\"${NJLIGameEngine_VERSION_RELEASE}\")

SET ( NJLI_PRODUCT_NAME NJLIGameEngine CACHE STRING "The name of the product" )
SET ( CMAKE_INSTALL_INCLUDEDIR include CACHE STRING "The include directory" )
SET ( CMAKE_INSTALL_DATADIR data CACHE STRING "The data directory" )
SET ( CMAKE_INSTALL_DOCDIR doc CACHE STRING "The documentation directory" )
SET ( CMAKE_INSTALL_TESTDIR tests CACHE STRING "The tests directory" )
SET ( NJLI_THIRDPARTY_DIRECTORY "${CMAKE_SOURCE_DIR}/../External/thirdparty" CACHE STRING "The third party include directory" )
# SET ( NJLI_GRAPHICS_PLATFORM opengl_es_2 CACHE STRING  "The rendering platform to use" )
# SET ( NJLI_SOUND_PLATFORM fmod CACHE STRING "The sound to use" )
SET ( NJLI_SOURCE_DIRECTORY "${CMAKE_SOURCE_DIR}/src" CACHE STRING "The njli source directory" )
SET ( NJLI_SWIGIN_DIRECTORY "${CMAKE_SOURCE_DIR}/src/swig.in" CACHE STRING "The njli source directory" )
SET ( NJLI_THIRDPARTY_SWIGIN_DIRECTORY "${CMAKE_SOURCE_DIR}/../External/thirdparty/swig.in" CACHE STRING "The njli source directory" )
# SET ( NJLI_SCRIPT_LANGUAGE lua CACHE STRING  "The scripting language to use" )

set(NJLI_SCRIPT_LANGUAGE "lua" CACHE STRING "The rendering platform to use")
set(NJLI_SCRIPT_LANGUAGE_Values "lua;v8;node;jsc;python")
set_property(CACHE NJLI_SCRIPT_LANGUAGE PROPERTY STRINGS ${NJLI_SCRIPT_LANGUAGE_Values})

set(NJLI_GRAPHICS_PLATFORM "opengl_es_2" CACHE STRING "The rendering platform to use")
set(NJLI_GRAPHICS_PLATFORM_Values "opengl_es_2;opengl_es_3;opengl_2;opengl_3")
set_property(CACHE NJLI_GRAPHICS_PLATFORM PROPERTY STRINGS ${NJLI_GRAPHICS_PLATFORM_Values})

set(NJLI_SOUND_PLATFORM "openal" CACHE STRING "The rendering platform to use")
set(NJLI_SOUND_PLATFORM_Values "openal;fmod;sdl")
set_property(CACHE NJLI_SOUND_PLATFORM PROPERTY STRINGS ${NJLI_SOUND_PLATFORM_Values})

OPTION(NJLI_USE_ASSIMP_LIBRARY "Use assimp library"                    OFF)
OPTION(NJLI_USE_BULLET_LIBRARY "Use bullet library"                    ON)
OPTION(NJLI_USE_CONCURRENTQUEUE_LIBRARY "Use concurrent queue library" OFF)
OPTION(NJLI_USE_DEBUGDRAW_LIBRARY "Use debug-draw library"             ON)
OPTION(NJLI_USE_FLATBUFFERS_LIBRARY "Use flatbuffers library"          OFF)
OPTION(NJLI_USE_GLM_LIBRARY "Use glm library"                          ON)
OPTION(NJLI_USE_IMGUI_LIBRARY "Use imgui library"                      ON)
#OPTION(NJLI_USE_IMGUIZMO_LIBRARY "Use ImGuizmo library"                ON)
OPTION(NJLI_USE_JSONCPP_LIBRARY "Use jsoncp library"                   ON)
OPTION(NJLI_USE_NANOVG_LIBRARY "Use nanovg library"                    ON)
OPTION(NJLI_USE_OPENCV_LIBRARY "Use opencv library"                    OFF)
OPTION(NJLI_USE_SQLITE_LIBRARY "Use sqlite library"                    OFF)
OPTION(NJLI_USE_STB_LIBRARY "Use stb library"                          ON)
OPTION(NJLI_USE_USYNERGY_LIBRARY "Use usynergy library"                ON)

OPTION(NJLI_UNITY_BUILD "Build it as a unity build"                    OFF)

#OPTION(NJLI_USE_TINYXML2_LIBRARY "Use tinyxml2 library"                OFF)

INCLUDE("${CMAKE_SOURCE_DIR}/cmake/unity-build.cmake")
INCLUDE("${CMAKE_SOURCE_DIR}/cmake/download-extract.cmake")

IF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_es_2" )
  ADD_DEFINITIONS(-DNJLI_GL_ES2)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_es_3" )
  ADD_DEFINITIONS(-DNJLI_GL_ES3)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_2" )
  ADD_DEFINITIONS(-DNJLI_GL_2)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_3" )
  ADD_DEFINITIONS(-DNJLI_GL_3)
ENDIF()

IF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )
  ADD_DEFINITIONS(-DNJLI_SOUND_FMOD)
ELSEIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
  ADD_DEFINITIONS(-DNJLI_SOUND_OPENAL)
ELSEIF( ${NJLI_SOUND_PLATFORM} STREQUAL "sdl" )
  ADD_DEFINITIONS(-DNJLI_SOUND_SDL)
ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )

IF(NJLI_USE_ASSIMP_LIBRARY)
  ADD_DEFINITIONS(-DUSE_ASSIMP_LIBRARY=1)
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
  ADD_DEFINITIONS(-DUSE_BULLET_LIBRARY=1)
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  ADD_DEFINITIONS(-DUSE_CONCURRENTQUEUE_LIBRARY=1)
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  ADD_DEFINITIONS(-DUSE_DEBUGDRAW_LIBRARY=1)
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  ADD_DEFINITIONS(-DUSE_FLATBUFFERS_LIBRARY=1)
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
  ADD_DEFINITIONS(-DUSE_GLM_LIBRARY=1)
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  ADD_DEFINITIONS(-DUSE_IMGUI_LIBRARY=1)
ENDIF(NJLI_USE_IMGUI_LIBRARY)

#IF(NJLI_USE_IMGUIZMO_LIBRARY)
#    ADD_DEFINITIONS(-DUSE_IMGUIZMO_LIBRARY=1)
#ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
  ADD_DEFINITIONS(-DUSE_JSONCPP_LIBRARY=1)
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
  ADD_DEFINITIONS(-DUSE_NANOVG_LIBRARY=1)
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  ADD_DEFINITIONS(-DUSE_OPENCV_LIBRARY=1)
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  ADD_DEFINITIONS(-DUSE_SQLITE_LIBRARY=1)
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
  ADD_DEFINITIONS(-DUSE_STB_LIBRARY=1)
ENDIF(NJLI_USE_STB_LIBRARY)

IF(NJLI_USE_USYNERGY_LIBRARY)
  ADD_DEFINITIONS(-DUSE_USYNERGY_LIBRARY=1)
ENDIF(NJLI_USE_USYNERGY_LIBRARY)

#IF(NJLI_USE_TINYXML2_LIBRARY)
#    ADD_DEFINITIONS(-DUSE_TINYXML2_LIBRARY=1)
#ENDIF(NJLI_USE_TINYXML2_LIBRARY)

SET( NJLI_ASSIMP_POSTFIX "" )
SET( NJLI_FMOD_POSTFIX "" )
STRING( COMPARE EQUAL "${CMAKE_BUILD_TYPE}" "Debug" is_equal )
IF( is_equal )
  ADD_DEFINITIONS(-DDEBUG=1)
  SET(NJLI_ASSIMP_POSTFIX "d")
  SET(NJLI_FMOD_POSTFIX "L")
ENDIF( is_equal )

SET( NJLI_FMOD_EXTENSION "a")
SET( NJLI_BINARY_EXTENSION "" )

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
  SET( NJLI_FMOD_EXTENSION "dylib" )
ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )
  SET( NJLI_FMOD_EXTENSION "so" )
ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
  SET( NJLI_BINARY_EXTENSION ".js" )
ENDIF()

# configure a header file to pass some of the CMake settings
# to the source code
CONFIGURE_FILE (
  "${CMAKE_SOURCE_DIR}/cmake.in/NJLIGameEngineConfig.h.in"
  "${NJLI_SOURCE_DIRECTORY}/njli/generated/NJLIGameEngineConfig.h"
)
CONFIGURE_FILE (
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/Engine.h.in"
  "${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h"
)

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  CONFIGURE_FILE (
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Info.plist.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Info.plist"
  )
endif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")



SET(NJLIGameEngine_TESTFILES
  ${CMAKE_SOURCE_DIR}/cmake.in/Tests.in/lua/njli_test.lua
)

SET(NJLIGameEngine_DATAFILES
  ${CMAKE_SOURCE_DIR}/projects/COMMON/icons/IconInput.png
)

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/*.cpp
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/*.c
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/platform/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_platform ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE(GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/*.mm
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/*.m
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/*.cpp
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/*.c
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp|[.]m|[.]mm)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_platform_specific ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/bullet/*.h
  ${NJLI_SOURCE_DIRECTORY}/bullet/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/bullet/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_graphics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_physics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/body/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/body/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/body/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_physics_body ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/constraint/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/constraint/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/constraint/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_physics_constraint ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/shape/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/shape/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/shape/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_physics_shape ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/platform/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/platform/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/platform/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_platform ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/sound/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/sound/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/sound/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_sound ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_steering ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/behavior/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/behavior/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/behavior/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_builders_steering_behavior ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated_swig ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()


FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/*
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated_swig_lua ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()


FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/${NJLI_GRAPHICS_PLATFORM}/*
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/${NJLI_GRAPHICS_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated_swig_lua_platform ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()









FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/embind/*
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/embind/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated_swig_embind ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()


FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/embind/${NJLI_GRAPHICS_PLATFORM}/*
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/embind/${NJLI_GRAPHICS_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_generated_swig_embind_platform ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()
























FILE( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/graphics/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_graphics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_graphics_specific ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/*.c
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/modules/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_modules ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/lua/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/lua/*.c
  ${NJLI_SOURCE_DIRECTORY}/njli/modules/lua/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/modules/lua/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_modules_lua ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/physics/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_physics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/body/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/body/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/physics/body/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_physics_body ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/constraint/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/constraint/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/physics/constraint/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_physics_constraint ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/shape/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/shape/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/physics/shape/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_physics_shape ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/sound/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/sound/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/sound/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_sound ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/sound/${NJLI_SOUND_PLATFORM}/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/sound/${NJLI_SOUND_PLATFORM}/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/sound/${NJLI_SOUND_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_sound_specific ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/steering/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/steering/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/steering/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_steering ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  ${NJLI_SOURCE_DIRECTORY}/njli/steering/behavior/*.h
  ${NJLI_SOURCE_DIRECTORY}/njli/steering/behavior/*.cpp
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/steering/behavior/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND njli_steering_behavior ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/*.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/*.c"
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/lua/exts/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND lua_exts ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/*.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/*.c"
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND lua_exts_luasocket ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  "${NJLI_SOURCE_DIRECTORY}/lua/src/[A-Za-z0-9]*.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/[A-Za-z0-9]*.c"
)
SET(REG "${NJLI_SOURCE_DIRECTORY}/lua/src/.*([.]cpp|[.]c|[.]h|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND lua_src ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

LIST(REMOVE_ITEM lua_exts_luasocket
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/compat.c"
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/compat.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/wsocket.c"
  "${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket/wsocket.h"
)
LIST(REMOVE_ITEM lua_src
  "${NJLI_SOURCE_DIRECTORY}/lua/src/loadlib_rel.c"
  #"${NJLI_SOURCE_DIRECTORY}/lua/src/lobject.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/lua.c"
  #"${NJLI_SOURCE_DIRECTORY}/lua/src/lua.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/lua.rc"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/luac.c"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/luac.rc"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/luaconf.h.in"
  #"${NJLI_SOURCE_DIRECTORY}/lua/src/lualib.h"
  "${NJLI_SOURCE_DIRECTORY}/lua/src/wmain.c"
)


IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
  SET_SOURCE_FILES_PROPERTIES( ${njli_sound_specific} PROPERTIES COMPILE_FLAGS "-x objective-c++" )
ENDIF()

FILE(GLOB NJLIGameEngine_SRCS
  ${bullet}
  #${group_other}
  ${lua_exts}
  ${lua_exts_luasocket}
  ${lua_src}
  ${njli}
  ${njli_builders}
  ${njli_builders_graphics}
  ${njli_builders_physics}
  ${njli_builders_physics_body}
  ${njli_builders_physics_constraint}
  ${njli_builders_physics_shape}
  ${njli_builders_platform}
  ${njli_builders_sound}
  ${njli_builders_steering}
  ${njli_builders_steering_behavior}
  #${njli_generated}
  #${njli_generated_swig}
  #${njli_generated_swig_lua}
  ${njli_graphics}
  ${njli_graphics_specific}
  ${njli_modules}
  ${njli_modules_lua}
  ${njli_physics}
  ${njli_physics_body}
  ${njli_physics_constraint}
  ${njli_physics_shape}
  ${njli_platform}
  ${njli_platform_specific}
  ${njli_sound}
  ${njli_sound_specific}
  ${njli_steering}
  ${njli_steering_behavior}
)



LIST(APPEND NJLI_handle_source
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.cpp
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.h
  ${bullet}
  ${njli}
  ${njli_builders}
  ${njli_builders_graphics}
  ${njli_builders_physics}
  ${njli_builders_physics_body}
  ${njli_builders_physics_constraint}
  ${njli_builders_physics_shape}
  ${njli_builders_platform}
  ${njli_builders_sound}
  ${njli_builders_steering}
  ${njli_builders_steering_behavior}
  ${njli_generated}
  ${njli_generated_swig}
  ${njli_generated_swig_lua}
  ${njli_graphics}
  ${njli_graphics_specific}
  ${njli_modules}
  ${njli_modules_lua}
  ${njli_physics}
  ${njli_physics_body}
  ${njli_physics_constraint}
  ${njli_physics_shape}
  ${njli_platform}
  ${njli_platform_specific}
  ${njli_sound}
  ${njli_sound_specific}
  ${njli_steering}
  ${njli_steering_behavior}
)
FOREACH(item ${NJLI_handle_source})
  IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
    LIST(REMOVE_ITEM NJLI_handle_source ${item})
  ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

  IF(${item} MATCHES "[A-Za-z0-9/]*swp")
    LIST(REMOVE_ITEM NJLI_handle_source ${item})
  ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
ENDFOREACH(item)

ADD_CUSTOM_TARGET(
  cppcheck
  COMMAND /usr/local/bin/cppcheck
  --enable=warning,performance,portability,information,missingInclude
  --std=c++11
  --library=qt.cfg
  --template="{file},{line},{message},{callstack},{severity},{id}"
  --verbose
  --quiet
  ${NJLI_handle_source}
)
ADD_DEPENDENCIES(cppcheck WrapSWIG)

ADD_CUSTOM_TARGET(
  clangformat
  COMMAND /Applications/Developer/emsdk_portable/clang/e1.37.9_64bit/clang-format
  -style=file
  -i
  ${NJLI_handle_source}
  SOURCES
  "${NJLI_SOURCE_DIRECTORY}/../.clang-format"
)
ADD_DEPENDENCIES(clangformat WrapSWIG)

IF(NOT NJLI_USE_NANOVG_LIBRARY)
  LIST(REMOVE_ITEM NJLIGameEngine_SRCS
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/ButtonHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/CheckboxHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/DropdownHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/LabelHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/SliderHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics/TextboxHUDBuilder.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/ButtonHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/CheckboxHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/DropdownHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/LabelHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/SliderHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/TextboxHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}/WorldHUD.cpp"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/ButtonHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/CheckboxHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/DropdownHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/LabelHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/SliderHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/TextboxHUD.h"
    "${NJLI_SOURCE_DIRECTORY}/njli/graphics/WorldHUD.h"
  )
ENDIF(NOT NJLI_USE_NANOVG_LIBRARY)

FILE(GLOB NJLIGameEngine_HDRS
  ${NJLI_SOURCE_DIRECTORY}
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include
  ${NJLI_SOURCE_DIRECTORY}/bullet
  ${NJLI_SOURCE_DIRECTORY}/lua/src
  ${NJLI_SOURCE_DIRECTORY}/lua/exts
  ${NJLI_SOURCE_DIRECTORY}/lua/exts/luasocket
  ${NJLI_SOURCE_DIRECTORY}/njli
  ${NJLI_SOURCE_DIRECTORY}/njli/builders
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/graphics
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/body
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/constraint
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/physics/shape
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/platform
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/sound
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering
  ${NJLI_SOURCE_DIRECTORY}/njli/builders/steering/behavior
  ${NJLI_SOURCE_DIRECTORY}/njli/generated
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig
  ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics
  ${NJLI_SOURCE_DIRECTORY}/njli/graphics/${NJLI_GRAPHICS_PLATFORM}
  ${NJLI_SOURCE_DIRECTORY}/njli/physics
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/body
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/constraint
  ${NJLI_SOURCE_DIRECTORY}/njli/physics/shape
  ${NJLI_SOURCE_DIRECTORY}/njli/sound
  ${NJLI_SOURCE_DIRECTORY}/njli/steering
  ${NJLI_SOURCE_DIRECTORY}/njli/steering/behavior
  ${NJLI_SOURCE_DIRECTORY}/njli/platform
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/${NJLI_BUILD_PLATFORM}
)

IF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )
  SET(NJLIGameEngine_HDRS
    ${NJLIGameEngine_HDRS}
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include
  )
ELSEIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
  SET(NJLIGameEngine_HDRS
    ${NJLIGameEngine_HDRS}
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/openal
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ogg
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/vorbis
  )
ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )





IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
  LIST(APPEND NJLIGameEngine_HDRS
    $ENV{EMSCRIPTEN_LOCATION}/system/include
    $ENV{EMSCRIPTEN_LOCATION}/system/include/emscripten
  )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

IF(NJLI_USE_ASSIMP_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp
  )
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/autogenerated
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/shared
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/shared
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Geometry
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Initialize
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/BroadphaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionDispatch
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionShapes
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/Gimpact
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Character
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/ConstraintSolver
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Dynamics
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Featherstone
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/MLCPSolvers
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Vehicle
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/autogenerated
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/details
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletSoftBody
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletWorldImporter
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletXmlWorldImporter
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/ConvexDecomposition
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/GIMPACTUtils
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/HACD
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/InverseDynamics
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/LinearMath
  )
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/concurrentqueue
  )
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/debug-draw
  )
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/flatbuffers
  )
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm
  )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/imgui
  )
ENDIF(NJLI_USE_IMGUI_LIBRARY)

#IF(NJLI_USE_IMGUIZMO_LIBRARY)
#    LIST(APPEND NJLIGameEngine_HDRS
#        ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo
#        )
#ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp
  )
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg
  )
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/opencv
  )
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/sqlite
  )
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
  LIST(APPEND NJLIGameEngine_HDRS
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb
  )
ENDIF(NJLI_USE_STB_LIBRARY)

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/*.hpp
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/*.c
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/*.cpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/.*([.]h|[.]hpp|[.]c|[.]cpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND third_party_directory ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB_RECURSE src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND fmod ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()





#FILE( GLOB_RECURSE src
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/alut/*.h
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/alut/*.inl
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/alut/*.hpp
#    )
#SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/alut/.*([.]h|[.]inl|[.]hpp)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND alut ${filename})
#    ELSE()
#        LIST(APPEND group_other ${filename})
#    ENDIF()
#ENDFOREACH()

FILE( GLOB_RECURSE src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ogg/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ogg/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ogg/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ogg/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND ogg ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB_RECURSE src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/vorbis/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/vorbis/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/vorbis/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/vorbis/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND vorbis ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()













FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND assimp ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND assimp_assimp ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/Compiler/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/Compiler/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/Compiler/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp/assimp/Compiler/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND assimp_assimp_Compiler ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3 ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet2FileLoader ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet2FileLoader_autogenerated ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Collision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Collision_BroadPhaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Collision_BroadPhaseCollision_shared ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Collision_NarrowPhaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Collision_NarrowPhaseCollision_shared ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Common ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/shared/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/shared/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/shared/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Common/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Common_shared ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Dynamics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Dynamics_ConstraintSolver ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/shared/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/shared/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/shared/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Dynamics/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Dynamics_shared ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Geometry/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Geometry/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Geometry/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3Geometry/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3Geometry ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_BroadphaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_BroadphaseCollision_kernels ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Initialize/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_Initialize ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_NarrowphaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_NarrowphaseCollision/kernels ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_ParallelPrimitives ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_ParallelPrimitives_kernels ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_Raycast ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_Raycast_kernels ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_RigidBody ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_Bullet3OpenCL_RigidBody_kernels ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision_BroadphaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionDispatch/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision_CollisionDispatch ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/CollisionShapes/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision_CollisionShapes ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/Gimpact/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/Gimpact/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/Gimpact/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/Gimpact/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision_Gimpact ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletCollision_NarrowPhaseCollision ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Character/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Character/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Character/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Character/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_Character ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_ConstraintSolver ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Dynamics/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Dynamics/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Dynamics/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Dynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_Dynamics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Featherstone/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Featherstone/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Featherstone/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Featherstone/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_Featherstone ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_MLCPSolvers ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Vehicle/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Vehicle/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Vehicle/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletDynamics/Vehicle/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletDynamics_Vehicle ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletFileLoader ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletFileLoader/autogenerated/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletFileLoader_autogenerated ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletInverseDynamics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/details/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/details/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/details/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletInverseDynamics/details/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletInverseDynamics_details ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletSoftBody/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletSoftBody/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletSoftBody/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletSoftBody/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletSoftBody ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletWorldImporter/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletWorldImporter/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletWorldImporter/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletWorldImporter/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletWorldImporter ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletXmlWorldImporter/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletXmlWorldImporter/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletXmlWorldImporter/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/BulletXmlWorldImporter/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_BulletXmlWorldImporter ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/ConvexDecomposition/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/ConvexDecomposition/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/ConvexDecomposition/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/ConvexDecomposition/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_ConvexDecomposition ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/GIMPACTUtils/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/GIMPACTUtils/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/GIMPACTUtils/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/GIMPACTUtils/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_GIMPACTUtils ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/HACD/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/HACD/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/HACD/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/HACD/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_HACD ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/InverseDynamics/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/InverseDynamics/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/InverseDynamics/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/InverseDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_InverseDynamics ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/LinearMath/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/LinearMath/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/LinearMath/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3/LinearMath/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND bullet3_LinearMath ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND jsoncpp ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/json/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/json/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/json/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp/json/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND jsoncpp_json ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

#FILE( GLOB src
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo/*.h
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo/*.inl
#    ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo/*.hpp
#    )
#SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo/.*([.]h|[.]inl|[.]hpp)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND ImGuizmo ${filename})
#    ELSE()
#        LIST(APPEND group_other ${filename})
#    ENDIF()
#ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm_glm ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/detail/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/detail/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/detail/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/detail/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm_glm_detail ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtc/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtc/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtc/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtc/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm_glm_gtc ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtx/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtx/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtx/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/gtx/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm_glm_gtx ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/simd/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/simd/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/simd/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm/glm/simd/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND glm_glm_simd ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND nanovg ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb/*.c
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND stb ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/tinyxml2/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/tinyxml2/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/tinyxml2/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/tinyxml2/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND tinyxml2 ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include/*.h
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include/*.inl
  ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include/*.hpp
)
SET(REG "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND SDL2 ${filename})
  ELSE()
    LIST(APPEND group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE(GLOB NJLIGameEngine_THIRDPARTY_INC
  ${third_party_directory}
  ${SDL2}
)

SET(emscripten_include "")
SET(emscripten_include_emscripten "")
IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
  FILE( GLOB emscripten_include
    $ENV{EMSCRIPTEN_LOCATION}/system/include/*.h
    $ENV{EMSCRIPTEN_LOCATION}/system/include/*.inl
    $ENV{EMSCRIPTEN_LOCATION}/system/include/*.hpp
  )
  FILE( GLOB emscripten_include_emscripten
    $ENV{EMSCRIPTEN_LOCATION}/system/include/emscripten/*.h
    $ENV{EMSCRIPTEN_LOCATION}/system/include/emscripten/*.inl
    $ENV{EMSCRIPTEN_LOCATION}/system/include/emscripten/*.hpp
  )

  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${emscripten_include}
    ${emscripten_include_emscripten}
  )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )





IF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${fmod}
  )
ELSEIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    #${alut}
    ${ogg}
    ${vorbis}
  )
ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )




IF(NJLI_USE_ASSIMP_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${assimp}
    ${assimp_assimp}
    ${assimp_assimp_Compiler}
  )
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${bullet3}
    ${bullet3_Bullet2FileLoader}
    ${bullet3_Bullet2FileLoader_autogenerated}
    ${bullet3_Bullet3Collision}
    ${bullet3_Bullet3Collision_BroadPhaseCollision}
    ${bullet3_Bullet3Collision_BroadPhaseCollision/shared}
    ${bullet3_Bullet3Collision_NarrowPhaseCollision}
    ${bullet3_Bullet3Collision_NarrowPhaseCollision_shared}
    ${bullet3_Bullet3Common}
    ${bullet3_Bullet3Common_shared}
    ${bullet3_Bullet3Dynamics}
    ${bullet3_Bullet3Dynamics_ConstraintSolver}
    ${bullet3_Bullet3Dynamics_shared}
    ${bullet3_Bullet3Geometry}
    ${bullet3_Bullet3OpenCL}
    ${bullet3_Bullet3OpenCL_BroadphaseCollision}
    ${bullet3_Bullet3OpenCL_BroadphaseCollision/kernels}
    ${bullet3_Bullet3OpenCL_Initialize}
    ${bullet3_Bullet3OpenCL_NarrowphaseCollision}
    ${bullet3_Bullet3OpenCL_NarrowphaseCollision_kernels}
    ${bullet3_Bullet3OpenCL_ParallelPrimitives}
    ${bullet3_Bullet3OpenCL_ParallelPrimitives_kernels}
    ${bullet3_Bullet3OpenCL_Raycast}
    ${bullet3_Bullet3OpenCL_Raycast_kernels}
    ${bullet3_Bullet3OpenCL_RigidBody}
    ${bullet3_Bullet3OpenCL_RigidBody_kernels}
    ${bullet3_BulletCollision}
    ${bullet3_BulletCollision_BroadphaseCollision}
    ${bullet3_BulletCollision_CollisionDispatch}
    ${bullet3_BulletCollision_CollisionShapes}
    ${bullet3_BulletCollision_Gimpact}
    ${bullet3_BulletCollision_NarrowPhaseCollision}
    ${bullet3_BulletDynamics}
    ${bullet3_BulletDynamics_Character}
    ${bullet3_BulletDynamics_ConstraintSolver}
    ${bullet3_BulletDynamics_Dynamics}
    ${bullet3_BulletDynamics_Featherstone}
    ${bullet3_BulletDynamics_MLCPSolvers}
    ${bullet3_BulletDynamics_Vehicle}
    ${bullet3_BulletFileLoader}
    ${bullet3_BulletFileLoader_autogenerated}
    ${bullet3_BulletInverseDynamics}
    ${bullet3_BulletInverseDynamics_details}
    ${bullet3_BulletSoftBody}
    ${bullet3_BulletWorldImporter}
    ${bullet3_BulletXmlWorldImporter}
    ${bullet3_ConvexDecomposition}
    ${bullet3_GIMPACTUtils}
    ${bullet3_HACD}
    ${bullet3_InverseDynamics}
    ${bullet3_LinearMath}
  )
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${glm}
    ${glm_glm}
    ${glm_glm_detail}
    ${glm_glm_gtc}
    ${glm_glm_gtx}
    ${glm_glm_simd}
  )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_IMGUI_LIBRARY)

#IF(NJLI_USE_IMGUIZMO_LIBRARY)
#    LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
#        ${ImGuizmo}
#        )
#ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${jsoncpp}
    ${jsoncpp_json}
  )
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${nanovg}
  )
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
  )
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
  LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
    ${stb}
  )
ENDIF(NJLI_USE_STB_LIBRARY)








































FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()







############################################################################################################

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/graphics/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/graphics/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/graphics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_graphics ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/body/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/body/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/body/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_physics_body ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/constraint/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/constraint/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/constraint/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_physics_constraint ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/shape/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/shape/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/physics/shape/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_physics_shape ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/platform/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/platform/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/platform/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_platform ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

file( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/sound*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/sound*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/sound.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_sound ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_steering ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/behavior/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/behavior/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/builders/steering/behavior/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_builders_steering_behavior ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/graphics/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/graphics/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/graphics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_graphics ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_physics ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/body/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/body/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/body/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_physics_body ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/constraint/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/constraint/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/constraint/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_physics_constraint ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/shape/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/shape/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/physics/shape/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_physics_shape ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/platform/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/platform/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/platform/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_platform ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/sound/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/sound/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/sound/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_sound ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_steering ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/behavior/*.i"
  "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/behavior/*.swg"
)
SET(REG "${NJLI_SWIGIN_DIRECTORY}/script/njli/steering/behavior/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_njli_steering_behavior ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()


















































#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/graphics/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/graphics/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/graphics/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_graphics ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/body/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/body/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/body/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_physics_body ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/constraint/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/constraint/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/constraint/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_physics_constraint ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#file( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/shape/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/shape/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/physics/shape/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_physics_shape ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/platform/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/platform/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/platform/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_platform ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#file( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/sound*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/sound*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/sound.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_sound ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_steering ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/behavior/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/behavior/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/builders/steering/behavior/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_builders_steering_behavior ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/graphics/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/graphics/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/graphics/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_graphics ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_physics ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/body/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/body/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/body/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_physics_body ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/constraint/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/constraint/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/constraint/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_physics_constraint ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/shape/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/shape/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/physics/shape/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_physics_shape ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/platform/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/platform/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/platform/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_platform ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/sound/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/sound/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/sound/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_sound ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_steering ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/behavior/*.i"
#    "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/behavior/*.swg"
#    )
#SET(REG "${NJLI_SWIGIN_DIRECTORY}/embind/njli/steering/behavior/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_njli_steering_behavior ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()



























FILE(GLOB NJLIGameEngine_ITFS
  ${swigin}
  ${swigin_lua}
  ${swigin_lua_njli}
  ${swigin_lua_njli_builders}
  ${swigin_lua_njli_builders_graphics}
  ${swigin_lua_njli_builders}
  ${swigin_lua_njli_builders_physics_body}
  ${swigin_lua_njli_builders_physics_constraint}
  ${swigin_lua_njli_builders_physics_shape}
  ${swigin_lua_njli_builders_platform}
  ${swigin_lua_njli_builders_sound}
  ${swigin_lua_njli_builders_steering}
  ${swigin_lua_njli_builders_steering_behavior}
  ${swigin_lua_njli_graphics}
  ${swigin_lua_njli_physics}
  ${swigin_lua_njli_physics_body}
  ${swigin_lua_njli_physics_constraint}
  ${swigin_lua_njli_physics_shape}
  ${swigin_lua_njli_platform}
  ${swigin_lua_njli_sound}
  ${swigin_lua_njli_steering}
  ${swigin_lua_njli_steering_behavior}

  #    ${swigin_embind}
  #    ${swigin_embind_njli}
  #    ${swigin_embind_njli_builders}
  #    ${swigin_embind_njli_builders_graphics}
  #    ${swigin_embind_njli_builders}
  #    ${swigin_embind_njli_builders_physics_body}
  #    ${swigin_embind_njli_builders_physics_constraint}
  #    ${swigin_embind_njli_builders_physics_shape}
  #    ${swigin_embind_njli_builders_platform}
  #    ${swigin_embind_njli_builders_sound}
  #    ${swigin_embind_njli_builders_steering}
  #    ${swigin_embind_njli_builders_steering_behavior}
  #    ${swigin_embind_njli_graphics}
  #    ${swigin_embind_njli_physics}
  #    ${swigin_embind_njli_physics_body}
  #    ${swigin_embind_njli_physics_constraint}
  #    ${swigin_embind_njli_physics_shape}
  #    ${swigin_embind_njli_platform}
  #    ${swigin_embind_njli_sound}
  #    ${swigin_embind_njli_steering}
  #    ${swigin_embind_njli_steering_behavior}
)









FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3 ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/BroadphaseCollision/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/BroadphaseCollision/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/BroadphaseCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision_BroadphaseCollision ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionDispatch/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionDispatch/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionDispatch/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision_CollisionDispatch ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionShapes/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionShapes/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/CollisionShapes/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision_CollisionShapes ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/Gimpact/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/Gimpact/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/Gimpact/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision_Gimpact ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/NarrowPhaseCollision/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/NarrowPhaseCollision/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletCollision/NarrowPhaseCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletCollision_NarrowPhaseCollision ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Character/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Character/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Character/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_Character ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/ConstraintSolver/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/ConstraintSolver/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/ConstraintSolver/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_ConstraintSolver ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Dynamics/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Dynamics/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Dynamics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_Dynamics ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Featherstone/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Featherstone/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Featherstone/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_Featherstone ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/MLCPSolvers/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/MLCPSolvers/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/MLCPSolvers/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_MLCPSolvers ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Vehicle/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Vehicle/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletDynamics/Vehicle/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletDynamics_Vehicle ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletSoftBody/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletSoftBody/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/BulletSoftBody/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_BulletSoftBody ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/LinearMath/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/LinearMath/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/LinearMath/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_LinearMath ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_MiniCL ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/MiniCLTask/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/MiniCLTask/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/MiniCL/MiniCLTask/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_MiniCL_MiniCLTask ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_vectormath ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/neon/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/neon/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/neon/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_vectormath/neon ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/scalar/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/scalar/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/scalar/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_vectormath_scalar ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/sse/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/sse/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/sse/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_bullet3_vectormath_sse ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

FILE( GLOB src
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/${NJLI_GRAPHICS_PLATFORM}/*.i"
  "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/${NJLI_GRAPHICS_PLATFORM}/*.swg"
)
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/${NJLI_GRAPHICS_PLATFORM}/.*([.]i|[.]swg)")
FOREACH(filename ${src})
  STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
  IF(match_group_sources)
    LIST(APPEND swigin_lua_graphics_platform ${filename})
  ELSE()
    LIST(APPEND interface_group_other ${filename})
  ENDIF()
ENDFOREACH()

#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/sse/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/script/bullet3/vectormath/sse/*.swg"
#    )
#SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/${NJLI_GRAPHICS_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND njli_generated_swig_lua_platform ${filename})
#    ELSE()
#        LIST(APPEND group_other ${filename})
#    ENDIF()
#ENDFOREACH()
















#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3 ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/BroadphaseCollision/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/BroadphaseCollision/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/BroadphaseCollision/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision_BroadphaseCollision ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionDispatch/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionDispatch/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionDispatch/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision_CollisionDispatch ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionShapes/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionShapes/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/CollisionShapes/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision_CollisionShapes ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/Gimpact/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/Gimpact/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/Gimpact/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision_Gimpact ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/NarrowPhaseCollision/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/NarrowPhaseCollision/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletCollision/NarrowPhaseCollision/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletCollision_NarrowPhaseCollision ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Character/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Character/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Character/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_Character ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/ConstraintSolver/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/ConstraintSolver/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/ConstraintSolver/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_ConstraintSolver ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Dynamics/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Dynamics/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Dynamics/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_Dynamics ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Featherstone/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Featherstone/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Featherstone/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_Featherstone ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/MLCPSolvers/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/MLCPSolvers/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/MLCPSolvers/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_MLCPSolvers ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Vehicle/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Vehicle/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletDynamics/Vehicle/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletDynamics_Vehicle ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletSoftBody/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletSoftBody/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/BulletSoftBody/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_BulletSoftBody ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/LinearMath/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/LinearMath/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/LinearMath/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_LinearMath ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_MiniCL ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/MiniCLTask/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/MiniCLTask/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/MiniCL/MiniCLTask/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_MiniCL_MiniCLTask ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_vectormath ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/neon/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/neon/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/neon/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_vectormath/neon ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/scalar/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/scalar/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/scalar/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_vectormath_scalar ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/sse/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/sse/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/sse/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_bullet3_vectormath_sse ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()
#
#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/${NJLI_GRAPHICS_PLATFORM}/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/${NJLI_GRAPHICS_PLATFORM}/*.swg"
#    )
#SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/${NJLI_GRAPHICS_PLATFORM}/.*([.]i|[.]swg)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND swigin_embind_graphics_platform ${filename})
#    ELSE()
#        LIST(APPEND interface_group_other ${filename})
#    ENDIF()
#ENDFOREACH()

#FILE( GLOB src
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/sse/*.i"
#    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/embind/bullet3/vectormath/sse/*.swg"
#    )
#SET(REG "${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/embind/${NJLI_GRAPHICS_PLATFORM}/.*([.]cpp|[.]c|[.]h|[.]hpp)")
#FOREACH(filename ${src})
#    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
#    IF(match_group_sources)
#        LIST(APPEND njli_generated_swig_embind_platform ${filename})
#    ELSE()
#        LIST(APPEND group_other ${filename})
#    ENDIF()
#ENDFOREACH()






























FILE(GLOB NJLIGameEngine_THIRDPARTY_ITFS
  ${swigin_lua_bullet3}
  ${swigin_lua_bullet3_BulletCollision}
  ${swigin_lua_bullet3_BulletCollision_BroadphaseCollision}
  ${swigin_lua_bullet3_BulletCollision_CollisionDispatch}
  ${swigin_lua_bullet3_BulletCollision_CollisionShapes}
  ${swigin_lua_bullet3_BulletCollision_Gimpact}
  ${swigin_lua_bullet3_BulletCollision_NarrowPhaseCollision}
  ${swigin_lua_bullet3_BulletDynamics}
  ${swigin_lua_bullet3_BulletDynamics_Character}
  ${swigin_lua_bullet3_BulletDynamics_ConstraintSolver}
  ${swigin_lua_bullet3_BulletDynamics_Dynamics}
  ${swigin_lua_bullet3_BulletDynamics_Featherstone}
  ${swigin_lua_bullet3_BulletDynamics_MLCPSolvers}
  ${swigin_lua_bullet3_BulletDynamics_Vehicle}
  ${swigin_lua_bullet3_BulletSoftBody}
  ${swigin_lua_bullet3_LinearMath}
  ${swigin_lua_bullet3_MiniCL}
  ${swigin_lua_bullet3_MiniCL_MiniCLTask}
  ${swigin_lua_bullet3_vectormath}
  ${swigin_lua_bullet3_vectormath_neon}
  ${swigin_lua_bullet3_vectormath_scalar}
  ${swigin_lua_bullet3_vectormath_sse}

  ${swigin_lua_graphics_platform}

  #    ${swigin_embind_bullet3}
  #    ${swigin_embind_bullet3_BulletCollision}
  #    ${swigin_embind_bullet3_BulletCollision_BroadphaseCollision}
  #    ${swigin_embind_bullet3_BulletCollision_CollisionDispatch}
  #    ${swigin_embind_bullet3_BulletCollision_CollisionShapes}
  #    ${swigin_embind_bullet3_BulletCollision_Gimpact}
  #    ${swigin_embind_bullet3_BulletCollision_NarrowPhaseCollision}
  #    ${swigin_embind_bullet3_BulletDynamics}
  #    ${swigin_embind_bullet3_BulletDynamics_Character}
  #    ${swigin_embind_bullet3_BulletDynamics_ConstraintSolver}
  #    ${swigin_embind_bullet3_BulletDynamics_Dynamics}
  #    ${swigin_embind_bullet3_BulletDynamics_Featherstone}
  #    ${swigin_embind_bullet3_BulletDynamics_MLCPSolvers}
  #    ${swigin_embind_bullet3_BulletDynamics_Vehicle}
  #    ${swigin_embind_bullet3_BulletSoftBody}
  #    ${swigin_embind_bullet3_LinearMath}
  #    ${swigin_embind_bullet3_MiniCL}
  #    ${swigin_embind_bullet3_MiniCL_MiniCLTask}
  #    ${swigin_embind_bullet3_vectormath}
  #    ${swigin_embind_bullet3_vectormath_neon}
  #    ${swigin_embind_bullet3_vectormath_scalar}
  #    ${swigin_embind_bullet3_vectormath_sse}
  #
  #    ${swigin_embind_graphics_platform}
)

SET( GAME_ASSETS "${NJLIGameEngine_COMMON_DIRECTORY}/assets" )
SET( LUA_ASSETS "${NJLI_SOURCE_DIRECTORY}/lua/etc/lua.ico" "${NJLI_SOURCE_DIRECTORY}/lua/src/lua.rc")
SET( LUAC_ASSETS "${NJLI_SOURCE_DIRECTORY}/lua/etc/lua.ico" "${NJLI_SOURCE_DIRECTORY}/lua/src/luac.rc")


FILE( GLOB_RECURSE GAME_ASSETS_FILES "${NJLIGameEngine_COMMON_DIRECTORY}/assets/*" )

SET(EXTRA_PLATFORM_LIBS "")

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )

  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
  #SET(imported_zlibstatic_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.2/Release-appletvos/lib/libzlibstatic.a")
  SET(imported_Bullet2FileLoader_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a")
  SET(imported_Bullet3Common_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a")
  SET(imported_Bullet3Dynamics_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a")
  SET(imported_Bullet3Geometry_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a")
  SET(imported_Bullet3OpenCL_clew_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a" )
  SET(imported_BulletInverseDynamics_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a")
  SET(imported_BulletInverseDynamicsUtils_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libflatbuffers.a")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libimgui.a" )
  #SET(imported_ImGuizmo_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libogg.a" )
  SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_calib3d.a")
  SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_core.a")
  SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_features2d.a")
  SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_flann.a")
  SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgcodecs.a")
  SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgproc.a")
  SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_ml.a")
  SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_objdetect.a")
  SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_photo.a")
  SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_shape.a")
  SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_stitching.a")
  SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_video.a")
  SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_videostab.a")
  #SET(imported_IlmImf_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libzlib.a")
  SET(imported_sqlite_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libsqlite3.a")
  SET(imported_stb_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libstb.a" )
  #SET(imported_tinyxml2_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libtinyxml2.a" )
  SET(imported_fmod_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/lib/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libfmod${NJLI_FMOD_POSTFIX}.${NJLI_FMOD_EXTENSION}" )
  SET(imported_SDL2_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a")

  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libopenal.a")
  #SET(imported_alut_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a")



  SET(NJLI_APPICON_NAME "App Icon & Top Shelf Image")

  LIST(APPEND NJLIGameEngine_HDRS /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/System/Library/Frameworks )

  SET( CMAKE_OSX_SYSROOT "appletvos" )
  SET( CMAKE_XCODE_EFFECTIVE_PLATFORMS "-appletvos;-appletvsimulator" )

  #SET ( CMAKE_OSX_ARCHITECTURES ${ARCHS_STANDARD_32_BIT} CACHE string "Build architecture for appletv" )
  SET ( CMAKE_OSX_ARCHITECTURES $(ARCHS_UNIVERSAL_APPLETV_OS) CACHE string "Build architecture for appletv" )
  SET ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden" )
  SET ( EXTRA_PLATFORM_LIBS
    ${EXTRA_PLATFORM_LIBS}
    "-framework AVFoundation"
    "-framework GameController"
    "-framework CoreGraphics"
    "-framework AudioToolbox"
    "-framework QuartzCore"
    "-framework OpenGLES"
    "-framework UIKit"
    "-framework Foundation"
  )

  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
    SET ( EXTRA_PLATFORM_LIBS
      ${EXTRA_PLATFORM_LIBS}
      "-framework OpenAL"
    )
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )

  SET( LOCALIZATION_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings" )
  SET_SOURCE_FILES_PROPERTIES( "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings"  PROPERTIES XCODE_LAST_KNOWN_FILE_TYPE "text.plist.strings" )

  SET( ASSET_CATALOGUE "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" )
  FILE( GLOB_RECURSE ASSET_CATALOGUE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets/*" )

  SET( NJLI_RESOURCES ${LOCALIZATION_DIR} ${ASSET_CATALOGUE} ${GAME_ASSETS} )
  SET( NJLI_RESOURCES_FILES ${ASSET_CATALOGUE_FILES} ${GAME_ASSETS_FILES} )

  SET( NJLI_DEVICE_FAMILY "3" )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )

  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
  SET(imported_Bullet2FileLoader_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a")
  SET(imported_Bullet3Common_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a")
  SET(imported_Bullet3Dynamics_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a")
  SET(imported_Bullet3Geometry_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a")
  SET(imported_Bullet3OpenCL_clew_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a" )
  SET(imported_BulletInverseDynamics_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a")
  SET(imported_BulletInverseDynamicsUtils_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libflatbuffers.a")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libimgui.a" )
  #SET(imported_ImGuizmo_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libogg.a" )
  SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_calib3d.a")
  SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_core.a")
  SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_features2d.a")
  SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_flann.a")
  SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgcodecs.a")
  SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgproc.a")
  SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_ml.a")
  SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_objdetect.a")
  SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_photo.a")
  SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_shape.a")
  SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_stitching.a")
  SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_video.a")
  SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_videostab.a")
  #SET(imported_IlmImf_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libzlib.a")
  SET(imported_sqlite_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libsqlite3.a")
  SET(imported_stb_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libstb.a" )
  #SET(imported_tinyxml2_location               "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libtinyxml2.a" )
  SET(imported_fmod_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/lib/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libfmod${NJLI_FMOD_POSTFIX}.${NJLI_FMOD_EXTENSION}" )
  SET(imported_SDL2_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a")

  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libopenal.a")
  #SET(imported_alut_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a")

  SET(NJLI_APPICON_NAME "AppIcon")

  LIST(APPEND NJLIGameEngine_HDRS /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks  )

  SET( CMAKE_OSX_SYSROOT "iphoneos" )
  SET( CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos;-iphonesimulator" )

  #SET ( CMAKE_OSX_ARCHITECTURES ${ARCHS_STANDARD_32_BIT} CACHE string "Build architecture for iOS" )
  SET ( CMAKE_OSX_ARCHITECTURES $(ARCHS_UNIVERSAL_IPHONE_OS) CACHE string "Build architecture for iOS" )
  SET ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden" )
  SET ( EXTRA_PLATFORM_LIBS
    ${EXTRA_PLATFORM_LIBS}
    "-framework AVFoundation"
    "-framework AudioToolbox"
    "-framework GameController"
    "-framework CoreMotion"
    "-framework CoreGraphics"
    "-framework QuartzCore"
    "-framework OpenGLES"
    "-framework UIKit"
    "-framework Foundation"
  )

  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
    SET ( EXTRA_PLATFORM_LIBS
      ${EXTRA_PLATFORM_LIBS}
      "-framework OpenAL"
    )
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )

  SET( LOCALIZATION_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings" )
  SET_SOURCE_FILES_PROPERTIES( "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings"  PROPERTIES XCODE_LAST_KNOWN_FILE_TYPE "text.plist.strings" )

  SET( ASSET_CATALOGUE "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" )
  FILE( GLOB_RECURSE ASSET_CATALOGUE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets/*" )

  SET( NJLI_RESOURCES ${LOCALIZATION_DIR} ${ASSET_CATALOGUE} ${GAME_ASSETS} )
  SET( NJLI_RESOURCES_FILES ${ASSET_CATALOGUE_FILES} ${GAME_ASSETS_FILES} )

  SET( NJLI_DEVICE_FAMILY "1,2" )


ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
  SET(imported_Bullet2FileLoader_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Collision.a")
  SET(imported_Bullet3Common_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Common.a")
  SET(imported_Bullet3Dynamics_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Dynamics.a")
  SET(imported_Bullet3Geometry_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Geometry.a")
  SET(imported_Bullet3OpenCL_clew_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3OpenCL_clew.a")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletCollision.a" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletDynamics.a" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletFileLoader.a" )
  SET(imported_BulletInverseDynamics_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletInverseDynamics.a")
  SET(imported_BulletInverseDynamicsUtils_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletInverseDynamicsUtils.a")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletSoftBody.a" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletWorldImporter.a" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletXmlWorldImporter.a" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libConvexDecomposition.a" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libGIMPACTUtils.a" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libHACD.a" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libLinearMath.a" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libflatbuffers.a")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.12/Release/libimgui.a" )
  #SET(imported_ImGuizmo_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/macOS/10.12/Release/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.12/Release/libjsoncpp.a")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.12/Release/libnanovg.a" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/10.12/Release/libogg.a" )
  SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_calib3d.a")
  SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_core.a")
  SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_features2d.a")
  SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_flann.a")
  SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_imgcodecs.a")
  SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_imgproc.a")
  SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_ml.a")
  SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_objdetect.a")
  SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_photo.a")
  SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_shape.a")
  SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_stitching.a")
  SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_video.a")
  SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_videostab.a")
  #SET(imported_IlmImf_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/libzlib.a")
  SET(imported_sqlite_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.12/Release/libsqlite3.a")
  SET(imported_stb_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.12/Release/libstb.a" )
  #SET(imported_tinyxml2_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.12/Release/libtinyxml2.a" )
  SET(imported_fmod_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/lib/${NJLI_BUILD_PLATFORM}/10.12/Release/libfmod.dylib" )
  SET(imported_SDL2_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.12/Release/libSDL2.a" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.12/Release/libuSynergy.a")

  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/10.12/libopenal.a")
  #SET(imported_alut_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.12/Release/libvorbis.a")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.12/Release/libvorbisenc.a")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/10.12/Release/libvorbisfile.a")

  SET(NJLI_APPICON_NAME "AppIcon")

  LIST(APPEND NJLIGameEngine_HDRS /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks  )

  SET ( CMAKE_OSX_ARCHITECTURES ${ARCHS_STANDARD_32_BIT} CACHE string "Build architecture for macOS" )
  SET ( EXTRA_PLATFORM_LIBS
    ${EXTRA_PLATFORM_LIBS}
    "-framework OpenGL"
    "-framework Foundation"
    "-framework AudioToolbox"
    "-framework AVFoundation"
    "-framework CoreVideo"
    "-framework Cocoa"
    "-framework CoreAudio"
    "-framework ForceFeedback"
    "-framework IOKit"
    "-framework AudioToolbox"
    "-framework CoreFoundation"
    "-framework AudioUnit"
    "-framework Carbon"
  )

  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
    SET ( EXTRA_PLATFORM_LIBS
      ${EXTRA_PLATFORM_LIBS}
      "-framework OpenAL"
    )
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )

  SET( LOCALIZATION_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings" )
  SET_SOURCE_FILES_PROPERTIES( "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Localizable.strings"  PROPERTIES XCODE_LAST_KNOWN_FILE_TYPE "text.plist.strings" )

  SET( ASSET_CATALOGUE "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" )
  FILE( GLOB_RECURSE ASSET_CATALOGUE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets/*" )

  SET( NJLI_RESOURCES ${LOCALIZATION_DIR} ${ASSET_CATALOGUE} ${GAME_ASSETS} )
  SET( NJLI_RESOURCES_FILES ${ASSET_CATALOGUE_FILES} ${GAME_ASSETS_FILES} )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
  LIST(APPEND NJLIGameEngine_HDRS $ENV{EMSCRIPTEN_LOCATION}/system/include )
  LIST(APPEND NJLIGameEngine_HDRS $ENV{EMSCRIPTEN_LOCATION}/system/include/emscripten )

  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/Release/lib/libassimp${NJLI_ASSIMP_POSTFIX}.so" )
  SET(imported_Bullet2FileLoader_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Collision.so")
  SET(imported_Bullet3Common_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Common.so")
  SET(imported_Bullet3Dynamics_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Dynamics.so")
  SET(imported_Bullet3Geometry_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Geometry.so")
  SET(imported_Bullet3OpenCL_clew_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3OpenCL_clew.so")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletCollision.so" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletDynamics.so" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletFileLoader.so" )
  SET(imported_BulletInverseDynamics_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamics.so")
  SET(imported_BulletInverseDynamicsUtils_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamicsUtils.so")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletSoftBody.so" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletWorldImporter.so" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletXmlWorldImporter.so" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libConvexDecomposition.so" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libGIMPACTUtils.so" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libHACD.so" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libLinearMath.so" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/Release/lib/libflatbuffers.so")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/Release/libimgui.so" )
  #SET(imported_ImGuizmo_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/Release/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/Release/libjsoncpp.so")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/Release/libnanovg.so" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/Release/libogg.so" )
  SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_calib3d.so")
  SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_core.so")
  SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_features2d.so")
  SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_flann.so")
  SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgcodecs.so")
  SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgproc.so")
  SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_ml.so")
  SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_objdetect.so")
  SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_photo.so")
  SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_shape.so")
  SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_stitching.so")
  SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_video.so")
  SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_videostab.so")
  #SET(imported_IlmImf_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libzlib.a")
  SET(imported_sqlite_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/Release/libsqlite3.so")
  SET(imported_stb_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/Release/libstb.so" )
  #SET(imported_tinyxml2_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/Release/libtinyxml2.a" )
  SET(imported_fmod_location                        "" )
  SET(imported_SDL2_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/Release/libSDL2.a" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/Release/libuSynergy.so")

  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/Release/libopenal.a")
  #SET(imported_alut_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/Release/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbis.so")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbisenc.so")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbisfile.so")

  IF( IS_DEBUG)
    # DEBUGGING: https://kripken.github.io/emscripten-site/docs/porting/Debugging.html#debugging-emcc-debug

    LIST(APPEND EXTRA_PLATFORM_LIBS "--bind")
    LIST(APPEND EXTRA_PLATFORM_LIBS "--profiling")
    LIST(APPEND EXTRA_PLATFORM_LIBS "--profiling-funcs")
    LIST(APPEND EXTRA_PLATFORM_LIBS "--tracing")
    LIST(APPEND EXTRA_PLATFORM_LIBS "--emit-symbol-map")
    LIST(APPEND EXTRA_PLATFORM_LIBS "-g4")

    #LIST(APPEND EXTRA_PLATFORM_LIBS "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/debug_shell.html")

  ELSE()
    # OPTIMIZING: https://kripken.github.io/emscripten-site/docs/optimizing/Optimizing-Code.html
    # SEPERATE ASM: https://kripken.github.io/emscripten-site/docs/optimizing/Optimizing-Code.html#avoid-memory-spikes-by-separating-out-asm-js

    LIST(APPEND EXTRA_PLATFORM_LIBS "-s -O2 --llvm-opts 2")

    #LIST(APPEND EXTRA_PLATFORM_LIBS "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/release_shell.html")

  ENDIF( IS_DEBUG)

  LIST(APPEND EXTRA_PLATFORM_LIBS "--js-opts 0")
  LIST(APPEND EXTRA_PLATFORM_LIBS "-s TOTAL_MEMORY=256*1024*1024")
  LIST(APPEND EXTRA_PLATFORM_LIBS "-s FULL_ES2=1")
  #LIST(APPEND EXTRA_PLATFORM_LIBS "-s USE_PTHREADS=2")
  #LIST(APPEND EXTRA_PLATFORM_LIBS "-s PTHREAD_POOL_SIZE=8")
  LIST(APPEND EXTRA_PLATFORM_LIBS "--separate-asm")
  #LIST(APPEND EXTRA_PLATFORM_LIBS "-s WASM=1")
  #LIST(APPEND EXTRA_PLATFORM_LIBS "--closure 1")

  #https://kripken.github.io/emscripten-site/docs/porting/files/packaging_files.html
  SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -DSWIG_TYPE_TABLE=myprojectname --memory-init-file 1 --embed-file  ${NJLIGameEngine_COMMON_DIRECTORY}/assets@/" )
  SET(CMAKE_EXECUTABLE_SUFFIX ".html")

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )

  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libassimp.a" )
  SET(imported_Bullet2FileLoader_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Collision.a")
  SET(imported_Bullet3Common_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Common.a")
  SET(imported_Bullet3Dynamics_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Dynamics.a")
  SET(imported_Bullet3Geometry_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Geometry.a")
  SET(imported_Bullet3OpenCL_clew_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3OpenCL_clew.a")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletCollision.a" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletDynamics.a" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletFileLoader.a" )
  SET(imported_BulletInverseDynamics_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletInverseDynamics.a")
  SET(imported_BulletInverseDynamicsUtils_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletInverseDynamicsUtils.a")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletSoftBody.a" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletWorldImporter.a" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletXmlWorldImporter.a" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libConvexDecomposition.a" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libGIMPACTUtils.a" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libHACD.a" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libLinearMath.a" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libflatbuffers.a")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libimgui.a" )
  #SET(imported_ImGuizmo_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libjsoncpp.a")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libnanovg.a" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libogg.so" )
  SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_calib3d.a")
  SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libopencv_core.a")
  SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_features2d.a")
  SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_flann.a")
  SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_imgcodecs.a")
  SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_imgproc.a")
  SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_ml.a")
  SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_objdetect.a")
  SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_photo.a")
  SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_shape.a")
  SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_stitching.a")
  SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_video.a")
  SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_videostab.a")
  #SET(imported_IlmImf_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/libzlib.a")
  SET(imported_sqlite_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libsqlite3.a")
  SET(imported_stb_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libstb.a" )
  #SET(imported_tinyxml2_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libtinyxml2.a" )
  SET(imported_fmod_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/lib/${NJLI_BUILD_PLATFORM}/24/${ANDROID_ABI}/libfmod.so" )
  SET(imported_SDL2_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/23/Release/${ANDROID_ABI}/libSDL2.so" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libuSynergy.a")
  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libopenal.a")
  #SET(imported_alut_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libvorbis.so")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libvorbisenc.so")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libvorbisfile.so")



  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )
    FILE(GLOB NJLIGameEngine_LBY
      ${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/lib/${NJLI_BUILD_PLATFORM}/24/${ANDROID_ABI}/libfmod.so
    )
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )

  FILE(GLOB NJLIGameEngine_LBY
    ${NJLIGameEngine_LBY}
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/${NJLI_BUILD_PLATFORM}/23/Release/${ANDROID_ABI}/libSDL2.so
  )

  FIND_LIBRARY(log-lib log)
  FIND_LIBRARY(dl-lib dl)
  FIND_LIBRARY(GLESv2-lib GLESv2)
  FIND_LIBRARY(m-lib m)
  FIND_LIBRARY(c-lib c)
  FIND_LIBRARY(EGL-lib EGL)
  FIND_LIBRARY(stdc++-lib stdc++)
  FIND_LIBRARY(android-lib android)
  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
    FIND_LIBRARY(OpenSLES-lib OpenSLES)
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )

  SET(EXTRA_PLATFORM_LIBS
    ${EXTRA_PLATFORM_LIBS}
    ${log-lib}
    ${dl-lib}
    ${GLESv2-lib}
    ${m-lib}
    ${c-lib}
    ${EGL-lib}
    ${stdc++-lib}
    ${android-lib}
  )

  IF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
    SET(EXTRA_PLATFORM_LIBS
      ${EXTRA_PLATFORM_LIBS}
      ${OpenSLES-lib}
    )
  ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )

  SET( NJLI_RESOURCES ${GAME_ASSETS} )
  SET( NJLI_RESOURCES_FILES ${GAME_ASSETS_FILES} )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "linux" )
  SET(imported_assimp_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/Release/lib/libassimp.a" )
  SET(imported_Bullet2FileLoader_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet2FileLoader.a")
  SET(imported_Bullet3Collision_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Collision.a")
  SET(imported_Bullet3Common_location               "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Common.a")
  SET(imported_Bullet3Dynamics_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Dynamics.a")
  SET(imported_Bullet3Geometry_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Geometry.a")
  SET(imported_Bullet3OpenCL_clew_location          "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3OpenCL_clew.a")
  SET(imported_BulletCollision_location             "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletCollision.a" )
  SET(imported_BulletDynamics_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletDynamics.a" )
  SET(imported_BulletFileLoader_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletFileLoader.a" )
  SET(imported_BulletInverseDynamics_location       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamics.a")
  SET(imported_BulletInverseDynamicsUtils_location  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamicsUtils.a")
  SET(imported_BulletSoftBody_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletSoftBody.a" )
  SET(imported_BulletWorldImporter_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletWorldImporter.a" )
  SET(imported_BulletXmlWorldImporter_location      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletXmlWorldImporter.a" )
  SET(imported_ConvexDecomposition_location         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libConvexDecomposition.a" )
  SET(imported_GIMPACTUtils_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libGIMPACTUtils.a" )
  SET(imported_HACD_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libHACD.a" )
  SET(imported_LinearMath_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libLinearMath.a" )
  SET(imported_flatbuffers_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/lib/Release/libflatbuffers.a")
  SET(imported_imgui_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/Release/libimgui.a" )
  #SET(imported_ImGuizmo_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/Release/libImGuizmo.a" )
  SET(imported_jsoncpp_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/Release/libjsoncpp.a")
  SET(imported_nanovg_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/Release/libnanovg.a" )
  SET(imported_ogg_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/ogg/${NJLI_BUILD_PLATFORM}/Release/libogg.a" )
  #SET(imported_opencv_calib3d_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_calib3d.a")
  #SET(imported_opencv_core_location                 "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/libopencv_core.a")
  #SET(imported_opencv_features2d_location           "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_features2d.a")
  #SET(imported_opencv_flann_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_flann.a")
  #SET(imported_opencv_imgcodecs_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgcodecs.a")
  #SET(imported_opencv_imgproc_location              "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgproc.a")
  #SET(imported_opencv_ml_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_ml.a")
  #SET(imported_opencv_objdetect_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_objdetect.a")
  #SET(imported_opencv_photo_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_photo.a")
  #SET(imported_opencv_shape_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_shape.a")
  #SET(imported_opencv_stitching_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_stitching.a")
  #SET(imported_opencv_video_location                "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_video.a")
  #SET(imported_opencv_videostab_location            "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_videostab.a")
  #SET(imported_IlmImf_location                     "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libIlmImf.a")
  #SET(imported_libjasper_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjasper.a")
  #SET(imported_libjpeg_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjpeg.a")
  #SET(imported_libtiff_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibtiff.a")
  #SET(imported_libwebp_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibwebp.a")
  #SET(imported_zlib_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libzlib.a")
  #SET(imported_sqlite_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/Release/libsqlite3.a")
  SET(imported_stb_location                         "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/Release/libstb.a" )
  #SET(imported_tinyxml2_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/Release/libtinyxml2.a" )
  SET(imported_fmod_location                        "" )
  SET(imported_SDL2_location                        "${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/lib/linux/16.04.2_LTS/Release/libSDL2.so" )
  SET(imported_uSynergy_location                    "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/Release/libuSynergy.a")
  SET(imported_openal_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/openal/${NJLI_BUILD_PLATFORM}/Release/libopenal.a")
  #SET(imported_alut_location                       "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/alut/${NJLI_BUILD_PLATFORM}/Release/libalut.a")
  SET(imported_vorbis_location                      "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbis.a")
  SET(imported_vorbisenc_location                   "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbisenc.a")
  SET(imported_vorbisfile_location                  "${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/vorbis/${NJLI_BUILD_PLATFORM}/Release/libvorbisfile.a")


  #FIND_LIBRARY(log-lib log)
  FIND_LIBRARY(dl-lib dl)
  #FIND_LIBRARY(GLESv2-lib GLESv2)
  FIND_LIBRARY(m-lib m)
  FIND_LIBRARY(c-lib c)
  #FIND_LIBRARY(EGL-lib EGL)
  #FIND_LIBRARY(stdc++-lib stdc++)

  SET(EXTRA_PLATFORM_LIBS
    ${EXTRA_PLATFORM_LIBS}
    ${dl-lib}
    ${m-lib}
    ${c-lib}
  )

  SET( NJLI_RESOURCES ${GAME_ASSETS} )
  SET( NJLI_RESOURCES_FILES ${GAME_ASSETS_FILES} )

ENDIF()

#https://developer.android.com/studio/projects/add-native-code.html
INCLUDE_DIRECTORIES( ${NJLIGameEngine_HDRS} )

INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2/include" )

ADD_LIBRARY(imported_SDL2 SHARED IMPORTED )
SET_TARGET_PROPERTIES(imported_SDL2 PROPERTIES IMPORTED_LOCATION ${imported_SDL2_location})
LIST(APPEND EXTRA_PLATFORM_LIBS imported_SDL2)

IF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/fmod/include" )

  ADD_LIBRARY(imported_fmod SHARED IMPORTED )
  SET_TARGET_PROPERTIES(imported_fmod PROPERTIES IMPORTED_LOCATION ${imported_fmod_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_fmod)
ELSEIF( ${NJLI_SOUND_PLATFORM} STREQUAL "openal" )
  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )
    ADD_LIBRARY(imported_openal STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_openal PROPERTIES IMPORTED_LOCATION ${imported_openal_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_openal)
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )

  #    INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/alut/include" )
  #    ADD_LIBRARY(imported_alut STATIC IMPORTED )
  #    SET_TARGET_PROPERTIES(imported_alut PROPERTIES IMPORTED_LOCATION ${imported_alut_location})
  #    LIST(APPEND EXTRA_PLATFORM_LIBS imported_alut)

  #INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/ogg/include" )
  ADD_LIBRARY(imported_ogg STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_ogg PROPERTIES IMPORTED_LOCATION ${imported_ogg_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_ogg)
  ##MESSAGE("imported_ogg_location ${imported_ogg_location}")

  #INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/vorbis/include" )
  ADD_LIBRARY(imported_vorbis STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_vorbis PROPERTIES IMPORTED_LOCATION ${imported_vorbis_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_vorbis)
  #MESSAGE("imported_vorbis_location ${imported_vorbis_location}")

  ADD_LIBRARY(imported_vorbisenc STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_vorbisenc PROPERTIES IMPORTED_LOCATION ${imported_vorbisenc_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_vorbisenc)

  ADD_LIBRARY(imported_vorbisfile STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_vorbisfile PROPERTIES IMPORTED_LOCATION ${imported_vorbisfile_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_vorbisfile)
ENDIF( ${NJLI_SOUND_PLATFORM} STREQUAL "fmod" )

IF(NJLI_USE_ASSIMP_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/assimp" )

  ADD_LIBRARY(imported_assimp STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_assimp PROPERTIES IMPORTED_LOCATION ${imported_assimp_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_assimp)
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/bullet3" )

  ADD_LIBRARY(imported_Bullet2FileLoader STATIC IMPORTED )
  ADD_LIBRARY(imported_Bullet3Collision STATIC IMPORTED )
  ADD_LIBRARY(imported_Bullet3Common STATIC IMPORTED )
  ADD_LIBRARY(imported_Bullet3Dynamics STATIC IMPORTED )
  ADD_LIBRARY(imported_Bullet3Geometry STATIC IMPORTED )
  ADD_LIBRARY(imported_Bullet3OpenCL_clew STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletCollision STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletDynamics STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletFileLoader STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletInverseDynamics STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletInverseDynamicsUtils STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletSoftBody STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletWorldImporter STATIC IMPORTED )
  ADD_LIBRARY(imported_BulletXmlWorldImporter STATIC IMPORTED )
  ADD_LIBRARY(imported_ConvexDecomposition STATIC IMPORTED )
  ADD_LIBRARY(imported_GIMPACTUtils STATIC IMPORTED )
  ADD_LIBRARY(imported_HACD STATIC IMPORTED )
  ADD_LIBRARY(imported_LinearMath STATIC IMPORTED )

  SET_TARGET_PROPERTIES(imported_Bullet2FileLoader PROPERTIES IMPORTED_LOCATION ${imported_Bullet2FileLoader_location})
  SET_TARGET_PROPERTIES(imported_Bullet3Collision PROPERTIES IMPORTED_LOCATION ${imported_Bullet3Collision_location})
  SET_TARGET_PROPERTIES(imported_Bullet3Common PROPERTIES IMPORTED_LOCATION ${imported_Bullet3Common_location})
  SET_TARGET_PROPERTIES(imported_Bullet3Dynamics PROPERTIES IMPORTED_LOCATION ${imported_Bullet3Dynamics_location})
  SET_TARGET_PROPERTIES(imported_Bullet3Geometry PROPERTIES IMPORTED_LOCATION ${imported_Bullet3Geometry_location})
  SET_TARGET_PROPERTIES(imported_Bullet3OpenCL_clew PROPERTIES IMPORTED_LOCATION ${imported_Bullet3OpenCL_clew_location})
  SET_TARGET_PROPERTIES(imported_BulletCollision PROPERTIES IMPORTED_LOCATION ${imported_BulletCollision_location})
  SET_TARGET_PROPERTIES(imported_BulletDynamics PROPERTIES IMPORTED_LOCATION ${imported_BulletDynamics_location})
  SET_TARGET_PROPERTIES(imported_BulletFileLoader PROPERTIES IMPORTED_LOCATION ${imported_BulletFileLoader_location})
  SET_TARGET_PROPERTIES(imported_BulletInverseDynamics PROPERTIES IMPORTED_LOCATION ${imported_BulletInverseDynamics_location})
  SET_TARGET_PROPERTIES(imported_BulletInverseDynamicsUtils PROPERTIES IMPORTED_LOCATION ${imported_BulletInverseDynamicsUtils_location})
  SET_TARGET_PROPERTIES(imported_BulletSoftBody PROPERTIES IMPORTED_LOCATION ${imported_BulletSoftBody_location})
  SET_TARGET_PROPERTIES(imported_BulletWorldImporter PROPERTIES IMPORTED_LOCATION ${imported_BulletWorldImporter_location})
  SET_TARGET_PROPERTIES(imported_BulletXmlWorldImporter PROPERTIES IMPORTED_LOCATION ${imported_BulletXmlWorldImporter_location})
  SET_TARGET_PROPERTIES(imported_ConvexDecomposition PROPERTIES IMPORTED_LOCATION ${imported_ConvexDecomposition_location})
  SET_TARGET_PROPERTIES(imported_GIMPACTUtils PROPERTIES IMPORTED_LOCATION ${imported_GIMPACTUtils_location})
  SET_TARGET_PROPERTIES(imported_HACD PROPERTIES IMPORTED_LOCATION ${imported_HACD_location})
  SET_TARGET_PROPERTIES(imported_LinearMath PROPERTIES IMPORTED_LOCATION ${imported_LinearMath_location})

  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet2FileLoader )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet3Collision )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet3Common )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet3Dynamics )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet3Geometry )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_Bullet3OpenCL_clew )
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletCollision)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletDynamics)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletFileLoader)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletInverseDynamics)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletInverseDynamicsUtils)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletSoftBody)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletWorldImporter)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_BulletXmlWorldImporter)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_ConvexDecomposition)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_GIMPACTUtils)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_HACD)
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_LinearMath)
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/concurrentqueue")
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/debug-draw")
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/flatbuffers")

  ADD_LIBRARY(imported_flatbuffers STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_flatbuffers PROPERTIES IMPORTED_LOCATION ${imported_flatbuffers_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_flatbuffers)
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/glm" )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/imgui" )

  ADD_LIBRARY(imported_imgui STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_imgui PROPERTIES IMPORTED_LOCATION ${imported_imgui_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_imgui)
ENDIF(NJLI_USE_IMGUI_LIBRARY)

#IF(NJLI_USE_IMGUIZMO_LIBRARY)
#    INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/ImGuizmo" )
#
#    ADD_LIBRARY(imported_ImGuizmo STATIC IMPORTED )
#    SET_TARGET_PROPERTIES(imported_ImGuizmo PROPERTIES IMPORTED_LOCATION ${imported_ImGuizmo_location})
#    LIST(APPEND EXTRA_PLATFORM_LIBS imported_ImGuizmo)
#ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/jsoncpp" )

  ADD_LIBRARY(imported_jsoncpp STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_jsoncpp PROPERTIES IMPORTED_LOCATION ${imported_jsoncpp_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_jsoncpp)
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/nanovg" )

  ADD_LIBRARY(imported_nanovg STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_nanovg PROPERTIES IMPORTED_LOCATION ${imported_nanovg_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_nanovg)
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/opencv" )

  ADD_LIBRARY(imported_opencv_calib3d STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_calib3d PROPERTIES IMPORTED_LOCATION ${imported_opencv_calib3d_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_calib3d)

  ADD_LIBRARY(imported_opencv_core STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_core PROPERTIES IMPORTED_LOCATION ${imported_opencv_core_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_core)

  ADD_LIBRARY(imported_opencv_features2d STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_features2d PROPERTIES IMPORTED_LOCATION ${imported_opencv_features2d_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_features2d)

  ADD_LIBRARY(imported_opencv_flann STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_flann PROPERTIES IMPORTED_LOCATION ${imported_opencv_flann_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_flann)

  ADD_LIBRARY(imported_opencv_imgcodecs STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_imgcodecs PROPERTIES IMPORTED_LOCATION ${imported_opencv_imgcodecs_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_imgcodecs)

  ADD_LIBRARY(imported_opencv_imgproc STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_imgproc PROPERTIES IMPORTED_LOCATION ${imported_opencv_imgproc_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_imgproc)

  ADD_LIBRARY(imported_opencv_ml STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_ml PROPERTIES IMPORTED_LOCATION ${imported_opencv_ml_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_ml)

  ADD_LIBRARY(imported_opencv_objdetect STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_objdetect PROPERTIES IMPORTED_LOCATION ${imported_opencv_objdetect_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_objdetect)

  ADD_LIBRARY(imported_opencv_photo STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_photo PROPERTIES IMPORTED_LOCATION ${imported_opencv_photo_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_photo)

  ADD_LIBRARY(imported_opencv_shape STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_shape PROPERTIES IMPORTED_LOCATION ${imported_opencv_shape_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_shape)

  ADD_LIBRARY(imported_opencv_stitching STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_stitching PROPERTIES IMPORTED_LOCATION ${imported_opencv_stitching_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_stitching)

  ADD_LIBRARY(imported_opencv_video STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_video PROPERTIES IMPORTED_LOCATION ${imported_opencv_video_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_video)

  ADD_LIBRARY(imported_opencv_videostab STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_opencv_videostab PROPERTIES IMPORTED_LOCATION ${imported_opencv_videostab_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_opencv_videostab)
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/sqlite")

  ADD_LIBRARY(imported_sqlite STATIC IMPORTED)
  SET_TARGET_PROPERTIES(imported_sqlite PROPERTIES IMPORTED_LOCATION ${imported_sqlite_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_sqlite)
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/stb" )

  ADD_LIBRARY(imported_stb STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_stb PROPERTIES IMPORTED_LOCATION ${imported_stb_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_stb)
ENDIF(NJLI_USE_STB_LIBRARY)

#IF(NJLI_USE_TINYXML2_LIBRARY)
#    INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/tinyxml2" )
#
#    ADD_LIBRARY(imported_tinyxml2 STATIC IMPORTED )
#    SET_TARGET_PROPERTIES(imported_tinyxml2 PROPERTIES IMPORTED_LOCATION ${imported_tinyxml2_location})
#    LIST(APPEND EXTRA_PLATFORM_LIBS imported_tinyxml2)
#ENDIF(NJLI_USE_TINYXML2_LIBRARY)

IF(NJLI_USE_USYNERGY_LIBRARY)
  INCLUDE_DIRECTORIES("${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/include/usynergy" )

  ADD_LIBRARY(imported_uSynergy STATIC IMPORTED )
  SET_TARGET_PROPERTIES(imported_uSynergy PROPERTIES IMPORTED_LOCATION ${imported_uSynergy_location})
  LIST(APPEND EXTRA_PLATFORM_LIBS imported_uSynergy)
ENDIF(NJLI_USE_USYNERGY_LIBRARY)

LIST(REMOVE_ITEM NJLIGameEngine_SRCS
  ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
)

#SET(Binary_FILES
#  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/lua/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/lua${NJLI_BINARY_EXTENSION}
#  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/lua/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/luac${NJLI_BINARY_EXTENSION}
#  ${CMAKE_SOURCE_DIR}/../External/thirdparty/BUILD/lib/assimp/${NJLI_BUILD_DIR}/Release/bin/assimp${NJLI_ASSIMP_POSTFIX}${NJLI_BINARY_EXTENSION}
#)






# This is a CMake example for Python

#FIND_PACKAGE(SWIG REQUIRED)
#INCLUDE(${SWIG_USE_FILE})
#
#SET(CMAKE_SWIG_FLAGS "-external-runtime ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/swig_runtime.h")
#
#SWIG_ADD_MODULE(runtime lua)
##SWIG_LINK_LIBRARIES(runtime ${PYTHON_LIBRARIES})


SET(SWIG_DEFINE "")
IF(NJLI_USE_ASSIMP_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_ASSIMP_LIBRARY")
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_BULLET_LIBRARY")
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_CONCURRENTQUEUE_LIBRARY")
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_DEBUGDRAW_LIBRARY")
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_FLATBUFFERS_LIBRARY")
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_GLM_LIBRARY")
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_IMGUI_LIBRARY")
ENDIF(NJLI_USE_IMGUI_LIBRARY)

#IF(NJLI_USE_IMGUIZMO_LIBRARY)
#    LIST(APPEND SWIG_DEFINE "USE_IMGUIZMO_LIBRARY")
#ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_JSONCPP_LIBRARY")
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_NANOVG_LIBRARY")
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_OPENCV_LIBRARY")
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_SQLITE_LIBRARY")
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
  LIST(APPEND SWIG_DEFINE "USE_STB_LIBRARY")
ENDIF(NJLI_USE_STB_LIBRARY)

IF(IS_DEBUG AND ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
  LIST(APPEND SWIG_DEFINE "WRAP_EMBIND")
ENDIF(IS_DEBUG AND ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

#IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

ADD_CUSTOM_COMMAND(
  OUTPUT
  ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml
  ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml
  ${CMAKE_CURRENT_BINARY_DIR}/${NJLI_GRAPHICS_PLATFORM}.xml
  COMMAND
  ./swig_njli.sh ${CMAKE_CURRENT_BINARY_DIR} ${NJLI_GRAPHICS_PLATFORM} ${NJLI_SCRIPT_LANGUAGE} ${SWIG_DEFINE}
  WORKING_DIRECTORY
  ${CMAKE_SOURCE_DIR}
  COMMENT
  "Generating SWIG module with swig with ${NJLI_SCRIPT_LANGUAGE}"
  VERBATIM
)
ADD_CUSTOM_TARGET(WrapSWIG ALL
  DEPENDS
  ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml
  ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml
  ${CMAKE_CURRENT_BINARY_DIR}/${NJLI_GRAPHICS_PLATFORM}.xml
  SOURCES
  ${NJLIGameEngine_ITFS}
  ${NJLIGameEngine_THIRDPARTY_ITFS}
)















ADD_CUSTOM_COMMAND(
  OUTPUT
  ${CMAKE_CURRENT_BINARY_DIR}/icons
  COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/icons && sh cmake_icons.sh ${CMAKE_CURRENT_BINARY_DIR}/icons && rm -rf ${CMAKE_CURRENT_BINARY_DIR}/icons
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT
  "Generating the icons for all the platforms"
  VERBATIM
)
ADD_CUSTOM_TARGET(CreateIcons ALL
  DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Back.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Front.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Middle.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/LaunchInput.png
  ${CMAKE_CURRENT_BINARY_DIR}/icons
  SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Back.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Front.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput_Middle.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/IconInput.png
  ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON/icons/LaunchInput.png
)





















SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/lnjli.cpp PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/lbullet.cpp PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/swig_runtime.h PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_BINARY_DIR}/${NJLI_GRAPHICS_PLATFORM}.xml PROPERTIES GENERATED TRUE )

INCLUDE("${CMAKE_SOURCE_DIR}/cmake/njli-source-group.cmake")
IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
  ADD_DEFINITIONS(-DUSE_CONCURRENTQUEUE_LIBRARY=1)
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
  ADD_DEFINITIONS(-DUSE_DEBUGDRAW_LIBRARY=1)
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
  ADD_DEFINITIONS(-DUSE_FLATBUFFERS_LIBRARY=1)
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
  ADD_DEFINITIONS(-DUSE_IMGUI_LIBRARY=1)
ENDIF(NJLI_USE_IMGUI_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
  ADD_DEFINITIONS(-DUSE_OPENCV_LIBRARY=1)
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
  ADD_DEFINITIONS(-DUSE_SQLITE_LIBRARY=1)
ENDIF(NJLI_USE_SQLITE_LIBRARY)

ADD_CUSTOM_COMMAND(
  OUTPUT
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc/index.html
  COMMAND
  ldoc ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc.in/
  WORKING_DIRECTORY
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in
  COMMENT
  "Generating API documentation with LDoc"
  VERBATIM
)

ADD_CUSTOM_TARGET(Ldoc ALL
  DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc/index.html
)




















SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc/index.html PROPERTIES GENERATED TRUE )

ADD_CUSTOM_COMMAND(
  OUTPUT
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html/index.html
  COMMAND
  doxygen ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Doxyfile
  WORKING_DIRECTORY
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in
  COMMENT
  "Generating API documentation with Doxygen"
  VERBATIM
)

ADD_CUSTOM_TARGET(Doxygen ALL
  DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html/index.html
)

SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html/index.html PROPERTIES GENERATED TRUE )

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )
  ADD_LIBRARY( njli SHARED
    # ${NJLIGameEngine_HDRS}
    ${NJLIGameEngine_SRCS}
    ${njli_generated}
    ${njli_generated_swig}
    ${njli_generated_swig_lua}
    ${njli_generated_swig_lua_platform}
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/SDL2-2.0.5/src/main/android/SDL_android_main.c
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.h
    ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.cpp
    ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
    ${NJLIGameEngine_THIRDPARTY_INC}
  )
  TARGET_LINK_LIBRARIES( njli ${EXTRA_PLATFORM_LIBS}
    ${NJLIGameEngine_LBY}
  )
  SET_TARGET_PROPERTIES( njli PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})
  ADD_DEPENDENCIES(njli WrapSWIG)
  ADD_CUSTOM_COMMAND(TARGET njli
    PRE_BUILD
    COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .njli.${NJLI_BUILD_PLATFORM}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )

  IF (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    ADD_CUSTOM_COMMAND(TARGET njli
      PRE_BUILD
      COMMAND export NJLI_GAME_ENGINE_ASSET_DIR=${NJLIGameEngine_COMMON_DIRECTORY} && export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && export NJLI_GRAPHICS_PLATFORM=${NJLI_GRAPHICS_PLATFORM} && export NJLI_SOUND_PLATFORM=${NJLI_SOUND_PLATFORM} &&  make
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON
    )
    ADD_CUSTOM_TARGET(really-clean
      COMMAND export NJLI_GAME_ENGINE_ASSET_DIR=${NJLIGameEngine_COMMON_DIRECTORY} && export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && export NJLI_GRAPHICS_PLATFORM=${NJLI_GRAPHICS_PLATFORM} && export NJLI_SOUND_PLATFORM=${NJLI_SOUND_PLATFORM} && make clean
    )
  ENDIF (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

ELSE()
  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" AND IS_DEBUG )

    ADD_LIBRARY( libnjli_bytecode_shared SHARED
      ${njli_generated_swig_embind}
      ${njli_generated_swig_embind_platform}
    )
    SET_TARGET_PROPERTIES( libnjli_bytecode_shared PROPERTIES OUTPUT_NAME libnjli )
    SET_TARGET_PROPERTIES( libnjli_bytecode_shared PROPERTIES PREFIX "")
    TARGET_LINK_LIBRARIES( libnjli_bytecode_shared ${EXTRA_PLATFORM_LIBS} ${NJLIGameEngine_LBY} )
    SET_TARGET_PROPERTIES( libnjli_bytecode_shared PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})
    ADD_DEPENDENCIES(libnjli_bytecode_shared WrapSWIG)
    ADD_CUSTOM_COMMAND(TARGET libnjli_bytecode_shared PRE_BUILD
      COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .libnjli_bytecode_shared.${NJLI_BUILD_PLATFORM}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )

  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" AND IS_DEBUG )

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${NJLIGameEngine_SRCS} )
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${njli_generated} )
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${njli_generated_swig} )
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${njli_generated_swig_lua} )
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${njli_generated_swig_lua_platform})
    LIST(APPEND unity_build_srcs_NJLIGameEngine ${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h)

    FOREACH(item ${unity_build_srcs_NJLIGameEngine})
      IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
        LIST(REMOVE_ITEM unity_build_srcs_NJLIGameEngine ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

      IF(${item} MATCHES "[A-Za-z0-9/]*swp")
        LIST(REMOVE_ITEM unity_build_srcs_NJLIGameEngine ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
    ENDFOREACH(item)

    IF(${NJLI_UNITY_BUILD})
      enable_unity_build(UnityBuild_NJLIGameEngine "${unity_build_srcs_NJLIGameEngine}")
    ENDIF(${NJLI_UNITY_BUILD})

    ADD_LIBRARY( NJLI
      SHARED
      ${unity_build_srcs_NJLIGameEngine}
    )

    SET_TARGET_PROPERTIES( NJLI PROPERTIES VERSION ${NJLIGameEngine_VERSION})
    SET_TARGET_PROPERTIES( NJLI PROPERTIES SOVERSION ${NJLIGameEngine_VERSION})
    SET_TARGET_PROPERTIES( NJLI PROPERTIES FRAMEWORK true)
    SET_TARGET_PROPERTIES( NJLI PROPERTIES PUBLIC_HEADER ${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h)

    TARGET_LINK_LIBRARIES( NJLI ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} )
    ADD_DEPENDENCIES(NJLI WrapSWIG)
    ADD_CUSTOM_COMMAND(TARGET NJLI PRE_BUILD
      COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .NJLI.${NJLI_BUILD_PLATFORM}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )

  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )


  LIST(APPEND unity_build_srcs_libnjli_static ${NJLIGameEngine_SRCS} )
  LIST(APPEND unity_build_srcs_libnjli_static ${njli_generated} )
  LIST(APPEND unity_build_srcs_libnjli_static ${njli_generated_swig} )
  LIST(APPEND unity_build_srcs_libnjli_static ${njli_generated_swig_lua} )
  LIST(APPEND unity_build_srcs_libnjli_static ${njli_generated_swig_lua_platform})

  FOREACH(item ${unity_build_srcs_libnjli_static})
    IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
      LIST(REMOVE_ITEM unity_build_srcs_libnjli_static ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

    IF(${item} MATCHES "[A-Za-z0-9/]*swp")
      LIST(REMOVE_ITEM unity_build_srcs_libnjli_static ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
  ENDFOREACH(item)

  IF(${NJLI_UNITY_BUILD})
    enable_unity_build(UnityBuild_libnjli_static "${unity_build_srcs_libnjli_static}")
  ENDIF(${NJLI_UNITY_BUILD})

  ADD_LIBRARY( libnjli_static STATIC
    ${unity_build_srcs_libnjli_static}
  )
  SET_TARGET_PROPERTIES( libnjli_static PROPERTIES OUTPUT_NAME libnjli )
  SET_TARGET_PROPERTIES( libnjli_static PROPERTIES PREFIX "")
  TARGET_LINK_LIBRARIES( libnjli_static ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} )
  SET_TARGET_PROPERTIES( libnjli_static PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})
  SET_TARGET_PROPERTIES( libnjli_static PROPERTIES PUBLIC_HEADER ${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h)
  ADD_DEPENDENCIES(libnjli_static WrapSWIG)
  ADD_CUSTOM_COMMAND(TARGET libnjli_static PRE_BUILD
    COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .libnjli_static.${NJLI_BUILD_PLATFORM}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

    # LIST(APPEND unity_build_srcs_lua ${NJLIGameEngine_SRCS})
    # LIST(APPEND unity_build_srcs_lua ${njli_generated})
    # LIST(APPEND unity_build_srcs_lua ${njli_generated_swig})
    # LIST(APPEND unity_build_srcs_lua ${njli_generated_swig_lua})
    # LIST(APPEND unity_build_srcs_lua ${njli_generated_swig_lua_platform})
    LIST(APPEND unity_build_srcs_lua "${NJLI_SOURCE_DIRECTORY}/lua/src/lua.c")

    FOREACH(item ${unity_build_srcs_lua})
      IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
        LIST(REMOVE_ITEM unity_build_srcs_lua ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

      IF(${item} MATCHES "[A-Za-z0-9/]*swp")
        LIST(REMOVE_ITEM unity_build_srcs_lua ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
    ENDFOREACH(item)

    IF(${NJLI_UNITY_BUILD})
      enable_unity_build(UnityBuild_lua "${unity_build_srcs_lua}")
    ENDIF(${NJLI_UNITY_BUILD})

    ADD_EXECUTABLE ( lua
      ${unity_build_srcs_lua}
      ${LUA_ASSETS}
    )
    SET_TARGET_PROPERTIES( lua PROPERTIES RESOURCE "${LUA_ASSETS}" )
    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
      IF(IS_DEBUG)
        TARGET_LINK_LIBRARIES( lua ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/lua/debug_shell.html" libnjli_static)
      ELSE()
        TARGET_LINK_LIBRARIES( lua ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/lua/release_shell.html" libnjli_static)
      ENDIF(IS_DEBUG)
    ELSE()
      TARGET_LINK_LIBRARIES( lua ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} libnjli_static)
    ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

    SET_SOURCE_FILES_PROPERTIES(
      ${LUA_ASSETS}
      PROPERTIES
      MACOSX_PACKAGE_LOCATION ${NJLI_PRODUCT_NAME}/Contents/Resources/
    )
    ADD_DEPENDENCIES(lua WrapSWIG)
    ADD_DEPENDENCIES(lua libnjli_static)

    # LIST(APPEND unity_build_srcs_luac ${NJLIGameEngine_SRCS})
    # LIST(APPEND unity_build_srcs_luac ${njli_generated})
    # LIST(APPEND unity_build_srcs_luac ${njli_generated_swig})
    # LIST(APPEND unity_build_srcs_luac ${njli_generated_swig_lua})
    # LIST(APPEND unity_build_srcs_luac ${njli_generated_swig_lua_platform})
    LIST(APPEND unity_build_srcs_luac "${NJLI_SOURCE_DIRECTORY}/lua/src/luac.c")

    FOREACH(item ${unity_build_srcs_luac})
      IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
        LIST(REMOVE_ITEM unity_build_srcs_luac ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

      IF(${item} MATCHES "[A-Za-z0-9/]*swp")
        LIST(REMOVE_ITEM unity_build_srcs_luac ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
    ENDFOREACH(item)

    IF(${NJLI_UNITY_BUILD})
      enable_unity_build(UnityBuild_luac "${unity_build_srcs_luac}")
    ENDIF(${NJLI_UNITY_BUILD})

    ADD_EXECUTABLE ( luac
      ${unity_build_srcs_luac}
      ${LUAC_ASSETS}
    )

    SET_TARGET_PROPERTIES( luac PROPERTIES RESOURCE "${LUAC_ASSETS}" )
    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
      IF(IS_DEBUG)
        TARGET_LINK_LIBRARIES( luac ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/luac/debug_shell.html" libnjli_static)
      ELSE()
        TARGET_LINK_LIBRARIES( luac ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/luac/release_shell.html" libnjli_static)
      ENDIF(IS_DEBUG)
    ELSE()
      TARGET_LINK_LIBRARIES( luac ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} libnjli_static)
    ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

    SET_SOURCE_FILES_PROPERTIES(
      ${LUAC_ASSETS}
      PROPERTIES
      MACOSX_PACKAGE_LOCATION ${NJLI_PRODUCT_NAME}/Contents/Resources/
    )
    ADD_DEPENDENCIES(luac WrapSWIG)
    ADD_DEPENDENCIES(luac libnjli_static)

    LIST(APPEND unity_build_srcs_libnjli_lua_module ${NJLIGameEngine_SRCS} )
    LIST(APPEND unity_build_srcs_libnjli_lua_module ${njli_generated} )
    LIST(APPEND unity_build_srcs_libnjli_lua_module ${njli_generated_swig} )
    LIST(APPEND unity_build_srcs_libnjli_lua_module ${njli_generated_swig_lua})
    LIST(APPEND unity_build_srcs_libnjli_lua_module ${njli_generated_swig_lua_platform})

    FOREACH(item ${unity_build_srcs_libnjli_lua_module})
      IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
        LIST(REMOVE_ITEM unity_build_srcs_libnjli_lua_module ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

      IF(${item} MATCHES "[A-Za-z0-9/]*swp")
        LIST(REMOVE_ITEM unity_build_srcs_libnjli_lua_module ${item})
      ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
    ENDFOREACH(item)

    IF(${NJLI_UNITY_BUILD})
      enable_unity_build(UnityBuild_libnjli_lua_module "${unity_build_srcs_libnjli_lua_module}")
    ENDIF(${NJLI_UNITY_BUILD})

    ADD_LIBRARY( libnjli_lua_module MODULE
      ${unity_build_srcs_libnjli_lua_module}
    )
    SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES OUTPUT_NAME njli )
    SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES PREFIX "")
    TARGET_LINK_LIBRARIES( libnjli_lua_module ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} )
    SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})
    SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES PUBLIC_HEADER ${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h)
    ADD_DEPENDENCIES(libnjli_lua_module WrapSWIG)
    ADD_CUSTOM_COMMAND(TARGET libnjli_lua_module PRE_BUILD
      COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .libnjli_lua_module.${NJLI_BUILD_PLATFORM}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )

  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten")

  #IF( NOT ${NJLI_BUILD_PLATFORM} STREQUAL "linux")

  LIST(APPEND unity_build_srcs_libnjli_shared ${NJLIGameEngine_SRCS} )
  LIST(APPEND unity_build_srcs_libnjli_shared ${njli_generated} )
  LIST(APPEND unity_build_srcs_libnjli_shared ${njli_generated_swig})
  LIST(APPEND unity_build_srcs_libnjli_shared ${njli_generated_swig_lua})
  LIST(APPEND unity_build_srcs_libnjli_shared ${njli_generated_swig_lua_platform} )

  FOREACH(item ${unity_build_srcs_libnjli_shared})
    IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
      LIST(REMOVE_ITEM unity_build_srcs_libnjli_shared ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

    IF(${item} MATCHES "[A-Za-z0-9/]*swp")
      LIST(REMOVE_ITEM unity_build_srcs_libnjli_shared ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
  ENDFOREACH(item)

  IF(${NJLI_UNITY_BUILD})
    enable_unity_build(UnityBuild_libnjli_shared "${unity_build_srcs_libnjli_shared}")
  ENDIF(${NJLI_UNITY_BUILD})

  ADD_LIBRARY( libnjli_shared SHARED
    ${unity_build_srcs_libnjli_shared}
  )

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )
    SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{NJLI_DEVELOPMENT_TEAM})
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )
  SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES OUTPUT_NAME libnjli )
  SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES PREFIX "")
  TARGET_LINK_LIBRARIES( libnjli_shared ${EXTRA_PLATFORM_LIBS} ${NJLIGameEngine_LBY} )
  SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})
  SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES PUBLIC_HEADER ${NJLI_SOURCE_DIRECTORY}/njli/platform/Engine.h)
  ADD_DEPENDENCIES(libnjli_shared WrapSWIG)
  ADD_CUSTOM_COMMAND(TARGET libnjli_shared PRE_BUILD
    COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .libnjli_shared.${NJLI_BUILD_PLATFORM}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )

  LIST(APPEND unity_build_srcs_EngineSource ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.cpp )
  LIST(APPEND unity_build_srcs_EngineSource ${CMAKE_SOURCE_DIR}/../External/thirdparty/android_file.h )
  #LIST(APPEND unity_build_srcs_EngineSource ${NJLIGameEngine_SRCS} )
  #LIST(APPEND unity_build_srcs_EngineSource ${njli_generated} )
  #LIST(APPEND unity_build_srcs_EngineSource ${njli_generated_swig} )
  #LIST(APPEND unity_build_srcs_EngineSource ${njli_generated_swig_lua} )
  #LIST(APPEND unity_build_srcs_EngineSource ${njli_generated_swig_lua_platform} )
  LIST(APPEND unity_build_srcs_EngineSource ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp )
  LIST(APPEND unity_build_srcs_EngineSource ${NJLIGameEngine_THIRDPARTY_INC} )

  FOREACH(item ${unity_build_srcs_EngineSource})
    IF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")
      LIST(REMOVE_ITEM unity_build_srcs_EngineSource ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*DS_Store")

    IF(${item} MATCHES "[A-Za-z0-9/]*swp")
      LIST(REMOVE_ITEM unity_build_srcs_EngineSource ${item})
    ENDIF(${item} MATCHES "[A-Za-z0-9/]*swp")
  ENDFOREACH(item)

  IF(${NJLI_UNITY_BUILD})
    enable_unity_build(UnityBuild_EngineSource "${unity_build_srcs_EngineSource}")
  ENDIF(${NJLI_UNITY_BUILD})

  ADD_EXECUTABLE( ${NJLI_PRODUCT_NAME}
    ${unity_build_srcs_EngineSource}
    ${NJLI_RESOURCES}
  )
  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" AND IS_DEBUG )
    TARGET_LINK_LIBRARIES( ${NJLI_PRODUCT_NAME} libnjli_bytecode_shared)
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" AND IS_DEBUG )
  TARGET_LINK_LIBRARIES( ${NJLI_PRODUCT_NAME} libnjli_static)
  ADD_DEPENDENCIES(${NJLI_PRODUCT_NAME} WrapSWIG)
  ADD_DEPENDENCIES(${NJLI_PRODUCT_NAME} libnjli_static)
  ADD_CUSTOM_COMMAND(TARGET ${NJLI_PRODUCT_NAME} PRE_BUILD
    COMMAND sh ${CMAKE_CURRENT_SOURCE_DIR}/njli-build-count.sh .${NJLI_PRODUCT_NAME}.${NJLI_BUILD_PLATFORM}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )

  #SET_TARGET_PROPERTIES( ${NJLI_PRODUCT_NAME} PROPERTIES OUTPUT_NAME ${NJLI_PRODUCT_NAME} )
  #SET_TARGET_PROPERTIES( ${NJLI_PRODUCT_NAME} PROPERTIES VERSION ${NJLIGameEngine_VERSION} SOVERSION ${NJLIGameEngine_VERSION_MAJOR})

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
    SET_TARGET_PROPERTIES (
      ${NJLI_PRODUCT_NAME} PROPERTIES
      XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
      XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${NJLI_DEVICE_FAMILY}
      XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
      XCODE_ATTRIBUTE_INSTALL_PATH "${CMAKE_BINARY_DIR}/ProductRelease"
      XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
      XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME "LaunchImage"
      XCODE_ATTRIBUTE_ENABLE_BITCODE TRUE
    )
  ENDIF()

  SET_TARGET_PROPERTIES(
    ${NJLI_PRODUCT_NAME} PROPERTIES
    RESOURCE "${NJLI_RESOURCES}"
  )

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" OR ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

    SET(MACOSX_BUNDLE_BUNDLE_NAME ${NJLI_PRODUCT_NAME})

    SET_SOURCE_FILES_PROPERTIES(
      ${NJLI_RESOURCES}
      PROPERTIES
      MACOSX_PACKAGE_LOCATION ${NJLI_PRODUCT_NAME}/Contents/Resources/
    )

    SET_TARGET_PROPERTIES(
      ${NJLI_PRODUCT_NAME} PROPERTIES
      MACOSX_BUNDLE TRUE
      MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Info.plist"
      XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME ${NJLI_APPICON_NAME}
      XCODE_ATTRIBUTE_PRODUCT_NAME ${NJLI_PRODUCT_NAME}
      XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.njligames.engine.${NJLI_BUILD_PLATFORM}.source"
      XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{NJLI_DEVELOPMENT_TEAM}
    )

  ENDIF()

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    IF(IS_DEBUG)
      TARGET_LINK_LIBRARIES( ${NJLI_PRODUCT_NAME} ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/executable/debug_shell.html" libnjli_static)
    ELSE()
      TARGET_LINK_LIBRARIES( ${NJLI_PRODUCT_NAME} ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} "--shell-file ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/executable/release_shell.html" libnjli_static)
    ENDIF(IS_DEBUG)
  ELSE()
    TARGET_LINK_LIBRARIES( ${NJLI_PRODUCT_NAME} ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} libnjli_static)
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

  IF (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    ADD_CUSTOM_COMMAND(TARGET ${NJLI_PRODUCT_NAME}
      PRE_BUILD
      COMMAND export NJLI_GAME_ENGINE_ASSET_DIR=${NJLIGameEngine_COMMON_DIRECTORY} && export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && export NJLI_GRAPHICS_PLATFORM=${NJLI_GRAPHICS_PLATFORM} && export NJLI_SOUND_PLATFORM=${NJLI_SOUND_PLATFORM} && make
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON
      )
    ADD_CUSTOM_TARGET(really-clean
      COMMAND export NJLI_GAME_ENGINE_ASSET_DIR=${NJLIGameEngine_COMMON_DIRECTORY} && export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && export NJLI_GRAPHICS_PLATFORM=${NJLI_GRAPHICS_PLATFORM} && export NJLI_SOUND_PLATFORM=${NJLI_SOUND_PLATFORM} && make clean
      )
  ENDIF (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
    INSTALL(TARGETS NJLI
      FRAMEWORK DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/framework
      )
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )

INSTALL(TARGETS libnjli_static libnjli_shared
  INCLUDES DESTINATION include
  ARCHIVE DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/lib/static
  LIBRARY DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/lib
  RUNTIME DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin
  BUNDLE DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bundle
  PRIVATE_HEADER DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/private_header
  PUBLIC_HEADER DESTINATION include
  RESOURCE DESTINATION ${NJLI_PRODUCT_NAME}/Contents/Resources
)
IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten")
  INSTALL(TARGETS libnjli_lua_module
    INCLUDES DESTINATION include
    RUNTIME DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin
    LIBRARY DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/lib
    PUBLIC_HEADER DESTINATION include
    RESOURCE DESTINATION ${NJLI_PRODUCT_NAME}/Contents/Resources
  )
  #INSTALL(PROGRAMS ${Binary_FILES} DESTINATION platform/${NJLI_BUILD_DIR}/bin/thirdparty )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" OR ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten")

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  #http://git.quintin.ninja/mjones/Dolphin/blob/1bd42b7acc0611e7120e4a16c442fd09f575a297/Source/Core/DolphinWX/CMakeLists.txt
  #INCLUDE(BundleUtilities)
  SET(BUNDLE_PATH ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/${NJLI_PRODUCT_NAME}.app)

  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )
    #IF(IS_RELEASE)
      file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/postprocess_bundle.cmake "
      message(\"Signing application bundle: ${BUNDLE_PATH}\")
      # https://www.slicer.org/wiki/Documentation/Nightly/Developers/Mac_OS_X_Code_Signing
      execute_process(
        COMMAND codesign --deep --force --sign \"$ENV{NJLI_DEVELOPMENT_TEAM}\" -i \"com.njligames.engine.${NJLI_BUILD_PLATFORM}.source\" \"${BUNDLE_PATH}\"
        )
      execute_process(
        COMMAND codesign -dv \"${BUNDLE_PATH}\"
        )
      ")
      add_custom_command(TARGET ${NJLI_PRODUCT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -P postprocess_bundle.cmake
        )
      #ENDIF(IS_RELEASE)
  ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
    #IF(IS_RELEASE)
      file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/postprocess_bundle.cmake "
      message(\"Signing application bundle: ${BUNDLE_PATH}\")
      # https://www.slicer.org/wiki/Documentation/Nightly/Developers/Mac_OS_X_Code_Signing
      execute_process(
        COMMAND codesign --deep --force --sign \"$ENV{NJLI_DEVELOPMENT_TEAM}\" -i \"com.njligames.engine.${NJLI_BUILD_PLATFORM}.source\" \"${BUNDLE_PATH}\"
        )
      execute_process(
        COMMAND codesign -dv \"${BUNDLE_PATH}\"
        )
      ")
      add_custom_command(TARGET ${NJLI_PRODUCT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/postprocess_bundle.cmake
        )
      #ENDIF(IS_RELEASE)
  ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
    #IF(IS_RELEASE)
      file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/postprocess_bundle.cmake "
      include(BundleUtilities)
      message(\"Fixing up application bundle: ${BUNDLE_PATH}\")
      fixup_bundle(\"${BUNDLE_PATH}\" \"\" \"${GAME_ASSETS}\")
      ")
      add_custom_command(TARGET ${NJLI_PRODUCT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -P postprocess_bundle.cmake
        )
      #ENDIF(IS_RELEASE)
    INSTALL(TARGETS lua luac RUNTIME DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin )
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )

  INSTALL( DIRECTORY ${BUNDLE_PATH} DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin USE_SOURCE_PERMISSIONS )
else()
  IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

    SET(ENGINESOURCE_HTML_BUNDLE_PATH platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/${NJLI_PRODUCT_NAME})
    INSTALL(TARGETS ${NJLI_PRODUCT_NAME} RUNTIME DESTINATION ${ENGINESOURCE_HTML_BUNDLE_PATH} )
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${NJLI_PRODUCT_NAME}.html.mem DESTINATION ${ENGINESOURCE_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${NJLI_PRODUCT_NAME}.asm.js DESTINATION ${ENGINESOURCE_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${NJLI_PRODUCT_NAME}.js DESTINATION ${ENGINESOURCE_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/executable/favicon-32x32.ico DESTINATION ${ENGINESOURCE_HTML_BUNDLE_PATH})

    SET(LUA_HTML_BUNDLE_PATH platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/lua)
    INSTALL(TARGETS lua RUNTIME DESTINATION ${LUA_HTML_BUNDLE_PATH} )
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/lua.html.mem DESTINATION ${LUA_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/lua.asm.js DESTINATION ${LUA_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/lua.js DESTINATION ${LUA_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/lua/favicon-32x32.ico DESTINATION ${LUA_HTML_BUNDLE_PATH})

    SET(LUAC_HTML_BUNDLE_PATH platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/luac)
    INSTALL(TARGETS luac RUNTIME DESTINATION ${LUAC_HTML_BUNDLE_PATH} )
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/luac.html.mem DESTINATION ${LUAC_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/luac.asm.js DESTINATION ${LUAC_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_BINARY_DIR}/${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/luac.js DESTINATION ${LUAC_HTML_BUNDLE_PATH})
    INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/emscripten/luac/favicon-32x32.ico DESTINATION ${LUAC_HTML_BUNDLE_PATH})

  else()
    INSTALL(TARGETS lua luac ${NJLI_PRODUCT_NAME} RUNTIME DESTINATION platform/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin )
  ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

endif()

INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc DESTINATION ${CMAKE_INSTALL_DOCDIR})
INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html DESTINATION ${CMAKE_INSTALL_DOCDIR})
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml DESTINATION ${CMAKE_INSTALL_DATADIR}/swig/lua)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml DESTINATION ${CMAKE_INSTALL_DATADIR}/swig/lua)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/${NJLI_GRAPHICS_PLATFORM}.xml DESTINATION ${CMAKE_INSTALL_DATADIR}/swig/lua)
INSTALL(FILES ${NJLIGameEngine_DATAFILES} DESTINATION ${CMAKE_INSTALL_DATADIR})
INSTALL(FILES ${NJLIGameEngine_TESTFILES} DESTINATION ${CMAKE_INSTALL_TESTDIR})


# https://cmake.org/Wiki/CMake:CPackConfiguration

INCLUDE (InstallRequiredSystemLibraries)

#SET (CPACK_BUNDLE_ICON ${CMAKE_SOURCE_DIR}/projects/COMMON/icons/IconInput.png)
#SET (CPACK_PACKAGE_ICON ${CMAKE_SOURCE_DIR}/projects/COMMON/icons/IconInput.png)
SET (CPACK_OUTPUT_FILE_PREFIX ${NJLI_PACKAGE_DIR})
SET (CPACK_PACKAGE_NAME ${NJLIGameEngine_PACKAGE})
SET (CPACK_PACKAGE_VENDOR "NJLI Games LLC.")
SET (CPACK_PACKAGE_DESCRIPTION_SUMMARY ${NJLIGameEngine_PACKAGE_STRING})
SET (CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
SET (CPACK_PACKAGE_VERSION_MAJOR "${NJLIGameEngine_VERSION_MAJOR}")
SET (CPACK_PACKAGE_VERSION_MINOR "${NJLIGameEngine_VERSION_MINOR}")
SET (CPACK_PACKAGE_VERSION_RELEASE "${NJLIGameEngine_VERSION_RELEASE}")
SET (CPACK_PACKAGE_VERSION_PATCH "local")

if (NOT $ENV{NJLIGameEngine_BUILD_NUMBER})
  SET (CPACK_PACKAGE_VERSION_PATCH $ENV{NJLIGameEngine_BUILD_NUMBER})
endif (NOT $ENV{NJLIGameEngine_BUILD_NUMBER})
INCLUDE(CPack)

ENDIF()
