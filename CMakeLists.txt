cmake_minimum_required(VERSION 3.4.1)

PROJECT (${NJLI_BUILD_PLATFORM})

#set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG")
#set(CMAKE_C_FLAGS_DEBUG "-DDEBUG")

# The version number.
SET ( NJLIGameEngine_VERSION_MAJOR 1 )
SET ( NJLIGameEngine_VERSION_MINOR 0 )

SET ( CMAKE_INSTALL_INCLUDEDIR include/ CACHE STRING "The include directory" )
SET ( CMAKE_INSTALL_DATADIR data/ CACHE STRING "The data directory" )
SET ( CMAKE_INSTALL_DOCDIR doc/ CACHE STRING "The documentation directory" )
SET ( CMAKE_INSTALL_TESTDIR tests/ CACHE STRING "The tests directory" )
SET ( NJLI_THIRDPARTY_DIRECTORY "${CMAKE_SOURCE_DIR}/../External/thirdparty/" CACHE STRING "The third party include directory" )
SET ( NJLI_GRAPHICS_PLATFORM opengl_es_2 CACHE STRING  "The rendering platform to use" )
SET ( NJLI_BUILD_PLATFORM macOS CACHE STRING "The platform being created" )
SET ( NJLI_SOUND_PLATFORM fmod CACHE STRING "The sound to use" )
SET ( NJLI_SOURCE_DIRECTORY "${CMAKE_SOURCE_DIR}/src" CACHE STRING "The njli source directory" )
SET ( NJLI_SWIGIN_DIRECTORY "${CMAKE_SOURCE_DIR}/src/swig.in" CACHE STRING "The njli source directory" )
SET ( NJLI_THIRDPARTY_SWIGIN_DIRECTORY "${NJLI_THIRDPARTY_DIRECTORY}/swig.in" CACHE STRING "The njli source directory" )

OPTION(NJLI_USE_ASSIMP_LIBRARY "Use assimp library"                    OFF)
OPTION(NJLI_USE_BULLET_LIBRARY "Use bullet library"                    ON)
OPTION(NJLI_USE_CONCURRENTQUEUE_LIBRARY "Use concurrent queue library" OFF)
OPTION(NJLI_USE_DEBUGDRAW_LIBRARY "Use debug-draw library"             ON)
OPTION(NJLI_USE_FLATBUFFERS_LIBRARY "Use flatbuffers library"          OFF)
OPTION(NJLI_USE_GLM_LIBRARY "Use glm library"                          ON)
OPTION(NJLI_USE_IMGUI_LIBRARY "Use imgui library"                      ON)
OPTION(NJLI_USE_IMGUIZMO_LIBRARY "Use ImGuizmo library"                ON)
OPTION(NJLI_USE_JSONCPP_LIBRARY "Use jsoncp library"                   ON)
OPTION(NJLI_USE_NANOVG_LIBRARY "Use nanovg library"                    ON)
OPTION(NJLI_USE_OPENCV_LIBRARY "Use opencv library"                    OFF)
OPTION(NJLI_USE_SQLITE_LIBRARY "Use sqlite library"                    OFF)
OPTION(NJLI_USE_STB_LIBRARY "Use stb library"                          OFF)
OPTION(NJLI_USE_USYNERGY_LIBRARY "Use usynergy library"                ON)

#OPTION(NJLI_USE_TINYXML2_LIBRARY "Use tinyxml2 library"                OFF)

IF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_es_2" )
    ADD_DEFINITIONS(-DNJLI_GL_ES2)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_es_3" )
    ADD_DEFINITIONS(-DNJLI_GL_ES3)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_2" )
    ADD_DEFINITIONS(-DNJLI_GL_2)
ELSEIF( ${NJLI_GRAPHICS_PLATFORM} STREQUAL "opengl_3" )
    ADD_DEFINITIONS(-DNJLI_GL_3)
ENDIF()

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

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    ADD_DEFINITIONS(-DUSE_IMGUIZMO_LIBRARY=1)
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

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
IF( ${NJLI_BUILD_PLATFORM} EQUAL macOS )
    SET( NJLI_FMOD_EXTENSION "dylib" )
ELSEIF( ${NJLI_BUILD_PLATFORM} EQUAL android )
    SET( NJLI_FMOD_EXTENSION "so" )
ENDIF()

# configure a header file to pass some of the CMake settings
# to the source code
CONFIGURE_FILE (
    "${CMAKE_SOURCE_DIR}/cmake.in/NJLIGameEngineConfig.h.in"
    "${NJLI_SOURCE_DIRECTORY}/njli/generated/NJLIGameEngineConfig.h"
    )

SET(NJLIGameEngine_TESTFILES
    ${CMAKE_SOURCE_DIR}/cmake.in/Tests.in/lua/njli_test.lua
    )
INSTALL(FILES ${NJLIGameEngine_TESTFILES} DESTINATION ${CMAKE_INSTALL_TESTDIR})

SET(NJLIGameEngine_DATAFILES
    ${CMAKE_SOURCE_DIR}/cmake.in/DoxyFiles.in/images/logo.png
    )
INSTALL(FILES ${NJLIGameEngine_DATAFILES} DESTINATION ${CMAKE_INSTALL_DATADIR})

    
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
    ${group_other}
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
    ${NJLI_THIRDPARTY_DIRECTORY}
    ${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include
    ${NJLI_THIRDPARTY_DIRECTORY}/fmod/include 
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

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    LIST(APPEND NJLIGameEngine_HDRS
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include 
		/Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/emscripten
        )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

IF(NJLI_USE_ASSIMP_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp 
        )
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/autogenerated 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/shared 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/shared 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Geometry 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Initialize 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/BroadphaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionDispatch 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionShapes 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/Gimpact 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Character 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/ConstraintSolver 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Dynamics 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Featherstone 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/MLCPSolvers 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Vehicle 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/autogenerated 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/details 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletSoftBody 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletWorldImporter 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletXmlWorldImporter 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/ConvexDecomposition 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/GIMPACTUtils 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/HACD 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/InverseDynamics 
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/LinearMath 
        )
ENDIF(NJLI_USE_BULLET_LIBRARY)

IF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/concurrentqueue 
        )
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/debug-draw 
        )
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/flatbuffers 
        )
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm 
        )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/imgui 
        )
ENDIF(NJLI_USE_IMGUI_LIBRARY)

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo 
        )
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp 
        )
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg 
        )
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/opencv 
        )
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/sqlite 
        )
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
    LIST(APPEND NJLIGameEngine_HDRS
        ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb 
        )
