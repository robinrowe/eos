# Secp256k1.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "Secp256k1")
project(${NAME})
message("--- Building ${NAME} ---")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
set(GIT_REPO https://github.com/bitcoin-core/secp256k1.git)
set(GIT_TAG master)
set(PATH_Secp256k1 ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ Secp256k1
	PREFIX              ${PATH_PREFIX}
	GIT_REPOSITORY      ${GIT_REPO}
	GIT_TAG             ${GIT_TAG}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(Secp256k1_LIBRARIES 
	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
)	
set(Secp256k1_LIBRARY ${Secp256k1_LIBRARIES} 
	CACHE STRING ${Secp256k1_LIBRARIES})
set(Secp256k1_INCLUDE_DIRS ${PATH_PREFIX}/Secp256k1-src/Secp256k1)
set(Secp256k1_INCLUDE_DIR ${Secp256k1_INCLUDE_DIRS}
	CACHE STRING ${Secp256k1_INCLUDE_DIRS})
set(Secp256k1_FOUND TRUE CACHE BOOL TRUE)

# Secp256k1 (missing: Secp256k1_INCLUDE_DIR Secp256k1_LIBRARY)
