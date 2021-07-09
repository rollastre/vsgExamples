cmake_minimum_required(VERSION 3.8)


#if (IOS)
    set(PLATFORM "OS")
    include(/Users/jaume/Documents/dev/CMake-utils/toolchains/ios.toolchain.cmake)
    set(Vulkan_LIBRARY "/Users/jaume/.conan/data/vulkan/1.2.135.0/iq/stable/package/0458ed5e3c5080307ca8a3bae7bab3c04f2768cc/lib/libvulkan.dylib")
    set(vsg_DIR "/Users/jaume/Documents/dev/vulkan/install-ios/lib/cmake/vsg")
#endif()
project(IOS_vsg_native_example)

set(TARGET vsgiosnative)

find_library(UIKIT_LIBRARY UiKit)
find_library(QUARTZCORE_LIBRARY QuartzCore)
find_package(vsg)

set(LIBRARIES ${LIBRARIES}
    PRIVATE ${UIKIT_LIBRARY}
    PRIVATE ${QUARTZCORE_LIBRARY}
    vsg::vsg
)

set(SOURCES
    main.m
    vsg_iOS_ViewController.h
    vsg_iOS_ApplicationDelegate.h
    vsg_iOS_ApplicationDelegate.m
    vsg_iOS_ViewController.mm
)

add_executable(
    ${TARGET}
    ${SOURCES}
)

target_compile_features(${TARGET} PRIVATE cxx_std_17)

target_link_libraries(
    ${TARGET}

    ${LIBRARIES}
)
