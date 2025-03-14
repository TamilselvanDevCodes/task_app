import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';

import '../constants/style_constant.dart';
import '../theme.dart';
sealed class MyBorderStyle {
  static BorderSide getActiveIndicatorBorder() {
    return getBorderSide(
      color: myThemeColor,
    );
  }

  static InputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: myThemeColor[200]!,
      ),
    );
  }

  static InputBorder getEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: myThemeColor[500]!,
      ),
    );
  }

  static InputBorder getDisabledBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: myThemeColor[200]!,
      ),
    );
  }

  static InputBorder getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: Colors.red[500]!,
      ),
    );
  }

  static InputBorder getFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: myThemeColor[700]!,
      ),
    );
  }

  static InputBorder getFocusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: getBorderRadius(),
      borderSide: getBorderSide(
        color: Colors.red[800]!,
      ),
    );
  }

  static BorderSide getOutlinedBorder() {
    return getBorderSide(color: myThemeColor[500]!);
  }
}

BorderRadius getBorderRadius() => BorderRadius.circular(MyFontSize.sizeSmall);

BorderSide getBorderSide({Color? color}) {
  return BorderSide(
    color: color??myThemeColor,
    width: StyleConstant.thickness,
    style: BorderStyle.solid,
  );
}