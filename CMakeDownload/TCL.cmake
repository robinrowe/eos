# TCL.cmake
# Copyright 2018/2/2 Robin.Rowe@CinePaint.org
# License open source MIT

set(NAME "TCL")
project(${NAME})
message("--- Building ${NAME} ---")

set(PATH_PREFIX	"${CMAKE_BINARY_DIR}/${NAME}")
#set(TARBALL https://downloads.sourceforge.net/project/tcllib/tcllib/1.18/tcllib-1.18.zip)
set(GIT_REPO https://github.com/robinrowe/tcl-cmake.git)
set(GIT_TAG master)
set(PATH_TCL ${PATH_PREFIX} CACHE STRING ${PATH_PREFIX})

if(NOT IS_DIRECTORY ${PATH_PREFIX})
download_project(PROJ TCL
	PREFIX   ${PATH_PREFIX}
#	URL      ${TARBALL}
	GIT_REPOSITORY      ${GIT_REPO}
	GIT_TAG             ${GIT_TAG}
	UPDATE_DISCONNECTED ON
)
endif()

add_subdirectory("${PATH_PREFIX}/${NAME}-src" "${PATH_PREFIX}/${NAME}-build")

set(TCL_LIBRARIES 
	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
)

set(TCL_LIBRARY ${TCL_LIBRARIES} 
	CACHE STRING ${TCL_LIBRARIES})
set(TCL_INCLUDE_PATH ${PATH_PREFIX}/TCL-src/TCL)
set(TCL_INCLUDE_PATH ${TCL_INCLUDE_PATH} 
	CACHE STRING ${TCL_INCLUDE_PATH})
set(TCL_INCLUDE_DIRS ${TCL_INCLUDE_PATH}
	CACHE STRING ${TCL_INCLUDE_PATH})
set(TCL_FOUND TRUE CACHE BOOL TRUE)

set(TK_INCLUDE_PATH ${PATH_PREFIX}/TCL-src/TCL)
set(TK_INCLUDE_PATH ${TK_INCLUDE_PATH} 
	CACHE STRING ${TK_INCLUDE_PATH})

set(TK_LIBRARIES
	${PATH_PREFIX}/${NAME}-build/Release/${NAME}static.lib
)

set(TK_LIBRARY ${TK_LIBRARIES}
	CACHE STRING ${TK_LIBRARIES})


#-- tcl INCLUDE PATH: /include
#-- Could NOT find TCL (missing: TCL_INCLUDE_PATH)
#-- Could NOT find TCLTK (missing: TCL_INCLUDE_PATH TK_LIBRARY)
#-- Could NOT find TK (missing: TK_LIBRARY)
#$ grep TCL_INCLUDE_PATH CMakeCache.txt
#TCL_INCLUDE_PATH:PATH=

message("TCL_INCLUDE_PATH = ${TCL_INCLUDE_PATH}")
message("TCL_LIBRARY = ${TCL_LIBRARY}")

#-- Could NOT find TCLTK (missing: TCL_LIBRARY TK_LIBRARY TK_INCLUDE_PATH)
#TCL_FOUND              = Tcl was found
#TK_FOUND               = Tk was found
#TCLTK_FOUND            = Tcl and Tk were found
#TCL_LIBRARY            = path to Tcl library (tcl tcl80)
#TCL_INCLUDE_PATH       = path to where tcl.h can be found
#TCL_TCLSH              = path to tclsh binary (tcl tcl80)
#TK_LIBRARY             = path to Tk library (tk tk80 etc)
#TK_INCLUDE_PATH        = path to where tk.h can be found
#TK_WISH                = full path to the wish executable