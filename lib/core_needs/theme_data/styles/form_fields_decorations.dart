import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import '../constants/size_constants.dart';
import '../theme.dart';
import 'border_style.dart';

sealed class MyInputDecorationThemeData{
  static InputDecorationTheme getLightMode(){
    return InputDecorationTheme(
      activeIndicatorBorder: MyBorderStyle.getActiveIndicatorBorder(),
      constraints: BoxConstraints(
        minHeight: sizeConstants.sH1,
        minWidth: sizeConstants.sW05,
        maxHeight: sizeConstants.sH2,
        maxWidth: sizeConstants.sW9,
      ),
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.all(sizeConstants.sH02),
      border: MyBorderStyle.getBorder(),
      enabledBorder: MyBorderStyle.getEnabledBorder(),
      disabledBorder: MyBorderStyle.getDisabledBorder(),
      errorBorder: MyBorderStyle.getErrorBorder(),
      focusedBorder: MyBorderStyle.getFocusedBorder(),
      focusedErrorBorder: MyBorderStyle.getFocusedErrorBorder(),
      errorMaxLines: 2,
      filled: true,
      fillColor: myThemeColor[50],
      errorStyle: MyFormFieldTextStyle.getErrorTextStyle(),
      helperMaxLines: 1,
      floatingLabelStyle: MyFormFieldTextStyle.getFloatingLabelTextStyle(),
      helperStyle: MyFormFieldTextStyle.getHelperTextStyle(),
      hintStyle: MyFormFieldTextStyle.getHintTextStyle(),
      labelStyle: MyFormFieldTextStyle.getLabelTextStyle(),
      outlineBorder: MyBorderStyle.getOutlinedBorder(),
      prefixStyle: MyFormFieldTextStyle.getPrefixTextStyle(),
      suffixStyle: MyFormFieldTextStyle.getSuffixTextStyle(),
      counterStyle: MyFormFieldTextStyle.getCounterTextStyle(),
    );
  }
}

