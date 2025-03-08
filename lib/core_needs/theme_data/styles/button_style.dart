import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';

import '../constants/size_constants.dart';
import '../my_padding.dart';
import '../theme.dart';
import '../util.dart';
import 'border_style.dart';

sealed class MyButtonStyle {
  static ElevatedButtonThemeData getElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        // backgroundBuilder: (BuildContext context, Set<WidgetState> widgets, Widget? child) {
        //   debugPrint("backgroundBuilder called");
        //   debugPrint("widgets $widgets");
        //   return Center(child: Text("backgroundBuilder"));
        // },
        elevation: WidgetStateProperty.resolveWith<double>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return 1;
            }
            return 2;
          },
        ),
        // foregroundBuilder: (BuildContext context, Set<WidgetState> widgets, Widget? child){
        //   debugPrint("foregroundBuilder called");
        //   debugPrint("widgets $widgets");
        //   return Text("foregroundBuilder");
        // }
        foregroundColor: WidgetStateProperty.resolveWith<Color>(getStateColorForElevatedButton),
        iconColor: WidgetStateProperty.resolveWith<Color>(getStateColorForElevatedButton),
        iconSize: WidgetStateProperty.all<double>(MyFontSize.mainSize),
        maximumSize:getMaximumSizeForButton(),
        minimumSize: getMinimumSizeForButton(),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM02),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:getBorderRadius(),
          ),
        ),
        // surfaceTintColor: WidgetStateProperty.all<Color>(myThemeColor[200]!),
        visualDensity: VisualDensity.comfortable,
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.pressed)) {
            return getBorderSide(color: myThemeColor);
          }
          return getBorderSide(color:myThemeColor[300]!);
        },),
        //splashFactory: InkRipple.splashFactory,
        //tapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: WidgetStateProperty.all<Color>(myThemeColor[300]!),
      ),
    );
  }

  static OutlinedButtonThemeData getOutlinedButtonThemeData() {
    return OutlinedButtonThemeData(
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
        foregroundColor: WidgetStateProperty.resolveWith<Color>(getStateColorForOutlinedButton),
        iconColor: WidgetStateProperty.resolveWith<Color>(getStateColorForOutlinedButton),
        iconSize: WidgetStateProperty.all<double>(MyFontSize.mainSize),
        maximumSize:getMaximumSizeForButton(),
        minimumSize: getMinimumSizeForButton(),
        padding:WidgetStateProperty.all<EdgeInsetsGeometry>(
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
          getBorderSide(color: myThemeColor[600]!),
        ),
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
        foregroundColor: WidgetStateProperty.resolveWith<Color>(getStateColorForIconButton),
        iconColor: WidgetStateProperty.resolveWith<Color>(getStateColorForIconButton),
        iconSize: WidgetStateProperty.all<double>(MyFontSize.sizeMedium),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
         MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM01),
        ),
        visualDensity: VisualDensity.comfortable,

      ),
    );
  }
}
