//
// Created by origamidance on 2/27/18.
//

#ifndef CINDERELLAAPP_CEREALUTILS_H
#define CINDERELLAAPP_CEREALUTILS_H

#endif //CINDERELLAAPP_CEREALUTILS_H
#include <cereal/cereal.hpp>
#include <Eigen/Core>
#include <iostream>
/**
 * @brief Serialisation of Eigen matrices for the serialisation
 * library cereal (http://uscilab.github.io/cereal/index.html).
 *
 * Contains serialisation for Eigen matrices to binary archives, i.e. matrices like
 * \c Eigen::MatrixXf, \c Eigen::Matrix4d, or \c Eigen::Vector3f.
 *
 */
namespace cereal {

/**
 * @brief Serealizing Eigen matrix.
 * @param ar[in] The Archive serialize to
 * @param m[in] The matrix to serialize
 */
template<class Archive, class _Scalar, int _Rows, int _Cols, int _Options, int _MaxRows, int _MaxCols>
void save(Archive &ar, const ::Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols> &m) {
  int rows = m.rows(), cols = m.cols();
  ar(CEREAL_NVP(rows));
  ar(CEREAL_NVP(cols));
  const std::vector<_Scalar> data(m.data(), m.data() + m.size());
  ar(cereal::make_nvp("data", data));
}

/**
 *
 * @param ar
 * @param m
 */
template<class Archive, class _Scalar, int _Rows, int _Cols, int _Options, int _MaxRows, int _MaxCols>
void load(Archive &ar, ::Eigen::Matrix<_Scalar, _Rows, _Cols, _Options, _MaxRows, _MaxCols> &m) {
  int rows, cols;
  ar(CEREAL_NVP(rows));
  ar(CEREAL_NVP(cols));
  std::vector<_Scalar> data(rows*cols);
  ar(data);
  if (rows*cols!=m.size()) m.resize(rows, cols);
  std::copy(data.begin(), data.end(), m.data());
}

} /* namespace cereal */
