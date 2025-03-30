import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../variables/global_variables.dart';
import '../theme.dart';

sealed class MyFormFieldTextStyle {
  static const MaterialColor _color=Colors.grey;
  static TextStyle getErrorTextStyle() {
    return MyThemeTextStyle.labelMedium().copyWith(color: Colors.red[500]);
  }

  static TextStyle getFloatingLabelTextStyle() {
    return MyThemeTextStyle.labelLarge().copyWith(color: _color);
  }

  static TextStyle getHelperTextStyle() {
    return MyThemeTextStyle.labelMedium().copyWith(color: myThemeColor[300]);
  }

  static TextStyle getHintTextStyle() {
    return MyThemeTextStyle.labelMedium().copyWith(color: _color);
  }

  static TextStyle getLabelTextStyle() {
    return MyThemeTextStyle.labelLarge();
  }

  static TextStyle getPrefixTextStyle() {
    return MyThemeTextStyle.labelLarge();
  }

  static TextStyle getSuffixTextStyle() {
    return MyThemeTextStyle.labelLarge();
  }

  static TextStyle getCounterTextStyle() {
    return MyThemeTextStyle.labelSmall();
  }
}

sealed class MyThemeTextStyle {
  // Base method to create a TextStyle
  static TextStyle _baseStyle({
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing:MyFontSize.letterSpacing,
      height:MyFontSize.height,
      // overflow: TextOverflow.ellipsis,
      leadingDistribution: TextLeadingDistribution.proportional,
      wordSpacing: MyFontSize.letterSpacing*2,
      color: isDarkMode?Colors.white:Colors.black,
    );
  }

  // Headline Styles
  static TextStyle headLineLarge() => _baseStyle(
    fontSize: MyFontSize.headLine,
    fontWeight: MyFontWeight.headLine,
  );

  static TextStyle headLineMedium() => _baseStyle(
    fontSize: MyFontSize.headLine - 2,
    fontWeight: MyFontWeight.headLine,
  );

  static TextStyle headLineSmall() => _baseStyle(
    fontSize: MyFontSize.headLine - 4,
    fontWeight: MyFontWeight.headLine,
  );

  // Title Styles
  static TextStyle titleLarge() => _baseStyle(
    fontSize: MyFontSize.title,
    fontWeight: MyFontWeight.title,
  );

  static TextStyle titleMedium() => _baseStyle(
    fontSize: MyFontSize.title - 2,
    fontWeight: MyFontWeight.title,
  );

  static TextStyle titleSmall() => _baseStyle(
    fontSize: MyFontSize.title - 4,
    fontWeight: MyFontWeight.title,
  );

  // Body Styles
  static TextStyle bodyLarge() => _baseStyle(
    fontSize: MyFontSize.body,
    fontWeight: MyFontWeight.body,
  );

  static TextStyle bodyMedium() => _baseStyle(
    fontSize: MyFontSize.body - 2,
    fontWeight: MyFontWeight.body,
  );

  static TextStyle bodySmall() => _baseStyle(
    fontSize: MyFontSize.body - 4,
    fontWeight: MyFontWeight.body,
  );

  // Label Styles
  static TextStyle labelLarge() => _baseStyle(
    fontSize: MyFontSize.label,
    fontWeight: MyFontWeight.label,
  );

  static TextStyle labelMedium() => _baseStyle(
    fontSize: MyFontSize.label - 2,
    fontWeight: MyFontWeight.label,
  );

  static TextStyle labelSmall() => _baseStyle(
    fontSize: MyFontSize.label - 4,
    fontWeight: MyFontWeight.label,
  );
}


sealed class MyFontWeight {
  static const FontWeight headLine = FontWeight.w700;
  static const FontWeight title = FontWeight.w600;
  static const FontWeight body = FontWeight.w400;
  static const FontWeight label = FontWeight.w400;
}

class MyFontSize {
  // Singleton instance
  static final MyFontSize _instance = MyFontSize._internal();

  // Factory constructor returns the singleton instance
  factory MyFontSize() => _instance;

  // Private internal constructor
  MyFontSize._internal();

  // Font sizes (Static properties for global access)
  static double mainSize = 0.0;
  static double sizeSmall = 0.0;
  static double sizeMedium = 0.0;
  static double sizeLarge = 0.0;
  static double headLine = 0.0;
  static double title = 0.0;
  static double body = 0.0;
  static double label = 0.0;
  static double letterSpacing = 0.0;
  static double height = 0.0;

  /// Updates static font size properties
  static void updateParams({required double height,required double width}) {
    mainSize = height+width;
    sizeSmall = mainSize;
    sizeMedium = sizeSmall + 10;
    sizeLarge = sizeSmall + 20;
    headLine = mainSize + 18;
    title = mainSize + 12;
    body = mainSize + 10;
    label = mainSize+6;
    letterSpacing = (mainSize * 0.05).floorToDouble(); // Round for better precision
    MyFontSize.height = (mainSize * 0.1).roundToDouble();

    logger.i("Updated Font Sizes: "
        "mainSize: $mainSize, "
        "letterSpacing: $letterSpacing  ,"
        "height : ${MyFontSize.height}",);

  }
}



