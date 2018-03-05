# OpenSSL.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "OpenSSL")
project(${NAME})
message("*** Building ${NAME} ***")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
#set(GIT_REPO https://github.com/openssl/openssl.git)
set(GIT_REPO https://github.com/pol51/OpenSSL-CMake.git)
set(GIT_TAG master)
set(PATH_OpenSSL ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ OpenSSL
	PREFIX              ${PATH_PREFIX}
	GIT_REPOSITORY      ${GIT_REPO}
	GIT_TAG             ${GIT_TAG}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(OpenSSL_LIBRARIES ${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib)	
set(OpenSSL_LIBRARY ${OpenSSL_LIBRARIES} 
	CACHE STRING ${OpenSSL_LIBRARIES})
set(OpenSSL_LIBRARIES ${OpenSSL_LIBRARIES} 
	CACHE STRING ${OpenSSL_LIBRARIES})
# OpenSSL/OpenSSL-build/ssl/openssl/ssl.h
# OpenSSL/OpenSSL-src/ssl/ssl.h
set(OPENSSL_CRYPTO_LIBRARY ${OpenSSL_LIBRARIES} CACHE STRING ${OpenSSL_LIBRARIES})
set(OpenSSL_INCLUDE_DIRS ${PATH_PREFIX}/${NAME}-build/ssl)
set(OpenSSL_INCLUDE_DIR ${OpenSSL_INCLUDE_DIRS}
	CACHE STRING ${OpenSSL_INCLUDE_DIRS})
set(OpenSSL_FOUND TRUE CACHE BOOL TRUE)
set(OPENSSL_ROOT_DIR ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})
set(OPENSSL_USE_STATIC_LIBS TRUE CACHE BOOL TREU)
