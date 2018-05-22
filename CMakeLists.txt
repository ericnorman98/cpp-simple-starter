cmake_minimum_required(VERSION 2.6)

project(app)

if(MSVC)
	add_definitions(-c -W4)
else()
	add_definitions(-c -Wall -msse2)
endif()

if (CMAKE_BUILD_TYPE STREQUAL "")
	set(
		CMAKE_BUILD_TYPE "Debug"
		CACHE STRING "Choose the type of build, options are: None (CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) \"Debug\" \"Release\" \"RelWithDebInfo\" \"MinSizeRel\"."
		FORCE
	)
endif (CMAKE_BUILD_TYPE STREQUAL "")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
	add_definitions( -g )
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

if (CMAKE_BUILD_TYPE STREQUAL "Release")
    add_definitions( -O2 )
endif (CMAKE_BUILD_TYPE STREQUAL "Release")

file(GLOB_RECURSE HDRS 
	${app_SOURCE_DIR}/src/*.hpp
	${app_SOURCE_DIR}/src/*.h
)

file(GLOB_RECURSE SRCS
	${app_SOURCE_DIR}/src/*.cpp
	${app_SOURCE_DIR}/src/*.c
)

add_executable(app ${HDRS} ${SRCS})

SET(app_CMAKE_DIR "${app_SOURCE_DIR}/cmake")

include_directories(
	${app_SOURCE_DIR}/src
)