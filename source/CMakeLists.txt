cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
cmake_policy(VERSION 2.8)

project(g-truc)

set(NAME_FULL full-build)
set(NAME_LAST last-build)

file(GLOB_RECURSE XML_FILE ${CMAKE_CURRENT_SOURCE_DIR}/*.xml)
file(GLOB_RECURSE XSL_FILE ${CMAKE_CURRENT_SOURCE_DIR}/*.xsl)
file(GLOB_RECURSE BAT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/*.bat)

source_group("XML Files" FILES ${XML_FILE})
source_group("XSL Files" FILES ${XSL_FILE})
source_group("BAT Files" FILES ${BAT_FILE})

add_custom_target(
	${NAME_FULL}
	COMMAND generator-full-xalan-c.bat
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	SOURCES ${XML_FILE} ${XSL_FILE} ${BAT_FILE})

#add_custom_command(
#	TARGET ${NAME_FULL}
#	PRE_BUILD
#	COMMAND cmake -E remove *.atom
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

#add_custom_command(
#	TARGET ${NAME_FULL}
#	PRE_BUILD
#	COMMAND cmake -E remove *.xml
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

#add_custom_command(
#	TARGET ${NAME_FULL}
#	PRE_BUILD
#	COMMAND cmake -E remove *.html
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

add_custom_target(
	${NAME_LAST}
	COMMAND generator-last-xalan-j.bat
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	SOURCES ${XML_FILE} ${XSL_FILE} ${BAT_FILE})

#add_custom_command(
#	TARGET ${NAME_LAST}
#	PRE_BUILD
#	COMMAND cmake -E remove *.atom
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

#add_custom_command(
#	TARGET ${NAME_LAST}
#	PRE_BUILD
#	COMMAND cmake -E remove *.xml
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)

#add_custom_command(
#	TARGET ${NAME_LAST}
#	PRE_BUILD
#	COMMAND cmake -E remove *.html
#	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/..)
