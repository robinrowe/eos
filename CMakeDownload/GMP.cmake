# GMP.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "GMP")
project(${NAME})
message("*** Building ${NAME} ***")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
set(TARBALL https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2)
set(PATH_GMP ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ GMP
	PREFIX   ${PATH_PREFIX}
	URL      ${TARBALL}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(GMP_LIBRARIES 
	optimized 	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
	debug 		${PATH_PREFIX}/${NAME}-build/Debug/${NAME}staticd.lib
)	
set(GMP_LIBRARIES ${GMP_LIBRARIES} 
	CACHE STRING ${GMP_LIBRARIES})
set(GMP_INCLUDE_DIRS ${PATH_PREFIX}/GMP-src/GMP)
set(GMP_INCLUDE_DIR ${GMP_INCLUDE_DIRS}
	CACHE STRING ${GMP_INCLUDE_DIRS})
set(GMP_FOUND TRUE CACHE BOOL TRUE)

#GMP (missing: GMP_INCLUDE_DIR)

