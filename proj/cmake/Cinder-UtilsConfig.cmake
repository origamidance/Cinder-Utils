if (NOT TARGET Cinder-Utils)
  get_filename_component(CINDER-UTILS_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)

list( APPEND EASYLOG_INCLUDE_DIRS
  ${CINDER-UTILS_PATH}/lib/easyloggingpp/
  )
list( APPEND EASYLOG_SOURCES
  ${CINDER-UTILS_PATH}/lib/easyloggingpp/easylogging++.h
  ${CINDER-UTILS_PATH}/lib/easyloggingpp/easylogging++.cc
  )

list( APPEND CINDER-UTILS_SOURCES
  ${EASYLOG_SOURCES}
  )

add_library(Cinder-Utils ${CINDER-UTILS_SOURCES})

add_compile_definitions(AUTO_INITIALIZE_EASYLOGGINGPP)
add_compile_definitions(ELPP_THREAD_SAFE)
add_compile_definitions(ELPP_STL_LOGGING)

include_directories(
  ${EASYLOG_INCLUDE_DIRS}
  )

target_include_directories( Cinder-Utils PUBLIC
  ${EASYLOG_INCLUDE_DIRS}
  ${CINDER-UTILS_PATH}/include
  )

if( NOT TARGET cinder )
	include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
	find_package( cinder REQUIRED PATHS
	  "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
	  "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
endif()

target_link_libraries( Cinder-Utils PRIVATE cinder )
endif()
