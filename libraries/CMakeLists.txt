message("*** Building fc ***")
add_subdirectory( fc )
if(NOT WIN32)
message("*** Building chainbase ***")
add_subdirectory( chainbase )
endif()
message("*** Building wasm-jit ***")
add_subdirectory( wasm-jit )
message("*** Building egenesis ***")
add_subdirectory( egenesis )
message("*** Building utilities ***")
add_subdirectory( utilities )
if(NOT WIN32)
message("*** Building appbase ***")
add_subdirectory( appbase )
endif()
message("*** Building chain ***")
add_subdirectory( chain )
message("*** Building testing ***")
add_subdirectory( testing )
message("*** Building abi_generator ***")
add_subdirectory( abi_generator )
