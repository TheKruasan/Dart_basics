cmake_minimum_required(VERSION 3.4.1)
project (simple_library VERSION 1.0.0 LANGUAGES C)
add_library(
            simple_library
            SHARED
            ../../src/simple.c
            ../../src/simple.def
)
add_executable(simple_test simple.c)

set_target_properties(simple_library PROPERTIES
    PUBLIC_HEADER simple.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "simple"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)
