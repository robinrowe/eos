# Binaryen.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "Binaryen")
project(${NAME})
message("*** Building ${NAME} ***")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
set(GIT_REPO https://github.com/WebAssembly/binaryen)
set(GIT_TAG master)
set(PATH_Binaryen ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ Binaryen
	PREFIX              ${PATH_PREFIX}
	GIT_REPOSITORY      ${GIT_REPO}
	GIT_TAG             ${GIT_TAG}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory(
	"${PATH_PREFIX}/${NAME}-src" 
	"${PATH_PREFIX}/${NAME}-build"
)

if(1)
set(Binaryen_LIBRARIES 
	optimized 	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
	debug 		${PATH_PREFIX}/${NAME}-build/Debug/${NAME}staticd.lib
)	
set(Binaryen_LIBRARIES ${Binaryen_LIBRARIES} 
	CACHE STRING ${Binaryen_LIBRARIES})
set(Binaryen_INCLUDE_DIRS ${PATH_PREFIX}/Binaryen-src/Binaryen)
set(Binaryen_INCLUDE_DIRS ${Binaryen_INCLUDE_DIRS}
	CACHE STRING ${Binaryen_INCLUDE_DIRS})
set(Binaryen_FOUND TRUE CACHE BOOL TRUE)
else()
set(cmake_dir "${CMAKE_BINARY_DIR}/LLVM/LLVM-src/cmake/modules")
#message("llvm_dir = ${llvm_dir}")
set(CMAKE_PREFIX_PATH ${llvm_dir})
find_package(LLVM REQUIRED CONFIG)
endif()