if (NOT TARGET Cinder-Utils)
find_package(Ceres REQUIRED)
find_package(Eigen3 REQUIRED)
set(Cinder-Utils_INCLUDES
  ${EIGEN3_INCLUDE_DIR}
  ${CERES_INCLUDE_DIRS}
  )
set(Cinder-Utils_LIBRARIES
  ${CERES_LIBRARIES}
  )
endif()
