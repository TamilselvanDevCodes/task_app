import 'package:flutter/material.dart';

import 'constants/size_constants.dart';

sealed class MyPadding {
  static const double _minMultiplier = 0.0;
  static const double _maxMultiplier = 0.5;

  static void _validateMultiplier(double multiplier) {
    assert(multiplier <= _maxMultiplier && multiplier >= _minMultiplier,
    'Multiplier must be between $_minMultiplier and $_maxMultiplier (inclusive).');
  }

  static EdgeInsets getDimensionEdgeInsets({required double multiplier}) {
    _validateMultiplier(multiplier);
    return EdgeInsets.symmetric(
      horizontal: sizeConstants.width * multiplier,
      vertical: sizeConstants.height * multiplier,
    );
  }

  static EdgeInsets getTopEdgeInsets({required double multiplier}) {
    _validateMultiplier(multiplier);
    return EdgeInsets.only(top: sizeConstants.height * multiplier);
  }

  static EdgeInsets getBottomEdgeInsets({required double multiplier}) {
    _validateMultiplier(multiplier);
    return EdgeInsets.only(bottom: sizeConstants.height * multiplier);
  }

  static EdgeInsets getLeftEdgeInsets({required double multiplier}) {
    _validateMultiplier(multiplier);
    return EdgeInsets.only(left: sizeConstants.width * multiplier);
  }

  static EdgeInsets getRightEdgeInsets({required double multiplier}) {
    _validateMultiplier(multiplier);
    return EdgeInsets.only(right: sizeConstants.width * multiplier);
  }

}





sealed class MultiplierConstant{

  //Thousands
  static const double dM001=0.001;
  static const double dM002=0.002;
  static const double dM003=0.003;
  static const double dM004=0.004;
  static const double dM005=0.005;
  static const double dM006=0.006;
  static const double dM007=0.007;
  static const double dM008=0.008;
  static const double dM009=0.009;

  //Hundreds
  static const double dM01=0.01;
  static const double dM02=0.02;
  static const double dM03=0.03;
  static const double dM04=0.04;
  static const double dM05=0.05;
  static const double dM06=0.06;
  static const double dM07=0.07;
  static const double dM08=0.08;
  static const double dM09=0.09;

  //Tens
  static const double dM1=0.1;
  static const double dM2=0.2;
  static const double dM3=0.3;
  static const double dM4=0.4;
  static const double dM5=0.5;
  static const double dM6=0.6;
  static const double dM7=0.7;
  static const double dM8=0.8;
  static const double dM9=0.9;

}
