set(NAME "Boost")
project(${NAME})
message("*** Building " ${NAME} " ***")

set(GIT_PATH https://github.com/boostorg/boost.git)
set(GIT_URL https://downloads.sourceforge.net/project/boost/boost/1.64.0/boost_1_64_0.zip)
set(GIT_TAG boost-1.64.0)
set(PATH_BOOST		"${CMAKE_BINARY_DIR}/boost" 
	CACHE STRING 	"${CMAKE_BINARY_DIR}/boost")
set(BOOST_INCLUDEDIR ${PATH_BOOST}/Boost-src/boost
	CACHE STRING ${PATH_BOOST}/Boost-src/boost)
set(BOOST_ROOT ${PATH_BOOST}/Boost-src
  CACHE STRING ${PATH_BOOST}/Boost-src)
set(Boost_NO_SYSTEM_PATHS TRUE)
set(Boost_NO_BOOST_CMAKE TRUE)
set(CMAKE_SYSTEM_PREFIX_PATH ${CMAKE_BINARY_DIR})

if(NOT IS_DIRECTORY ${PATH_BOOST})
download_project(PROJ ${NAME}
	PREFIX              ${PATH_BOOST}
#	GIT_REPOSITORY      ${GIT_PATH}
#	GIT_TAG             ${GIT_TAG}
	URL 				${GIT_URL}
	UPDATE_DISCONNECTED ON
	CONFIGURE_COMMAND	"cd boost/Boost-src/tools/build;./bootstrap.bat"
	BUILD_COMMAND		"cd boost/Boost-src/tools/build;./b2 --prefix=${PATH_BOOST}/Boost-build"
)
endif()

#add_subdirectory("${PATH_BOOST}/Boost-src" "${PATH_BOOST}/Boost-build")

FIND_PACKAGE(Boost 1.64 REQUIRED COMPONENTS
    thread
    date_time
    system
    filesystem
    program_options
    signals
    serialization
    chrono
    unit_test_framework
    context
    locale
	iostreams
)