ENDIF(NJLI_USE_STB_LIBRARY)

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/*.hpp
    ${NJLI_THIRDPARTY_DIRECTORY}/*.c
    ${NJLI_THIRDPARTY_DIRECTORY}/*.cpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/.*([.]h|[.]hpp|[.]c|[.]cpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND third_party_directory ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND assimp ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND assimp_assimp ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/Compiler/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/Compiler/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/Compiler/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp/assimp/Compiler/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND assimp_assimp_Compiler ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3 ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet2FileLoader ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet2FileLoader/autogenerated/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet2FileLoader_autogenerated ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Collision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Collision_BroadPhaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/BroadPhaseCollision/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Collision_BroadPhaseCollision_shared ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Collision_NarrowPhaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Collision/NarrowPhaseCollision/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Collision_NarrowPhaseCollision_shared ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Common ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/shared/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/shared/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/shared/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Common/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Common_shared ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Dynamics ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/ConstraintSolver/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Dynamics_ConstraintSolver ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/shared/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/shared/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/shared/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Dynamics/shared/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Dynamics_shared ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Geometry/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Geometry/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Geometry/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3Geometry/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3Geometry ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_BroadphaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/BroadphaseCollision/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_BroadphaseCollision_kernels ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Initialize/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Initialize/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_Initialize ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_NarrowphaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/NarrowphaseCollision/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_NarrowphaseCollision/kernels ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_ParallelPrimitives ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/ParallelPrimitives/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_ParallelPrimitives_kernels ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_Raycast ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/Raycast/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_Raycast_kernels ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_RigidBody ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/Bullet3OpenCL/RigidBody/kernels/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_Bullet3OpenCL_RigidBody_kernels ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/BroadphaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision_BroadphaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionDispatch/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionDispatch/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision_CollisionDispatch ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionShapes/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/CollisionShapes/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision_CollisionShapes ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/Gimpact/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/Gimpact/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/Gimpact/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/Gimpact/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision_Gimpact ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletCollision/NarrowPhaseCollision/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletCollision_NarrowPhaseCollision ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Character/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Character/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Character/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Character/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_Character ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/ConstraintSolver/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_ConstraintSolver ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Dynamics/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Dynamics/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Dynamics/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Dynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_Dynamics ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Featherstone/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Featherstone/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Featherstone/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Featherstone/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_Featherstone ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/MLCPSolvers/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_MLCPSolvers ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Vehicle/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Vehicle/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Vehicle/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletDynamics/Vehicle/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletDynamics_Vehicle ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletFileLoader ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/autogenerated/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletFileLoader/autogenerated/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletFileLoader_autogenerated ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletInverseDynamics ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/details/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/details/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/details/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletInverseDynamics/details/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletInverseDynamics_details ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletSoftBody/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletSoftBody/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletSoftBody/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletSoftBody/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletSoftBody ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletWorldImporter/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletWorldImporter/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletWorldImporter/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletWorldImporter/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletWorldImporter ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletXmlWorldImporter/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletXmlWorldImporter/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletXmlWorldImporter/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/BulletXmlWorldImporter/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_BulletXmlWorldImporter ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/ConvexDecomposition/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/ConvexDecomposition/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/ConvexDecomposition/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/ConvexDecomposition/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_ConvexDecomposition ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/GIMPACTUtils/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/GIMPACTUtils/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/GIMPACTUtils/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/GIMPACTUtils/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_GIMPACTUtils ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/HACD/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/HACD/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/HACD/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/HACD/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_HACD ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/InverseDynamics/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/InverseDynamics/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/InverseDynamics/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/InverseDynamics/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_InverseDynamics ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/LinearMath/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/LinearMath/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/LinearMath/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3/LinearMath/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND bullet3_LinearMath ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND jsoncpp ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/json/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/json/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/json/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp/json/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND jsoncpp_json ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND ImGuizmo ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm_glm ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/detail/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/detail/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/detail/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/detail/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm_glm_detail ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtc/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtc/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtc/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtc/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm_glm_gtc ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtx/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtx/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtx/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/gtx/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm_glm_gtx ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/simd/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/simd/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/simd/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm/glm/simd/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND glm_glm_simd ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND nanovg ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND stb ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/tinyxml2/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/tinyxml2/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/tinyxml2/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/tinyxml2/.*([.]h|[.]inl|[.]hpp)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND tinyxml2 ${filename})
    ELSE()
        LIST(APPEND group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    ${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include/*.h
    ${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include/*.inl
    ${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include/*.hpp
    )
SET(REG "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include/.*([.]h|[.]inl|[.]hpp)")
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
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/*.h
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/*.inl
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/*.hpp
        )
    FILE( GLOB emscripten_include_emscripten
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/emscripten/*.h
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/emscripten/*.inl
        /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/emscripten/*.hpp
        )

    LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
        ${emscripten_include} 
        ${emscripten_include_emscripten} 
        )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

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

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    LIST(APPEND NJLIGameEngine_THIRDPARTY_INC
        ${ImGuizmo} 
        )
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

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

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/graphics/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/graphics/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/graphics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_graphics ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/body/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/body/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/body/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_physics_body ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/constraint/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/constraint/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/constraint/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_physics_constraint ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

file( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/shape/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/shape/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/physics/shape/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_physics_shape ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/platform/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/platform/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/platform/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_platform ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

file( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/sound*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/sound*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/sound.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_sound ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_steering ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/behavior/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/behavior/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/builders/steering/behavior/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_builders_steering_behavior ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/graphics/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/graphics/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/graphics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_graphics ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_physics ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/body/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/body/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/body/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_physics_body ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/constraint/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/constraint/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/constraint/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_physics_constraint ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/shape/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/shape/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/physics/shape/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_physics_shape ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/platform/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/platform/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/platform/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_platform ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/sound/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/sound/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/sound/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_sound ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_steering ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/behavior/*.i"
    "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/behavior/*.swg"
    )
SET(REG "${NJLI_SWIGIN_DIRECTORY}/lua/njli/steering/behavior/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_lua_njli_steering_behavior ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

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
)









FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/*.swg"
    )
SET(REG "${NJLI_SOURCE_DIRECTORY}/swig.in/lua/bullet3/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3 ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/BroadphaseCollision/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/BroadphaseCollision/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/BroadphaseCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision_BroadphaseCollision ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionDispatch/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionDispatch/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionDispatch/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision_CollisionDispatch ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionShapes/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionShapes/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/CollisionShapes/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision_CollisionShapes ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/Gimpact/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/Gimpact/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/Gimpact/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision_Gimpact ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/NarrowPhaseCollision/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/NarrowPhaseCollision/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletCollision/NarrowPhaseCollision/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletCollision_NarrowPhaseCollision ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Character/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Character/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Character/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_Character ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/ConstraintSolver/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/ConstraintSolver/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/ConstraintSolver/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_ConstraintSolver ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Dynamics/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Dynamics/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Dynamics/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_Dynamics ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Featherstone/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Featherstone/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Featherstone/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_Featherstone ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/MLCPSolvers/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/MLCPSolvers/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/MLCPSolvers/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_MLCPSolvers ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Vehicle/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Vehicle/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletDynamics/Vehicle/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletDynamics_Vehicle ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletSoftBody/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletSoftBody/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/BulletSoftBody/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_BulletSoftBody ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/LinearMath/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/LinearMath/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/LinearMath/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_LinearMath ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_MiniCL ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/MiniCLTask/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/MiniCLTask/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/MiniCL/MiniCLTask/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_MiniCL_MiniCLTask ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_vectormath ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/neon/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/neon/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/neon/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_vectormath/neon ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/scalar/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/scalar/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/scalar/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_vectormath_scalar ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()

FILE( GLOB src
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/sse/*.i"
    "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/sse/*.swg"
    )
SET(REG "${NJLI_THIRDPARTY_SWIGIN_DIRECTORY}/lua/bullet3/vectormath/sse/.*([.]i|[.]swg)")
FOREACH(filename ${src})
    STRING(REGEX MATCH "${REG}" match_group_sources ${filename})
    IF(match_group_sources)
        LIST(APPEND swigin_bullet3_vectormath_sse ${filename})
    ELSE()
        LIST(APPEND interface_group_other ${filename})
    ENDIF()
ENDFOREACH()


FILE(GLOB NJLIGameEngine_THIRDPARTY_ITFS
    ${swigin_bullet3} 
    ${swigin_bullet3_BulletCollision} 
    ${swigin_bullet3_BulletCollision_BroadphaseCollision} 
    ${swigin_bullet3_BulletCollision_CollisionDispatch} 
    ${swigin_bullet3_BulletCollision_CollisionShapes} 
    ${swigin_bullet3_BulletCollision_Gimpact} 
    ${swigin_bullet3_BulletCollision_NarrowPhaseCollision} 
    ${swigin_bullet3_BulletDynamics} 
    ${swigin_bullet3_BulletDynamics_Character} 
    ${swigin_bullet3_BulletDynamics_ConstraintSolver} 
    ${swigin_bullet3_BulletDynamics_Dynamics} 
    ${swigin_bullet3_BulletDynamics_Featherstone} 
    ${swigin_bullet3_BulletDynamics_MLCPSolvers} 
    ${swigin_bullet3_BulletDynamics_Vehicle} 
    ${swigin_bullet3_BulletSoftBody} 
    ${swigin_bullet3_LinearMath} 
    ${swigin_bullet3_MiniCL} 
    ${swigin_bullet3_MiniCL_MiniCLTask} 
    ${swigin_bullet3_vectormath} 
    ${swigin_bullet3_vectormath_neon} 
    ${swigin_bullet3_vectormath_scalar} 
    ${swigin_bullet3_vectormath_sse} 
)

SET( GAME_ASSETS
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/common/assets" 
    )

SET(EXTRA_PLATFORM_LIBS "")

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" )

    SET(imported_assimp_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
    #SET(imported_zlibstatic_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.2/Release-appletvos/lib/libzlibstatic.a")
    SET(imported_Bullet2FileLoader_location          "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet2FileLoader.a")
    SET(imported_Bullet3Collision_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a")
    SET(imported_Bullet3Common_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a")
    SET(imported_Bullet3Dynamics_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a")
    SET(imported_Bullet3Geometry_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a")
    SET(imported_Bullet3OpenCL_clew_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a")
    SET(imported_BulletCollision_location             "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a" )
    SET(imported_BulletDynamics_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a" )
    SET(imported_BulletFileLoader_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a" )
    SET(imported_BulletInverseDynamics_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a")
    SET(imported_BulletInverseDynamicsUtils_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a")
    SET(imported_BulletSoftBody_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a" )
    SET(imported_BulletWorldImporter_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a" )
    SET(imported_BulletXmlWorldImporter_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a" )
    SET(imported_ConvexDecomposition_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a" )
    SET(imported_GIMPACTUtils_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a" )
    SET(imported_HACD_location                        "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a" )
    SET(imported_LinearMath_location                  "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a" )
    SET(imported_flatbuffers_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libflatbuffers.a")
    SET(imported_imgui_location                       "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libimgui.a" )
    SET(imported_ImGuizmo_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libImGuizmo.a" )
    SET(imported_jsoncpp_location                     "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a")
    SET(imported_nanovg_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a" )
    SET(imported_opencv_calib3d_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_calib3d.a")
    SET(imported_opencv_core_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_core.a")
    SET(imported_opencv_features2d_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_features2d.a")
    SET(imported_opencv_flann_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_flann.a")
    SET(imported_opencv_imgcodecs_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgcodecs.a")
    SET(imported_opencv_imgproc_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgproc.a")
    SET(imported_opencv_ml_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_ml.a")
    SET(imported_opencv_objdetect_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_objdetect.a")
    SET(imported_opencv_photo_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_photo.a")
    SET(imported_opencv_shape_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_shape.a")
    SET(imported_opencv_stitching_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_stitching.a")
    SET(imported_opencv_video_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_video.a")
    SET(imported_opencv_videostab_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_videostab.a")
    #SET(imported_IlmImf_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libIlmImf.a")
    #SET(imported_libjasper_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjasper.a")
    #SET(imported_libjpeg_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjpeg.a")
    #SET(imported_libtiff_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibtiff.a")
    #SET(imported_libwebp_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibwebp.a")
    #SET(imported_zlib_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libzlib.a")
    SET(imported_sqlite_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libsqlite3.a")
    SET(imported_stb_location                         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libstb.a" )
    #SET(imported_tinyxml2_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libtinyxml2.a" )
    SET(imported_fmod_location                        "${NJLI_THIRDPARTY_DIRECTORY}/fmod/lib/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libfmod${NJLI_FMOD_POSTFIX}.${NJLI_FMOD_EXTENSION}" )
    SET(imported_SDL2_location                        "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a" )
    SET(imported_uSynergy_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.2/Release\$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a")

    SET(NJLI_APPICON_NAME "App Icon & Top Shelf Image")

    LIST(APPEND NJLIGameEngine_HDRS /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/SDKs/AppleTVOS.sdk/System/Library/Frameworks )

    SET( CMAKE_OSX_SYSROOT "appletvos" )
    SET( CMAKE_XCODE_EFFECTIVE_PLATFORMS "-appletvos;-appletvsimulator" )

    SET ( CMAKE_OSX_ARCHITECTURES ${ARCHS_STANDARD_32_BIT} CACHE string "Build architecture for appletv" )
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

    SET( ASSET_CATALOGUE
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" 
        )
    SET( NJLI_RESOURCES ${ASSET_CATALOGUE} ${GAME_ASSETS} )
    SET( NJLI_DEVICE_FAMILY "3" )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )

    SET(imported_assimp_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
    SET(imported_Bullet2FileLoader_location          "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet2FileLoader.a")
    SET(imported_Bullet3Collision_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a")
    SET(imported_Bullet3Common_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a")
    SET(imported_Bullet3Dynamics_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a")
    SET(imported_Bullet3Geometry_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a")
    SET(imported_Bullet3OpenCL_clew_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a")
    SET(imported_BulletCollision_location             "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a" )
    SET(imported_BulletDynamics_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a" )
    SET(imported_BulletFileLoader_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a" )
    SET(imported_BulletInverseDynamics_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a")
    SET(imported_BulletInverseDynamicsUtils_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a")
    SET(imported_BulletSoftBody_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a" )
    SET(imported_BulletWorldImporter_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a" )
    SET(imported_BulletXmlWorldImporter_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a" )
    SET(imported_ConvexDecomposition_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a" )
    SET(imported_GIMPACTUtils_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a" )
    SET(imported_HACD_location                        "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a" )
    SET(imported_LinearMath_location                  "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a" )
    SET(imported_flatbuffers_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libflatbuffers.a")
    SET(imported_imgui_location                       "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libimgui.a" )
    SET(imported_ImGuizmo_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libImGuizmo.a" )
    SET(imported_jsoncpp_location                     "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a")
    SET(imported_nanovg_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a" )
    SET(imported_opencv_calib3d_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_calib3d.a")
    SET(imported_opencv_core_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_core.a")
    SET(imported_opencv_features2d_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_features2d.a")
    SET(imported_opencv_flann_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_flann.a")
    SET(imported_opencv_imgcodecs_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgcodecs.a")
    SET(imported_opencv_imgproc_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_imgproc.a")
    SET(imported_opencv_ml_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_ml.a")
    SET(imported_opencv_objdetect_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_objdetect.a")
    SET(imported_opencv_photo_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_photo.a")
    SET(imported_opencv_shape_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_shape.a")
    SET(imported_opencv_stitching_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_stitching.a")
    SET(imported_opencv_video_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_video.a")
    SET(imported_opencv_videostab_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/lib/libopencv_videostab.a")
    #SET(imported_IlmImf_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libIlmImf.a")
    #SET(imported_libjasper_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjasper.a")
    #SET(imported_libjpeg_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibjpeg.a")
    #SET(imported_libtiff_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibtiff.a")
    #SET(imported_libwebp_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/liblibwebp.a")
    #SET(imported_zlib_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/share/OpenCV/3rdparty/lib/libzlib.a")
    SET(imported_sqlite_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libsqlite3.a")
    SET(imported_stb_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libstb.a" )
    #SET(imported_tinyxml2_location               "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libtinyxml2.a" )
    SET(imported_fmod_location                   "${NJLI_THIRDPARTY_DIRECTORY}/fmod/lib/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libfmod${NJLI_FMOD_POSTFIX}.${NJLI_FMOD_EXTENSION}" )
    SET(imported_SDL2_location                   "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a" )
    SET(imported_uSynergy_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.3/Release\$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a")

    SET(NJLI_APPICON_NAME "AppIcon")

    LIST(APPEND NJLIGameEngine_HDRS /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks  )

    SET( CMAKE_OSX_SYSROOT "iphoneos" )
    SET( CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos;-iphonesimulator" )

    SET ( CMAKE_OSX_ARCHITECTURES ${ARCHS_STANDARD_32_BIT} CACHE string "Build architecture for iOS" )
    SET ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden" )
    SET ( EXTRA_PLATFORM_LIBS
        ${EXTRA_PLATFORM_LIBS}
        "-framework AVFoundation"
        "-framework GameController"
        "-framework CoreMotion"
        "-framework CoreGraphics"
        "-framework AudioToolbox"
        "-framework QuartzCore"
        "-framework OpenGLES"
        "-framework UIKit"
        "-framework Foundation"
        )

    SET( ASSET_CATALOGUE
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" 
        )

    SET( NJLI_RESOURCES ${ASSET_CATALOGUE} ${GAME_ASSETS} )
    SET( NJLI_DEVICE_FAMILY "1,2" )


ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

    SET(imported_assimp_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
    SET(imported_Bullet2FileLoader_location          "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet2FileLoader.a")
    SET(imported_Bullet3Collision_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Collision.a")
    SET(imported_Bullet3Common_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Common.a")
    SET(imported_Bullet3Dynamics_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Dynamics.a")
    SET(imported_Bullet3Geometry_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3Geometry.a")
    SET(imported_Bullet3OpenCL_clew_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBullet3OpenCL_clew.a")
    SET(imported_BulletCollision_location             "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletCollision.a" )
    SET(imported_BulletDynamics_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletDynamics.a" )
    SET(imported_BulletFileLoader_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletFileLoader.a" )
    SET(imported_BulletInverseDynamics_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletInverseDynamics.a")
    SET(imported_BulletInverseDynamicsUtils_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletInverseDynamicsUtils.a")
    SET(imported_BulletSoftBody_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletSoftBody.a" )
    SET(imported_BulletWorldImporter_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletWorldImporter.a" )
    SET(imported_BulletXmlWorldImporter_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libBulletXmlWorldImporter.a" )
    SET(imported_ConvexDecomposition_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libConvexDecomposition.a" )
    SET(imported_GIMPACTUtils_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libGIMPACTUtils.a" )
    SET(imported_HACD_location                        "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libHACD.a" )
    SET(imported_LinearMath_location                  "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libLinearMath.a" )
    SET(imported_flatbuffers_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libflatbuffers.a")
    SET(imported_imgui_location                       "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/10.12/Release/libimgui.a" )
    SET(imported_ImGuizmo_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/10.12/Release/libImGuizmo.a" )
    SET(imported_jsoncpp_location                     "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/10.12/Release/libjsoncpp.a")
    SET(imported_nanovg_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/10.12/Release/libnanovg.a" )
    SET(imported_opencv_calib3d_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_calib3d.a")
    SET(imported_opencv_core_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_core.a")
    SET(imported_opencv_features2d_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_features2d.a")
    SET(imported_opencv_flann_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_flann.a")
    SET(imported_opencv_imgcodecs_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_imgcodecs.a")
    SET(imported_opencv_imgproc_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_imgproc.a")
    SET(imported_opencv_ml_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_ml.a")
    SET(imported_opencv_objdetect_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_objdetect.a")
    SET(imported_opencv_photo_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_photo.a")
    SET(imported_opencv_shape_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_shape.a")
    SET(imported_opencv_stitching_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_stitching.a")
    SET(imported_opencv_video_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_video.a")
    SET(imported_opencv_videostab_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/lib/libopencv_videostab.a")
    #SET(imported_IlmImf_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/libIlmImf.a")
    #SET(imported_libjasper_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibjasper.a")
    #SET(imported_libjpeg_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibjpeg.a")
    #SET(imported_libtiff_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibtiff.a")
    #SET(imported_libwebp_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/liblibwebp.a")
    #SET(imported_zlib_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/10.12/Release/share/OpenCV/3rdparty/lib/libzlib.a")
    SET(imported_sqlite_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/10.12/Release/libsqlite3.a")
    SET(imported_stb_location                         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/10.12/Release/libstb.a" )
    #SET(imported_tinyxml2_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/10.12/Release/libtinyxml2.a" )
    SET(imported_fmod_location                        "${NJLI_THIRDPARTY_DIRECTORY}/fmod/lib/${NJLI_BUILD_PLATFORM}/10.12/Release/libfmod.dylib" )
    SET(imported_SDL2_location                        "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/${NJLI_BUILD_PLATFORM}/10.12/Release/libSDL2.a" )
    SET(imported_uSynergy_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/10.12/Release/libuSynergy.a")

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

    SET( ASSET_CATALOGUE
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Assets.xcassets" 
        )

    SET( NJLI_RESOURCES ${ASSET_CATALOGUE} ${GAME_ASSETS} )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    LIST(APPEND NJLIGameEngine_HDRS /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include )
    LIST(APPEND NJLIGameEngine_HDRS /Applications/Developer/emsdk_portable/emscripten/1.37.9/system/include/emscripten )

    SET(imported_assimp_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/Release/lib/libassimp${NJLI_ASSIMP_POSTFIX}.a" )
    SET(imported_Bullet2FileLoader_location          "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet2FileLoader.a")
    SET(imported_Bullet3Collision_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Collision.a")
    SET(imported_Bullet3Common_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Common.a")
    SET(imported_Bullet3Dynamics_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Dynamics.a")
    SET(imported_Bullet3Geometry_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3Geometry.a")
    SET(imported_Bullet3OpenCL_clew_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBullet3OpenCL_clew.a")
    SET(imported_BulletCollision_location             "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletCollision.a" )
    SET(imported_BulletDynamics_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletDynamics.a" )
    SET(imported_BulletFileLoader_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletFileLoader.a" )
    SET(imported_BulletInverseDynamics_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamics.a")
    SET(imported_BulletInverseDynamicsUtils_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletInverseDynamicsUtils.a")
    SET(imported_BulletSoftBody_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletSoftBody.a" )
    SET(imported_BulletWorldImporter_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletWorldImporter.a" )
    SET(imported_BulletXmlWorldImporter_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libBulletXmlWorldImporter.a" )
    SET(imported_ConvexDecomposition_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libConvexDecomposition.a" )
    SET(imported_GIMPACTUtils_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libGIMPACTUtils.a" )
    SET(imported_HACD_location                        "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libHACD.a" )
    SET(imported_LinearMath_location                  "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/Release/lib/libLinearMath.a" )
    SET(imported_flatbuffers_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/Release/lib/libflatbuffers.a")
    SET(imported_imgui_location                       "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/Release/libimgui.a" )
    SET(imported_ImGuizmo_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/Release/libImGuizmo.a" )
    SET(imported_jsoncpp_location                     "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/Release/libjsoncpp.a")
    SET(imported_nanovg_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/Release/libnanovg.a" )
    SET(imported_opencv_calib3d_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_calib3d.a")
    SET(imported_opencv_core_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_core.a")
    SET(imported_opencv_features2d_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_features2d.a")
    SET(imported_opencv_flann_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_flann.a")
    SET(imported_opencv_imgcodecs_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgcodecs.a")
    SET(imported_opencv_imgproc_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_imgproc.a")
    SET(imported_opencv_ml_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_ml.a")
    SET(imported_opencv_objdetect_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_objdetect.a")
    SET(imported_opencv_photo_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_photo.a")
    SET(imported_opencv_shape_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_shape.a")
    SET(imported_opencv_stitching_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_stitching.a")
    SET(imported_opencv_video_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_video.a")
    SET(imported_opencv_videostab_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/lib/libopencv_videostab.a")
    #SET(imported_IlmImf_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libIlmImf.a")
    #SET(imported_libjasper_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjasper.a")
    #SET(imported_libjpeg_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibjpeg.a")
    #SET(imported_libtiff_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibtiff.a")
    #SET(imported_libwebp_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/liblibwebp.a")
    #SET(imported_zlib_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/Release/share/OpenCV/3rdparty/lib/libzlib.a")
    SET(imported_sqlite_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/Release/libsqlite3.a")
    SET(imported_stb_location                         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/Release/libstb.a" )
    #SET(imported_tinyxml2_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/Release/libtinyxml2.a" )
    SET(imported_fmod_location                        "" )
    SET(imported_SDL2_location                        "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/${NJLI_BUILD_PLATFORM}/Release/libSDL2.a" )
    SET(imported_uSynergy_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/Release/libuSynergy.a")


    #https://kripken.github.io/emscripten-site/docs/porting/files/packaging_files.html

    #-Wno-warn-absolute-paths --memory-init-file 0 -s DISABLE_EXCEPTION_CATCHING=0 -s ALLOW_MEMORY_GROWTH=1 -s LEGACY_GL_EMULATION=1

    SET (CMAKE_EXE_LINKER_FLAGS "--memory-init-file 1 --embed-file  ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/common/assets" )

    ADD_DEFINITIONS(-DEMCC_DEBUG=1)
    #ADD_DEFINITIONS(-DDEBUG=1)
    LIST(APPEND EXTRA_PLATFORM_LIBS "-O0")
    LIST(APPEND EXTRA_PLATFORM_LIBS "--js-opts 0")
    LIST(APPEND EXTRA_PLATFORM_LIBS "-g3")
    LIST(APPEND EXTRA_PLATFORM_LIBS "-s ALLOW_MEMORY_GROWTH=1")
    LIST(APPEND EXTRA_PLATFORM_LIBS "-s FULL_ES2=1")

    #    SET( EXTRA_PLATFORM_LIBS 
    #        ${EXTRA_PLATFORM_LIBS}
    #        "-O0"
    #        "--js-opts 0"
    #        "-g4" 
    #        "-s ALLOW_MEMORY_GROWTH=1"
    #        #"-s ASSERTIONS=1"
    #        #"-s DEMANGLE_SUPPORT=1"
    #        "-s FULL_ES2=1"
    #        )

    #STRING( COMPARE EQUAL "${CMAKE_BUILD_TYPE}" "Debug" is_equal )
    #IF( is_equal )
    #    #https://kripken.github.io/emscripten-site/docs/porting/Debugging.html
    #    ADD_DEFINITIONS(-DEMCC_DEBUG=1)
    #    #ADD_DEFINITIONS(-DEMCC_AUTODEBUG=1)
    #    SET ( EXTRA_PLATFORM_LIBS
    #        ${EXTRA_PLATFORM_LIBS}
    #        "-s ASSERTIONS=1"
    #        "-s SAFE_HEAP=1"
    #        "-s STACK_OVERFLOW_CHECK=1"
    #        "--js-opts 0"
    #        "-g4"
    #        )
    #ENDIF( is_equal )

ELSEIF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )

    SET(imported_assimp_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libassimp.a" )
    SET(imported_Bullet2FileLoader_location          "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet2FileLoader.a")
    SET(imported_Bullet3Collision_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Collision.a")
    SET(imported_Bullet3Common_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Common.a")
    SET(imported_Bullet3Dynamics_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Dynamics.a")
    SET(imported_Bullet3Geometry_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3Geometry.a")
    SET(imported_Bullet3OpenCL_clew_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBullet3OpenCL_clew.a")
    SET(imported_BulletCollision_location             "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletCollision.a" )
    SET(imported_BulletDynamics_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletDynamics.a" )
    SET(imported_BulletFileLoader_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletFileLoader.a" )
    SET(imported_BulletInverseDynamics_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletInverseDynamics.a")
    SET(imported_BulletInverseDynamicsUtils_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletInverseDynamicsUtils.a")
    SET(imported_BulletSoftBody_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletSoftBody.a" )
    SET(imported_BulletWorldImporter_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletWorldImporter.a" )
    SET(imported_BulletXmlWorldImporter_location      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libBulletXmlWorldImporter.a" )
    SET(imported_ConvexDecomposition_location         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libConvexDecomposition.a" )
    SET(imported_GIMPACTUtils_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libGIMPACTUtils.a" )
    SET(imported_HACD_location                        "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libHACD.a" )
    SET(imported_LinearMath_location                  "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/bullet3/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libLinearMath.a" )
    SET(imported_flatbuffers_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/flatbuffers/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libflatbuffers.a")
    SET(imported_imgui_location                       "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/imgui/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libimgui.a" )
    SET(imported_ImGuizmo_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/ImGuizmo/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libImGuizmo.a" )
    SET(imported_jsoncpp_location                     "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/jsoncpp/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libjsoncpp.a")
    SET(imported_nanovg_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/nanovg/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libnanovg.a" )
    SET(imported_opencv_calib3d_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_calib3d.a")
    SET(imported_opencv_core_location                 "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libopencv_core.a")
    SET(imported_opencv_features2d_location           "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_features2d.a")
    SET(imported_opencv_flann_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_flann.a")
    SET(imported_opencv_imgcodecs_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_imgcodecs.a")
    SET(imported_opencv_imgproc_location              "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_imgproc.a")
    SET(imported_opencv_ml_location                   "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_ml.a")
    SET(imported_opencv_objdetect_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_objdetect.a")
    SET(imported_opencv_photo_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_photo.a")
    SET(imported_opencv_shape_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_shape.a")
    SET(imported_opencv_stitching_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_stitching.a")
    SET(imported_opencv_video_location                "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_video.a")
    SET(imported_opencv_videostab_location            "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/lib/libopencv_videostab.a")
    #SET(imported_IlmImf_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/libIlmImf.a")
    #SET(imported_libjasper_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibjasper.a")
    #SET(imported_libjpeg_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibjpeg.a")
    #SET(imported_libtiff_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibtiff.a")
    #SET(imported_libwebp_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/liblibwebp.a")
    #SET(imported_zlib_location "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/opencv/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/share/OpenCV/3rdparty/lib/libzlib.a")
    SET(imported_sqlite_location                      "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/sqlite/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libsqlite3.a")
    SET(imported_stb_location                         "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/stb/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libstb.a" )
    #SET(imported_tinyxml2_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/tinyxml2/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libtinyxml2.a" )
    SET(imported_fmod_location                        "${NJLI_THIRDPARTY_DIRECTORY}/fmod/lib/android/24/${ANDROID_ABI}/libfmod.so" )
    SET(imported_SDL2_location                        "${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/android/23/Release/${ANDROID_ABI}/libSDL2.so" )
    SET(imported_uSynergy_location                    "${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/usynergy/${NJLI_BUILD_PLATFORM}/19/Release/${ANDROID_ABI}/libuSynergy.a")
    FILE(GLOB NJLIGameEngine_LBY
        ${NJLI_THIRDPARTY_DIRECTORY}/fmod/lib/android/24/${ANDROID_ABI}/Release/libfmod.so
        ${NJLI_THIRDPARTY_DIRECTORY}/SDL2/lib/android/23/Release/${ANDROID_ABI}/libSDL2.so 
    )

    FIND_LIBRARY(log-lib log)
    FIND_LIBRARY(dl-lib dl)
    FIND_LIBRARY(GLESv2-lib GLESv2)
    FIND_LIBRARY(m-lib m)
    FIND_LIBRARY(c-lib c)
    FIND_LIBRARY(EGL-lib EGL)
    FIND_LIBRARY(stdc++-lib stdc++)
    FIND_LIBRARY(android-lib android)

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

    SET( NJLI_RESOURCES ${GAME_ASSETS} )

ENDIF()

#https://developer.android.com/studio/projects/add-native-code.html
INCLUDE_DIRECTORIES( ${NJLIGameEngine_HDRS} )

INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/SDL2/include" )

ADD_LIBRARY(imported_SDL2 SHARED IMPORTED )
SET_TARGET_PROPERTIES(imported_SDL2 PROPERTIES IMPORTED_LOCATION ${imported_SDL2_location})
LIST(APPEND EXTRA_PLATFORM_LIBS imported_SDL2)

IF( NOT ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/fmod/include" )

    ADD_LIBRARY(imported_fmod SHARED IMPORTED )
    SET_TARGET_PROPERTIES(imported_fmod PROPERTIES IMPORTED_LOCATION ${imported_fmod_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_fmod)
ENDIF( NOT ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

IF(NJLI_USE_ASSIMP_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/assimp" )
    
    ADD_LIBRARY(imported_assimp STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_assimp PROPERTIES IMPORTED_LOCATION ${imported_assimp_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_assimp)
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/bullet3" )

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
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/concurrentqueue")
ENDIF(NJLI_USE_CONCURRENTQUEUE_LIBRARY)

IF(NJLI_USE_DEBUGDRAW_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/debug-draw")
ENDIF(NJLI_USE_DEBUGDRAW_LIBRARY)

IF(NJLI_USE_FLATBUFFERS_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/flatbuffers")

    ADD_LIBRARY(imported_flatbuffers STATIC IMPORTED)
    SET_TARGET_PROPERTIES(imported_flatbuffers PROPERTIES IMPORTED_LOCATION ${imported_flatbuffers_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_flatbuffers)
ENDIF(NJLI_USE_FLATBUFFERS_LIBRARY)

IF(NJLI_USE_GLM_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/glm" )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/imgui" )

    ADD_LIBRARY(imported_imgui STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_imgui PROPERTIES IMPORTED_LOCATION ${imported_imgui_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_imgui)
ENDIF(NJLI_USE_IMGUI_LIBRARY)

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/ImGuizmo" )

    ADD_LIBRARY(imported_ImGuizmo STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_ImGuizmo PROPERTIES IMPORTED_LOCATION ${imported_ImGuizmo_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_ImGuizmo)
    MESSAGE("${imported_ImGuizmo_location}")
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/jsoncpp" )

    ADD_LIBRARY(imported_jsoncpp STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_jsoncpp PROPERTIES IMPORTED_LOCATION ${imported_jsoncpp_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_jsoncpp)
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/nanovg" )

    ADD_LIBRARY(imported_nanovg STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_nanovg PROPERTIES IMPORTED_LOCATION ${imported_nanovg_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_nanovg)
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/opencv" )

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
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/sqlite")

    ADD_LIBRARY(imported_sqlite STATIC IMPORTED)
    SET_TARGET_PROPERTIES(imported_sqlite PROPERTIES IMPORTED_LOCATION ${imported_sqlite_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_sqlite)
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/stb" )

    ADD_LIBRARY(imported_stb STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_stb PROPERTIES IMPORTED_LOCATION ${imported_stb_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_stb)
ENDIF(NJLI_USE_STB_LIBRARY)

#IF(NJLI_USE_TINYXML2_LIBRARY)
#    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/tinyxml2" )
#
#    ADD_LIBRARY(imported_tinyxml2 STATIC IMPORTED )
#    SET_TARGET_PROPERTIES(imported_tinyxml2 PROPERTIES IMPORTED_LOCATION ${imported_tinyxml2_location})
#    LIST(APPEND EXTRA_PLATFORM_LIBS imported_tinyxml2)
#ENDIF(NJLI_USE_TINYXML2_LIBRARY)

IF(NJLI_USE_USYNERGY_LIBRARY)
    INCLUDE_DIRECTORIES("${NJLI_THIRDPARTY_DIRECTORY}/BUILD/include/usynergy" )

    ADD_LIBRARY(imported_uSynergy STATIC IMPORTED )
    SET_TARGET_PROPERTIES(imported_uSynergy PROPERTIES IMPORTED_LOCATION ${imported_uSynergy_location})
    LIST(APPEND EXTRA_PLATFORM_LIBS imported_uSynergy)
ENDIF(NJLI_USE_USYNERGY_LIBRARY)

LIST(REMOVE_ITEM NJLIGameEngine_SRCS 
    ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
    )

SET(Binary_FILES
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/lua/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/lua${NJLI_BINARY_EXTENSION}
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/lua/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/luac${NJLI_BINARY_EXTENSION}
    ${NJLI_THIRDPARTY_DIRECTORY}/BUILD/lib/assimp/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE}/bin/assimp${NJLI_ASSIMP_POSTFIX}${NJLI_BINARY_EXTENSION}
    )
#INSTALL(PROGRAMS ${Binary_FILES} DESTINATION bin/thirdparty/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE} )
INSTALL(FILES ${NJLI_SOURCE_DIRECTORY}/njli/platform/Game.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})






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

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    LIST(APPEND SWIG_DEFINE "USE_IMGUIZMO_LIBRARY")
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

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

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
    ADD_CUSTOM_TARGET( SWIGLua
        COMMAND 
            ./swig_njli_lua.sh ${CMAKE_CURRENT_BINARY_DIR} ${SWIG_DEFINE}
        BYPRODUCTS
            ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/lnjli.cpp
            ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/swig_runtime.h
        WORKING_DIRECTORY
            ${CMAKE_SOURCE_DIR}
        COMMENT
            "Generating SWIG module with swig"
        VERBATIM
        )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/lnjli.cpp PROPERTIES GENERATED TRUE )
#SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/lbullet.cpp PROPERTIES GENERATED TRUE )
SET_SOURCE_FILES_PROPERTIES( ${NJLI_SOURCE_DIRECTORY}/njli/generated/swig/lua/swig_runtime.h PROPERTIES GENERATED TRUE )
##SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml PROPERTIES GENERATED TRUE )
##SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml PROPERTIES GENERATED TRUE )
##INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/lnjli.xml DESTINATION ${CMAKE_INSTALL_DATADIR}/swig/lua)
##INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/lbullet.xml DESTINATION ${CMAKE_INSTALL_DATADIR}/swig/lua)

SOURCE_GROUP("ThirdParty"                                                                   FILES ${third_party_directory} )
SOURCE_GROUP("ThirdParty\\include"                                                          FILES ${group_other} )
SOURCE_GROUP("ThirdParty\\include\\SDL2"                                                    FILES ${SDL2} )

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    SOURCE_GROUP("ThirdParty\\include\\emscripten"                                              FILES ${emscripten_include} )
    SOURCE_GROUP("ThirdParty\\include\\emscripten\\emscripten"                                  FILES ${emscripten_include_emscripten} )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )

IF(NJLI_USE_ASSIMP_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\assimp"                                                  FILES ${assimp} )
    SOURCE_GROUP("ThirdParty\\include\\assimp\\assimp"                                          FILES ${assimp_assimp} )
    SOURCE_GROUP("ThirdParty\\include\\assimp\\assimp\\Compiler"                                FILES ${assimp_assimp_Compiler} )
ENDIF(NJLI_USE_ASSIMP_LIBRARY)

IF(NJLI_USE_BULLET_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\bullet3"                                                 FILES ${bullet3} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet2FileLoader"                              FILES ${bullet3_Bullet2FileLoader} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet2FileLoader\\autogenerated"               FILES ${bullet3_Bullet2FileLoader_autogenerated} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Collision"                               FILES ${bullet3_Bullet3Collision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Collision\\BroadPhaseCollision"          FILES ${bullet3_Bullet3Collision_BroadPhaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Collision\\BroadPhaseCollision\\shared"  FILES ${bullet3_Bullet3Collision_BroadPhaseCollision/shared} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Collision\\NarrowPhaseCollision"         FILES ${bullet3_Bullet3Collision_NarrowPhaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Collision\\NarrowPhaseCollision\\shared" FILES ${bullet3_Bullet3Collision_NarrowPhaseCollision_shared} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Common"                                  FILES ${bullet3_Bullet3Common} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Common\\shared"                          FILES ${bullet3_Bullet3Common_shared} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Dynamics"                                FILES ${bullet3_Bullet3Dynamics} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Dynamics\\ConstraintSolver"              FILES ${bullet3_Bullet3Dynamics_ConstraintSolver} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Dynamics\\shared"                        FILES ${bullet3_Bullet3Dynamics_shared} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3Geometry"                                FILES ${bullet3_Bullet3Geometry} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL"                                  FILES ${bullet3_Bullet3OpenCL} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\BroadphaseCollision"             FILES ${bullet3_Bullet3OpenCL_BroadphaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\BroadphaseCollision/kernels"     FILES ${bullet3_Bullet3OpenCL_BroadphaseCollision/kernels} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\Initialize"                      FILES ${bullet3_Bullet3OpenCL_Initialize} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\NarrowphaseCollision"            FILES ${bullet3_Bullet3OpenCL_NarrowphaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\NarrowphaseCollision\\kernels"   FILES ${bullet3_Bullet3OpenCL_NarrowphaseCollision_kernels} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\ParallelPrimitives"              FILES ${bullet3_Bullet3OpenCL_ParallelPrimitives} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\ParallelPrimitives\\kernels"     FILES ${bullet3_Bullet3OpenCL_ParallelPrimitives_kernels} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\Raycast"                         FILES ${bullet3_Bullet3OpenCL_Raycast} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\Raycast\\kernels"                FILES ${bullet3_Bullet3OpenCL_Raycast_kernels} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\RigidBody"                       FILES ${bullet3_Bullet3OpenCL_RigidBody} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\Bullet3OpenCL\\RigidBody\\kernels"              FILES ${bullet3_Bullet3OpenCL_RigidBody_kernels} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision"                                FILES ${bullet3_BulletCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision\\BroadphaseCollision"           FILES ${bullet3_BulletCollision_BroadphaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision\\CollisionDispatch"             FILES ${bullet3_BulletCollision_CollisionDispatch} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision\\CollisionShapes"               FILES ${bullet3_BulletCollision_CollisionShapes} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision\\Gimpact"                       FILES ${bullet3_BulletCollision_Gimpact} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletCollision\\NarrowPhaseCollision"          FILES ${bullet3_BulletCollision_NarrowPhaseCollision} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics"                                 FILES ${bullet3_BulletDynamics} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\Character"                      FILES ${bullet3_BulletDynamics_Character} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\ConstraintSolver"               FILES ${bullet3_BulletDynamics_ConstraintSolver} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\Dynamics"                       FILES ${bullet3_BulletDynamics_Dynamics} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\Featherstone"                   FILES ${bullet3_BulletDynamics_Featherstone} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\MLCPSolvers"                    FILES ${bullet3_BulletDynamics_MLCPSolvers} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletDynamics\\Vehicle"                        FILES ${bullet3_BulletDynamics_Vehicle} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletFileLoader"                               FILES ${bullet3_BulletFileLoader} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletFileLoader\\autogenerated"                FILES ${bullet3_BulletFileLoader_autogenerated} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletInverseDynamics"                          FILES ${bullet3_BulletInverseDynamics} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletInverseDynamics\\details"                 FILES ${bullet3_BulletInverseDynamics_details} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletSoftBody"                                 FILES ${bullet3_BulletSoftBody} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletWorldImporter"                            FILES ${bullet3_BulletWorldImporter} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\BulletXmlWorldImporter"                         FILES ${bullet3_BulletXmlWorldImporter} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\ConvexDecomposition"                            FILES ${bullet3_ConvexDecomposition} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\GIMPACTUtils"                                   FILES ${bullet3_GIMPACTUtils} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\HACD"                                           FILES ${bullet3_HACD} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\InverseDynamics"                                FILES ${bullet3_InverseDynamics} )
    SOURCE_GROUP("ThirdParty\\include\\bullet3\\LinearMath"                                     FILES ${bullet3_LinearMath} )
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
    SOURCE_GROUP("ThirdParty\\include\\glm"                                                     FILES ${glm} )
    SOURCE_GROUP("ThirdParty\\include\\glm\\glm"                                                FILES ${glm_glm} )
    SOURCE_GROUP("ThirdParty\\include\\glm\\glm\\detail"                                        FILES ${glm_glm_detail} )
    SOURCE_GROUP("ThirdParty\\include\\glm\\glm\\gtc"                                           FILES ${glm_glm_gtc} )
    SOURCE_GROUP("ThirdParty\\include\\glm\\glm\\gtx"                                           FILES ${glm_glm_gtx} )
    SOURCE_GROUP("ThirdParty\\include\\glm\\glm\\simd"                                          FILES ${glm_glm_simd} )
ENDIF(NJLI_USE_GLM_LIBRARY)

IF(NJLI_USE_IMGUI_LIBRARY)
    ADD_DEFINITIONS(-DUSE_IMGUI_LIBRARY=1)
ENDIF(NJLI_USE_IMGUI_LIBRARY)

IF(NJLI_USE_IMGUIZMO_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\ImGuizmo"                                                FILES ${ImGuizmo} )
ENDIF(NJLI_USE_IMGUIZMO_LIBRARY)

IF(NJLI_USE_JSONCPP_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\jsoncpp"                                                 FILES ${jsoncpp} )
    SOURCE_GROUP("ThirdParty\\include\\jsoncpp\\json"                                           FILES ${jsoncpp_json} )
ENDIF(NJLI_USE_JSONCPP_LIBRARY)

IF(NJLI_USE_NANOVG_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\nanovg"                                                  FILES ${nanovg} )
ENDIF(NJLI_USE_NANOVG_LIBRARY)

IF(NJLI_USE_OPENCV_LIBRARY)
    ADD_DEFINITIONS(-DUSE_OPENCV_LIBRARY=1)
ENDIF(NJLI_USE_OPENCV_LIBRARY)

IF(NJLI_USE_SQLITE_LIBRARY)
    ADD_DEFINITIONS(-DUSE_SQLITE_LIBRARY=1)
ENDIF(NJLI_USE_SQLITE_LIBRARY)

IF(NJLI_USE_STB_LIBRARY)
    SOURCE_GROUP("ThirdParty\\include\\stb"                                                     FILES ${stb} )
ENDIF(NJLI_USE_STB_LIBRARY)

SOURCE_GROUP("GameEngine\\bullet"                                    FILES ${bullet} )
SOURCE_GROUP("GameEngine\\lua"                                       FILES ${group_other})
SOURCE_GROUP("GameEngine\\lua\\exts"                                 FILES ${lua_exts} )
SOURCE_GROUP("GameEngine\\lua\\exts\\luasocket"                      FILES ${lua_exts_luasocket} )
SOURCE_GROUP("GameEngine\\lua\\src"                                  FILES ${lua_src} )
SOURCE_GROUP("GameEngine\\njli"                                      FILES ${njli} )
SOURCE_GROUP("GameEngine\\njli\\builders"                            FILES ${njli_builders})
SOURCE_GROUP("GameEngine\\njli\\builders\\graphics"                  FILES ${njli_builders_graphics})
SOURCE_GROUP("GameEngine\\njli\\builders\\physics"                   FILES ${njli_builders_physics})
SOURCE_GROUP("GameEngine\\njli\\builders\\physics\\body"             FILES ${njli_builders_physics_body})
SOURCE_GROUP("GameEngine\\njli\\builders\\physics\\constraint"       FILES ${njli_builders_physics_constraint})
SOURCE_GROUP("GameEngine\\njli\\builders\\physics\\shape"            FILES ${njli_builders_physics_shape})
SOURCE_GROUP("GameEngine\\njli\\builders\\platform"                  FILES ${njli_builders_platform})
SOURCE_GROUP("GameEngine\\njli\\builders\\sound"                     FILES ${njli_builders_sound})
SOURCE_GROUP("GameEngine\\njli\\builders\\steering"                  FILES ${njli_builders_steering})
SOURCE_GROUP("GameEngine\\njli\\builders\\steering\\behavior"        FILES ${njli_builders_steering_behavior})
SOURCE_GROUP("GameEngine\\njli\\generated"                           FILES ${njli_generated})
SOURCE_GROUP("GameEngine\\njli\\generated\\swig"                     FILES ${njli_generated_swig})
SOURCE_GROUP("GameEngine\\njli\\generated\\swig\\lua"                FILES ${njli_generated_swig_lua})
SOURCE_GROUP("GameEngine\\njli\\graphics"                            FILES ${njli_graphics})
SOURCE_GROUP("GameEngine\\njli\\graphics\\${NJLI_GRAPHICS_PLATFORM}" FILES ${njli_graphics_specific})
SOURCE_GROUP("GameEngine\\njli\\modules"                             FILES ${njli_modules})
SOURCE_GROUP("GameEngine\\njli\\modules\\lua"                        FILES ${njli_modules_lua})
SOURCE_GROUP("GameEngine\\njli\\physics"                             FILES ${njli_physics})
SOURCE_GROUP("GameEngine\\njli\\physics\\body"                       FILES ${njli_physics_body})
SOURCE_GROUP("GameEngine\\njli\\physics\\constraint"                 FILES ${njli_physics_constraint})
SOURCE_GROUP("GameEngine\\njli\\physics\\shape"                      FILES ${njli_physics_shape})
SOURCE_GROUP("GameEngine\\njli\\platform"                            FILES ${njli_platform} )
SOURCE_GROUP("GameEngine\\njli\\platform\\${NJLI_BUILD_PLATFORM}"    FILES ${njli_platform_specific} )
SOURCE_GROUP("GameEngine\\njli\\sound"                               FILES ${njli_sound})
SOURCE_GROUP("GameEngine\\njli\\sound\\${NJLI_SOUND_PLATFORM}"       FILES ${njli_sound_specific})
SOURCE_GROUP("GameEngine\\njli\\steering"                            FILES ${njli_steering})
SOURCE_GROUP("GameEngine\\njli\\steering\\behavior"                  FILES ${njli_steering_behavior})

SOURCE_GROUP("Interfaces\\swig.in" )
SOURCE_GROUP("Interfaces\\swig.in\\lua" )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine" FILES ${swigin_lua} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli" FILES ${swigin_lua_njli} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders" FILES ${swigin_lua_njli_builders} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders" FILES ${swigin_lua_njli_builders_graphics} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders" FILES ${swigin_lua_njli_builders} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\physics\\body" FILES ${swigin_lua_njli_builders_physics_body} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\physics\\constraint" FILES ${swigin_lua_njli_builders_physics_constraint} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\physics\\shape" FILES ${swigin_lua_njli_builders_physics_shape} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\platform" FILES ${swigin_lua_njli_builders_platform} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\sound" FILES ${swigin_lua_njli_builders_sound} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\steering" FILES ${swigin_lua_njli_builders_steering} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\builders\\steering\\behavior" FILES ${swigin_lua_njli_builders_steering_behavior} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\graphics" FILES ${swigin_lua_njli_graphics} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\physics" FILES ${swigin_lua_njli_physics} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\physics\\body" FILES ${swigin_lua_njli_physics_body} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\physics\\constraint" FILES ${swigin_lua_njli_physics_constraint} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\physics\\shape" FILES ${swigin_lua_njli_physics_shape} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\platform" FILES ${swigin_lua_njli_platform} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\sound" FILES ${swigin_lua_njli_sound} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\steering" FILES ${swigin_lua_njli_steering} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\engine\\njli\\steering\\behavior" FILES ${swigin_lua_njli_steering_behavior} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty" )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3" FILES ${swigin_bullet3} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision" FILES ${swigin_bullet3_BulletCollision} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision\\BroadphaseCollision" FILES ${swigin_bullet3_BulletCollision_BroadphaseCollision} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision\\CollisionDispatch" FILES ${swigin_bullet3_BulletCollision_CollisionDispatch} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision\\CollisionShapes" FILES ${swigin_bullet3_BulletCollision_CollisionShapes} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision\\Gimpact" FILES ${swigin_bullet3_BulletCollision_Gimpact} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletCollision\\NarrowPhaseCollision" FILES ${swigin_bullet3_BulletCollision_NarrowPhaseCollision} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics" FILES ${swigin_bullet3_BulletDynamics} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\Character" FILES ${swigin_bullet3_BulletDynamics_Character} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\ConstraintSolver" FILES ${swigin_bullet3_BulletDynamics_ConstraintSolver} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\Dynamics" FILES ${swigin_bullet3_BulletDynamics_Dynamics} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\Featherstone" FILES ${swigin_bullet3_BulletDynamics_Featherstone} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\MLCPSolvers" FILES ${swigin_bullet3_BulletDynamics_MLCPSolvers} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletDynamics\\Vehicle" FILES ${swigin_bullet3_BulletDynamics_Vehicle} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\BulletSoftBody" FILES ${swigin_bullet3_BulletSoftBody} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\LinearMath" FILES ${swigin_bullet3_LinearMath} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\MiniCL" FILES ${swigin_bullet3_MiniCL} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\MiniCL\\MiniCLTask" FILES ${swigin_bullet3_MiniCL_MiniCLTask} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\vectormath" FILES ${swigin_bullet3_vectormath} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\vectormath\\neon" FILES ${swigin_bullet3_vectormath_neon} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\vectormath\\scalar" FILES ${swigin_bullet3_vectormath_scalar} )
SOURCE_GROUP("Interfaces\\swig.in\\lua\\thirdparty\\bullet3\\vectormath\\sse" FILES ${swigin_bullet3_vectormath_sse} )

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
    ADD_CUSTOM_TARGET(ldoc ALL
        ldoc ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc.in/
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in
        COMMENT "Generating API documentation with LDoc" VERBATIM
        )
    SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc/index.html PROPERTIES GENERATED TRUE )
    INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/ldoc DESTINATION ${CMAKE_INSTALL_DOCDIR})

    FIND_PACKAGE(Doxygen)
    IF(DOXYGEN_FOUND)
        SET_SOURCE_FILES_PROPERTIES( ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html/index.html  PROPERTIES GENERATED TRUE )

        CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Doxyfile.in ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Doxyfile @ONLY)
        ADD_CUSTOM_TARGET(doxygen ALL
            ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Doxyfile
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in
            COMMENT "Generating API documentation with Doxygen" VERBATIM
            )
        INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/docbook DESTINATION ${CMAKE_INSTALL_DOCDIR})
        INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/html DESTINATION ${CMAKE_INSTALL_DOCDIR})
        INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/latex DESTINATION ${CMAKE_INSTALL_DOCDIR})
        INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/rtf DESTINATION ${CMAKE_INSTALL_DOCDIR})
        INSTALL(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/xml DESTINATION ${CMAKE_INSTALL_DOCDIR})
    ENDIF(DOXYGEN_FOUND)
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )

IF( ${NJLI_BUILD_PLATFORM} STREQUAL "android" )
    #    ADD_LIBRARY( njli SHARED 
    #        ${NJLIGameEngine_HDRS} 
    #        ${NJLIGameEngine_SRCS} 
    #        ${njli_generated} 
    #        ${njli_generated_swig} 
    #        ${njli_generated_swig_lua} 
    #        ${NJLI_THIRDPARTY_DIRECTORY}/SDL2-2.0.5/src/main/android/SDL_android_main.c
    #        ${NJLI_THIRDPARTY_DIRECTORY}/android_file.h
    #        ${NJLI_THIRDPARTY_DIRECTORY}/android_file.cpp
    #        ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
    #        ${NJLIGameEngine_THIRDPARTY_INC}
    #        )
    ADD_LIBRARY( njli SHARED 
        ${NJLIGameEngine_HDRS} 
        ${NJLIGameEngine_SRCS} 
        ${njli_generated} 
        ${njli_generated_swig} 
        ${njli_generated_swig_lua} 
        ${NJLI_THIRDPARTY_DIRECTORY}/SDL2-2.0.5/src/main/android/SDL_android_main.c
        ${NJLI_THIRDPARTY_DIRECTORY}/android_file.h
        ${NJLI_THIRDPARTY_DIRECTORY}/android_file.cpp
        ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
        ${NJLIGameEngine_THIRDPARTY_INC}
        )
    TARGET_LINK_LIBRARIES( njli ${EXTRA_PLATFORM_LIBS} 
        ${NJLIGameEngine_LBY} 
        )

    ADD_CUSTOM_COMMAND(TARGET njli
        PRE_BUILD
        COMMAND export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && make
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON 
        )

ELSE()

    ADD_LIBRARY( libnjli_static STATIC 
        ${NJLIGameEngine_SRCS} ${njli_generated} ${njli_generated_swig} ${njli_generated_swig_lua} 
        )
    #ADD_DEPENDENCIES(libnjli_static SWIGLua)
    SET_TARGET_PROPERTIES( libnjli_static PROPERTIES OUTPUT_NAME libnjli )
    SET_TARGET_PROPERTIES( libnjli_static PROPERTIES PREFIX "")
    TARGET_LINK_LIBRARIES( libnjli_static ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} )
    INSTALL( TARGETS libnjli_static DESTINATION lib/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE} )

    IF( NOT ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
        ADD_LIBRARY( libnjli_shared SHARED 
            ${NJLIGameEngine_SRCS} ${njli_generated} ${njli_generated_swig} ${njli_generated_swig_lua} 
            )
        #ADD_DEPENDENCIES(libnjli_shared SWIGLua)
        SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES OUTPUT_NAME libnjli )
        SET_TARGET_PROPERTIES( libnjli_shared PROPERTIES PREFIX "")
        TARGET_LINK_LIBRARIES( libnjli_shared ${EXTRA_PLATFORM_LIBS} ${NJLIGameEngine_LBY} )
        INSTALL( TARGETS libnjli_shared DESTINATION lib/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE} )

        ADD_LIBRARY( libnjli_lua_module MODULE ${NJLIGameEngine_SRCS} ${njli_generated} ${njli_generated_swig} ${njli_generated_swig_lua} )
        #ADD_DEPENDENCIES(libnjli_lua_module SWIGLua)
        SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES OUTPUT_NAME njli )
        SET_TARGET_PROPERTIES( libnjli_lua_module PROPERTIES PREFIX "")
        TARGET_LINK_LIBRARIES( libnjli_lua_module ${NJLIGameEngine_LBY} ${EXTRA_PLATFORM_LIBS} )
        INSTALL( TARGETS libnjli_lua_module DESTINATION module/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE} )
    ENDIF()

    ADD_EXECUTABLE( EngineSource
        ${NJLIGameEngine_SRCS} ${njli_generated} ${njli_generated_swig} ${njli_generated_swig_lua}
        ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
        ${NJLI_RESOURCES}
        ${NJLIGameEngine_THIRDPARTY_INC}
        )
    #ADD_DEPENDENCIES(EngineSource SWIGLua)
    
    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
        SET_TARGET_PROPERTIES (
            EngineSource PROPERTIES
            XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
            XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${NJLI_DEVICE_FAMILY}
            XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
            XCODE_ATTRIBUTE_INSTALL_PATH "${CMAKE_BINARY_DIR}/ProductRelease"
            XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME "LaunchImage"
            )
    ENDIF()

    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" OR ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
        SET_SOURCE_FILES_PROPERTIES(
            ${NJLI_RESOURCES}
            PROPERTIES
            MACOSX_PACKAGE_LOCATION Resources
            )
        SET_TARGET_PROPERTIES(
            EngineSource PROPERTIES
            MACOSX_BUNDLE YES
            MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Info.plist"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME ${NJLI_APPICON_NAME}
            XCODE_ATTRIBUTE_PRODUCT_NAME ${NJLI_BUILD_PLATFORM}
            XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.njligames.engine.${NJLI_BUILD_PLATFORM}.source"
            RESOURCE "${NJLI_RESOURCES}"
            )

    ELSE()
        SET_TARGET_PROPERTIES(
            EngineSource PROPERTIES
            RESOURCE "${NJLI_RESOURCES}"
            )
    ENDIF()

    TARGET_LINK_LIBRARIES( EngineSource
        ${NJLIGameEngine_LBY}
        ${EXTRA_PLATFORM_LIBS}
        )
    ADD_CUSTOM_COMMAND(TARGET EngineSource
        PRE_BUILD
        COMMAND export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && make
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON 
        )

    #INSTALL(TARGETS EngineSource DESTINATION bin/engine/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE})

    ADD_EXECUTABLE( EngineLibrary
        ${libnjli_shared}
        ${NJLIGameEngine_SRCS} ${njli_generated} ${njli_generated_swig} ${njli_generated_swig_lua}
        ${NJLI_SOURCE_DIRECTORY}/njli/platform/main.cpp
        ${NJLI_RESOURCES}
        ${NJLIGameEngine_THIRDPARTY_INC}
        )

    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
        ADD_DEPENDENCIES(EngineLibrary libnjli_static)
    ELSE()
        ADD_DEPENDENCIES(EngineLibrary libnjli_shared)
    ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "emscripten" )
    
    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
        SET_TARGET_PROPERTIES (
            EngineLibrary PROPERTIES
            XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
            XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${NJLI_DEVICE_FAMILY}
            XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
            XCODE_ATTRIBUTE_INSTALL_PATH "${CMAKE_BINARY_DIR}/ProductRelease"
            XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME "LaunchImage"
            )
    ENDIF()

    IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" OR ${NJLI_BUILD_PLATFORM} STREQUAL "macOS" )
        SET_SOURCE_FILES_PROPERTIES(
            ${NJLI_RESOURCES}
            PROPERTIES
            MACOSX_PACKAGE_LOCATION Resources
            )
        SET_TARGET_PROPERTIES(
            EngineLibrary PROPERTIES
            MACOSX_BUNDLE YES
            MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/Info.plist"
            XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME ${NJLI_APPICON_NAME}
            XCODE_ATTRIBUTE_PRODUCT_NAME ${NJLI_BUILD_PLATFORM}
            XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.njligames.engine.${NJLI_BUILD_PLATFORM}.library"
            RESOURCE "${NJLI_RESOURCES}"
            )

    ELSE()
        SET_TARGET_PROPERTIES(
            EngineLibrary PROPERTIES
            RESOURCE "${NJLI_RESOURCES}"
            )
    ENDIF()

    TARGET_LINK_LIBRARIES( EngineLibrary
        ${NJLIGameEngine_LBY}
        ${EXTRA_PLATFORM_LIBS}
        )

    ADD_CUSTOM_COMMAND(TARGET EngineLibrary
        PRE_BUILD
        COMMAND export NJLI_BUILD_PLATFORM=${NJLI_BUILD_PLATFORM} && make
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/projects/COMMON 
        )

    #INSTALL(TARGETS EngineLibrary DESTINATION bin/engine/${NJLI_BUILD_DIR}/${CMAKE_BUILD_TYPE})


ENDIF()
