if (NOT TARGET Cinder-Utils)
  get_filename_component(CINDER-UTILS_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)
# find_package(Ceres REQUIRED)
# find_package(Eigen3 REQUIRED)
set(Cinder-Utils_INCLUDES
  # ${EIGEN3_INCLUDE_DIR}
  # ${CERES_INCLUDE_DIRS}
  ${CINDER-UTILS_PATH}/include
  )
# set(Cinder-Utils_LIBRARIES
#   ${CERES_LIBRARIES}
#   )

endif()
