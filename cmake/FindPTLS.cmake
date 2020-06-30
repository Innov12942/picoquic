# - Try to find Picotls

message(STATUS "CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message(STATUS "CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")


find_path(PTLS_INCLUDE_DIR
    NAMES picotls/openssl.h
    HINTS ${CMAKE_SOURCE_DIR}/../picotls/include
          ${CMAKE_BINARY_DIR}/../../picotls/include
          ../picotls/include/ )

message(STATUS "PTLS_INCLUDE_DIR: ${PTLS_INCLUDE_DIR}")


set(PTLS_HINTS ${CMAKE_BINARY_DIR}/../../picotls ../picotls)

message(STATUS "PTLS_HINTS: ${PTLS_HINTS}")

find_library(PTLS_CORE_LIBRARY picotls-core HINTS ${PTLS_HINTS})
find_library(PTLS_OPENSSL_LIBRARY picotls-openssl HINTS ${PTLS_HINTS})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set PTLS_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(PTLS REQUIRED_VARS
    PTLS_CORE_LIBRARY
    PTLS_OPENSSL_LIBRARY
    PTLS_INCLUDE_DIR)

if(PTLS_FOUND)
    set(PTLS_LIBRARIES ${PTLS_CORE_LIBRARY} ${PTLS_OPENSSL_LIBRARY})
    set(PTLS_INCLUDE_DIRS ${PTLS_INCLUDE_DIR})
endif()

mark_as_advanced(PTLS_LIBRARIES PTLS_INCLUDE_DIRS)
