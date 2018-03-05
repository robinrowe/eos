# LLVM.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "LLVM")
project(${NAME})
message("*** Building ${NAME} ***")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
set(TARBALL http://releases.llvm.org/5.0.1/llvm-5.0.1.src.tar.xz)

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ ${NAME}
	PREFIX   ${PATH_PREFIX}
	URL      ${TARBALL}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(${NAME}_LIBRARIES 
	optimized 	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
	debug 		${PATH_PREFIX}/${NAME}-build/Debug/${NAME}staticd.lib
)	
set(${NAME}_LIBRARIES ${${NAME}_LIBRARIES} 
	CACHE STRING ${${NAME}_LIBRARIES})
set(${NAME}_INCLUDE_DIRS ${PATH_PREFIX}/${NAME}-src/${NAME})
set(${NAME}_INCLUDE_DIR ${${NAME}_INCLUDE_DIRS}
	CACHE STRING ${${NAME}_INCLUDE_DIRS})
set(${NAME}_FOUND TRUE CACHE BOOL TRUE)

#./LLVM/LLVM-build/cmake/modules/CMakeFiles/LLVMConfig.cmake
#./LLVM/LLVM-build/lib/cmake/llvm/LLVMConfig.cmake
#$ find LLVM -name "*onfig.cmake"
#LLVM/LLVM-build/cmake/modules/CMakeFiles/LLVMConfig.cmake
#LLVM/LLVM-build/lib/cmake/llvm/LLVM-Config.cmake
#LLVM/LLVM-build/lib/cmake/llvm/LLVMConfig.cmake
#LLVM/LLVM-src/cmake/modules/LLVM-Config.cmake
set(llvm_dir "${CMAKE_BINARY_DIR}/LLVM/LLVM-src/cmake/modules")
#message("llvm_dir = ${llvm_dir}")
set(CMAKE_PREFIX_PATH ${llvm_dir})
find_package(LLVM REQUIRED CONFIG)

