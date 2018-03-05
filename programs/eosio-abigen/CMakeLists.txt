set(SOURCES main.cpp)
if(WIN32)
find_package(LLVM REQUIRED CONFIG)
else()
find_package(LLVM 4.0 REQUIRED CONFIG)
endif()

link_directories(${LLVM_LIBRARY_DIR})

add_executable(eosio-abigen ${SOURCES})

set( CMAKE_CXX_STANDARD 14 )

if( UNIX AND NOT APPLE )
  set(rt_library rt )
endif()

find_package( Gperftools QUIET )
if( GPERFTOOLS_FOUND )
    message( STATUS "Found gperftools; compiling with TCMalloc")
    list( APPEND PLATFORM_SPECIFIC_LIBS tcmalloc )
endif()

target_link_libraries(eosio-abigen abi_generator)


install( TARGETS
   eosio-abigen
   RUNTIME DESTINATION bin
   LIBRARY DESTINATION lib
   ARCHIVE DESTINATION lib
)
