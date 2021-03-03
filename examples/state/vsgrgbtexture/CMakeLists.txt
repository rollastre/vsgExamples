set(SOURCES vsgrgbtexture.cpp)

add_executable(vsgrgbtexture ${SOURCES})

target_link_libraries(vsgrgbtexture vsg::vsg)
