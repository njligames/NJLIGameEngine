cmake_minimum_required (VERSION 3.7)

INCLUDE(FindXCTest)

# This little macro lets you set any XCode specific property
macro (set_xcode_property TARGET XCODE_PROPERTY XCODE_VALUE)
	set_property (TARGET ${TARGET} PROPERTY XCODE_ATTRIBUTE_${XCODE_PROPERTY} ${XCODE_VALUE})
endmacro (set_xcode_property)

macro (unset_xcode_property TARGET XCODE_PROPERTY)
  set_property (TARGET ${TARGET} PROPERTY XCODE_ATTRIBUTE_${XCODE_PROPERTY})
endmacro (unset_xcode_property)

find_package(XCTest REQUIRED)

CONFIGURE_FILE (
  "${CMAKE_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/TestInfo.plist.in"
  "${CMAKE_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/TestInfo.plist"
)

set(TEST_NAME NJLIGameEngineTest_${NJLI_BUILD_PLATFORM})

xctest_add_bundle(${TEST_NAME} ${NJLI_PRODUCT_NAME}
  ${CMAKE_CURRENT_LIST_DIR}/Tests.m
  )
set_target_properties(${TEST_NAME} PROPERTIES MACOSX_BUNDLE_INFO_PLIST "${CMAKE_SOURCE_DIR}/cmake.in/Platform.in/${NJLI_BUILD_PLATFORM}/TestInfo.plist")
xctest_add_test(XCTest.${TEST_NAME} ${TEST_NAME})

set_xcode_property(${TEST_NAME} LD_RUNPATH_SEARCH_PATHS "$(inherited) @executable_path/Frameworks @loader_path/Frameworks")
set_xcode_property(${TEST_NAME} ONLY_ACTIVE_ARCH "YES")
set_xcode_property(${TEST_NAME} PRODUCT_BUNDLE_IDENTIFIER ${NJLIGameEngine_TEST_PRODUCT_BUNDLE_IDENTIFIER})
unset_xcode_property(${TEST_NAME} TEST_HOST)
unset_xcode_property(${TEST_NAME} BUNDLE_LOADER)
set_xcode_property(${TEST_NAME} USES_XCTRUNNER "YES")
set_xcode_property(${TEST_NAME} TEST_TARGET_NAME "${NJLI_PRODUCT_NAME}")
set_xcode_property(${TEST_NAME} FRAMEWORK_SEARCH_PATHS "\$(inherited)")
set_target_properties(${TEST_NAME} PROPERTIES XCODE_PRODUCT_TYPE "com.apple.product-type.bundle.ui-testing")
# set_target_properties(${TEST_NAME} PROPERTIES XCODE_ATTRIBUTE_DEVELOPMENT_TEAM $ENV{NJLI_DEVELOPMENT_TEAM})
IF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )
  set_target_properties (
    ${TEST_NAME} PROPERTIES
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${NJLI_DEVICE_FAMILY}
    XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
    XCODE_ATTRIBUTE_INSTALL_PATH "${CMAKE_BINARY_DIR}/ProductRelease"
    XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
    XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME "LaunchImage"
    XCODE_ATTRIBUTE_ENABLE_BITCODE TRUE
    XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH "NO"
  )
ENDIF( ${NJLI_BUILD_PLATFORM} STREQUAL "appletv" OR ${NJLI_BUILD_PLATFORM} STREQUAL "ios" )

