import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import '../my_padding.dart';
import '../theme.dart';
import '../util.dart';
import 'border_style.dart';

sealed class MyButtonStyle {
  static ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: getElevatedButtonStyle(),
    );
  }
  static ButtonStyle getElevatedButtonStyle() {
    return  ButtonStyle(
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) {
          if (states.contains(WidgetState.pressed)) {
            return 1;
          }
          return 2;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
          getStateColorForElevatedButton),
      iconColor: WidgetStateProperty.resolveWith<Color>(
          getStateColorForElevatedButton),
      iconSize: WidgetStateProperty.all<double>(MyFontSize.mainSize),
      maximumSize: getMaximumSizeForButton(),
      minimumSize: getMinimumSizeForButton(),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM02),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: getBorderRadius(),
        ),
      ),
      visualDensity: VisualDensity.comfortable,
      side: WidgetStateProperty.resolveWith<BorderSide>(
            (states) {
          if (states.contains(WidgetState.pressed)) {
            return getBorderSide(color: myThemeColor);
          }
          return getBorderSide(color: myThemeColor[300]!);
        },
      ),
      backgroundColor: WidgetStateProperty.all<Color>(myThemeColor[300]!),
    );
  }

  static OutlinedButtonThemeData getOutlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style:getOutlinedButtonStyle(),
    );
  }
  static ButtonStyle getOutlinedButtonStyle() {
    return  ButtonStyle(
      animationDuration: const Duration(
        milliseconds: 200,
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
            (states) {
          if (states.contains(WidgetState.pressed)) {
            return 1;
          }
          return 2;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
          getStateColorForOutlinedButton),
      iconColor: WidgetStateProperty.resolveWith<Color>(
          getStateColorForOutlinedButton),
      iconSize: WidgetStateProperty.all<double>(MyFontSize.mainSize),
      maximumSize: getMaximumSizeForButton(),
      minimumSize: getMinimumSizeForButton(),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM02),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: getBorderRadius(),
        ),
      ),
      surfaceTintColor: WidgetStateProperty.all<Color>(myThemeColor[200]!),
      visualDensity: VisualDensity.comfortable,
      side: WidgetStateProperty.all<BorderSide>(
        getBorderSide(color: myThemeColor[400]!),
      ),
    );
  }
  static IconButtonThemeData getIconButtonThemeData() {
    return IconButtonThemeData(
      style: ButtonStyle(
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        elevation: WidgetStateProperty.resolveWith<double>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return 1;
            }
            return 2;
          },
        ),
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>(getStateColorForIconButton),
        iconColor:
            WidgetStateProperty.resolveWith<Color>(getStateColorForIconButton),
        iconSize: WidgetStateProperty.all<double>(MyFontSize.sizeMedium),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM01),
        ),
        visualDensity: VisualDensity.comfortable,
      ),
    );
  }
}
