#ZLIB.cmake
set(NAME "zlib")
project(${NAME})
message("--- Building " ${NAME} " ---")

set(PATH_ZLIB "${CMAKE_BINARY_DIR}/zlib")
set(URL_ZLIB "http://zlib.net/zlib-1.2.11.tar.gz")

if(NOT IS_DIRECTORY ${PATH_ZLIB})
	download_project(PROJ zlib
	PREFIX ${PATH_ZLIB}
	URL ${URL_ZLIB}
	UPDATE_DISCONNECTED ON
)
endif()

set(ZLIB_ROOT "${CMAKE_BINARY_DIR}/zlib" 
 CACHE STRING "${CMAKE_BINARY_DIR}/zlib")

set(ZLIB_INCLUDE_DIRS "${PATH_ZLIB}/zlib-build" "${PATH_ZLIB}/zlib-src")

set(ZLIB_INCLUDE_DIR ${ZLIB_INCLUDE_DIRS} 
        CACHE STRING ${ZLIB_INCLUDE_DIRS})

include_directories(${ZLIB_INCLUDE_DIRS})
#message("ZLIB_INCLUDE_DIR = ${ZLIB_INCLUDE_DIR}")

add_subdirectory("${PATH_ZLIB}/zlib-src" "${PATH_ZLIB}/zlib-build")

set(ZLIB_FOUND TRUE CACHE BOOL TRUE)
set(ZLIB_LIBRARY 
	optimized 	${PATH_ZLIB}/${NAME}-build/Release/${NAME}staticd.lib
	debug 		${PATH_ZLIB}/${NAME}-build/Debug/${NAME}staticd.lib
)
set(ZLIB_LIBRARY ${ZLIB_LIBRARY} CACHE STRING ${ZLIB_LIBRARY})