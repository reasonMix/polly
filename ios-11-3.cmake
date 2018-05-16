# Copyright (c) 2015, Tomas Zemaitis
# All rights reserved.

if(DEFINED POLLY_IOS_11_3_CMAKE_)
  return()
else()
  set(POLLY_IOS_11_3_CMAKE_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_clear_environment_variables.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

set(IOS_SDK_VERSION 11.3)
set(IOS_DEPLOYMENT_SDK_VERSION 10.3)

set(POLLY_XCODE_COMPILER "clang")
polly_init(
    "iOS ${IOS_SDK_VERSION} Universal (iphoneos + iphonesimulator) / \
${POLLY_XCODE_COMPILER} / \
c++11 support"
    "Xcode"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_fatal_error)

# Fix try_compile
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)
set(MACOSX_BUNDLE_GUI_IDENTIFIER com.shininggames.games.wooha2)
set(CMAKE_MACOSX_BUNDLE YES)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer: liu renhua (H7WN66S2FD)")
set(CMAKE_XCODE_ATTRIBUTE_PROVISIONING_PROFILE "wooha-new")


set(IPHONEOS_ARCHS armv7;armv7s;arm64)
set(IPHONESIMULATOR_ARCHS i386;x86_64)

include("${CMAKE_CURRENT_LIST_DIR}/compiler/xcode.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/iphone.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx11.cmake")
