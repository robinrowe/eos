# BZip2.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "BZip2")
project(${NAME})
message("*** Building ${NAME} ***")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
set(GIT_REPO https://github.com/WardF/libbzip2.git)
set(GIT_TAG master)
set(PATH_BZip2 ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ BZip2
	PREFIX              ${PATH_PREFIX}
	GIT_REPOSITORY      ${GIT_REPO}
	GIT_TAG             ${GIT_TAG}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(BZIP2_LIBRARIES 
	optimized 	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
	debug 		${PATH_PREFIX}/${NAME}-build/Debug/${NAME}staticd.lib
)	
set(BZIP2_LIBRARIES ${BZIP2_LIBRARIES} 
	CACHE STRING ${BZIP2_LIBRARIES})
set(BZIP2_INCLUDE_DIRS ${PATH_PREFIX}/BZip2-src/BZip2)
set(BZIP2_INCLUDE_DIR ${BZIP2_INCLUDE_DIRS}
	CACHE STRING ${BZIP2_INCLUDE_DIRS})
set(BZIP2_FOUND TRUE CACHE BOOL TRUE)
# BZip2 (missing: BZIP2_LIBRARIES BZIP2_INCLUDE_DIR)

