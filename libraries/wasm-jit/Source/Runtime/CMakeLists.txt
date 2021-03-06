set(Sources
	Intrinsics.cpp
	Linker.cpp
	LLVMEmitIR.cpp
	LLVMJIT.cpp
	LLVMJIT.h
	Memory.cpp
	ModuleInstance.cpp
	ObjectGC.cpp
	Runtime.cpp
	RuntimePrivate.h
	Table.cpp
	Threads.cpp
	WAVMIntrinsics.cpp
  )
set(PublicHeaders
	${WAVM_INCLUDE_DIR}/Runtime/Intrinsics.h
	${WAVM_INCLUDE_DIR}/Runtime/Linker.h
	${WAVM_INCLUDE_DIR}/Runtime/Runtime.h
	${WAVM_INCLUDE_DIR}/Runtime/TaggedValue.h)
include_directories(${WAVM_INCLUDE_DIR}/Runtime)

add_library(Runtime STATIC ${Sources} ${PublicHeaders})

# Find an installed build of LLVM
if(WIN32)
	find_package(LLVM REQUIRED CONFIG)
else()
	find_package(LLVM 4.0 REQUIRED CONFIG)
endif()
# Include the LLVM headers
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_definitions(-DRUNTIME_API=DLL_EXPORT)

target_include_directories( Runtime PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../../chain/include )

# Link against the LLVM libraries
llvm_map_components_to_libnames(LLVM_LIBS support core passes mcjit native DebugInfoDWARF)
target_link_libraries(Runtime Platform Logging IR ${LLVM_LIBS})
