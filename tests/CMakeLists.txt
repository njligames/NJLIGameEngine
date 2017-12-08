cmake_minimum_required (VERSION 3.7)

set(TEST_SOURCE
  ${CMAKE_CURRENT_LIST_DIR}/Tests.m
)

xctest_add_bundle(Test
  ${NJLI_PRODUCT_NAME}
  ${TEST_SOURCE}
)

if(NOT LOGIC_ONLY_TESTS)
  target_include_directories(Test PUBLIC
    "${CMAKE_SOURCE_DIR}/src"
    )
endif(NOT LOGIC_ONLY_TESTS)

xctest_add_test(
  ${NJLIGameEngine_TEST_PRODUCT_BUNDLE_IDENTIFIER}
  Test
)

set(CMAKE_SHARED_LINKER_FLAGS "-Wall")

    #XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${DEPLOYMENT_TARGET}
    #MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_LIST_DIR}/tests.plist.in
IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
set_target_properties(Test PROPERTIES
  XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
  XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${NJLI_DEVICE_FAMILY}
)
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
set_target_properties(Test PROPERTIES
  XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited)"
)

IF(NOT "$ENV{NJLI_DEVELOPMENT_TEAM}" STREQUAL "")
  SET_TARGET_PROPERTIES( Test PROPERTIES
    XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{NJLI_DEVELOPMENT_TEAM}
  )
ENDIF(NOT "$ENV{NJLI_DEVELOPMENT_TEAM}" STREQUAL "")

if(LOGIC_ONLY_TESTS)
  set_target_properties(Test PROPERTIES
    XCODE_ATTRIBUTE_TEST_HOST ""
    )
endif(LOGIC_ONLY_TESTS)

# This is needed to erase invalid framework search paths set by FindXCTest.
# The drawback is that you can not use target_include_directories for setting up
# search paths for this target. You have to use
# XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS. As long as you stick to running
# tests on code compiled into the host app this is not a hindrance.
set_target_properties(Test PROPERTIES
    XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "\$(inherited) "
)
