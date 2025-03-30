import 'package:task_app/core_needs/theme_data/styles/button_style.dart';
import 'package:task_app/core_needs/theme_data/styles/form_fields_decorations.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/size_constants.dart';
import 'constants/style_constant.dart';
import 'my_padding.dart';
import 'styles/border_style.dart';
import 'styles/color_getter.dart';
 MaterialColor myThemeColor=Colors.blue;

class MyThemeData {

  ThemeData getBaseThemeData({required bool isDarkMode}) {
    return ThemeData(
      brightness: isDarkMode?Brightness.dark:Brightness.light,
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
      colorSchemeSeed: myThemeColor,
      textTheme: TextTheme(
        headlineLarge: MyThemeTextStyle.headLineLarge(),
        headlineMedium: MyThemeTextStyle.headLineMedium(),
        headlineSmall: MyThemeTextStyle.headLineSmall(),
        titleLarge: MyThemeTextStyle.titleLarge(),
        titleMedium: MyThemeTextStyle.titleMedium(),
        titleSmall: MyThemeTextStyle.titleSmall(),
        labelLarge: MyThemeTextStyle.labelLarge(),
        labelMedium: MyThemeTextStyle.labelMedium(),
        labelSmall: MyThemeTextStyle.labelSmall(),
        bodyLarge: MyThemeTextStyle.bodyLarge(),
        bodyMedium: MyThemeTextStyle.bodyMedium(),
        bodySmall: MyThemeTextStyle.bodySmall(),
      ),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        elevation: StyleConstant.mainElevation,
        shadowColor: myThemeColor,
      ),
      elevatedButtonTheme: MyButtonStyle.getElevatedButtonThemeData(),
      dividerTheme: DividerThemeData(
        color: Colors.grey[300],
        thickness: StyleConstant.thickness,
      ),
      datePickerTheme: DatePickerThemeData(
        shadowColor: Colors.grey,
        elevation: StyleConstant.subElevation,
        inputDecorationTheme: MyInputDecorationThemeData.getLightMode(),
        headerBackgroundColor: myThemeColor[100],
        todayBorder: getBorderSide(),
        backgroundColor: myThemeColor[50],
        headerHelpStyle: MyThemeTextStyle.titleLarge(),
        todayBackgroundColor:WidgetStatePropertyAll(myThemeColor.shade50,),
        confirmButtonStyle: MyButtonStyle.getElevatedButtonStyle(),
        cancelButtonStyle: MyButtonStyle.getOutlinedButtonStyle(),
      ),
      cardTheme: CardTheme(
        elevation: StyleConstant.subElevation,
        // shape: RoundedRectangleBorder(
        //   borderRadius: getBorderRadius(),
        // ),
        shadowColor: Colors.grey[200],
        clipBehavior: Clip.hardEdge,
      ),
      drawerTheme: DrawerThemeData(
        elevation: StyleConstant.mainElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(MyFontSize.sizeMedium),
            bottomRight: Radius.circular(MyFontSize.sizeMedium),
          ),
        ),
        width: sizeConstants.sW8,
      ),
      //fontFamily: "BebasNeue",
      listTileTheme: ListTileThemeData(
        contentPadding:MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM01),
        horizontalTitleGap: sizeConstants.sW01,
        leadingAndTrailingTextStyle: MyFormFieldTextStyle.getPrefixTextStyle(),
        minLeadingWidth:sizeConstants.sW08,
        minTileHeight: sizeConstants.sH07,
        minVerticalPadding: sizeConstants.sH02,
        style: ListTileStyle.list,
        tileColor: isDarkMode?myThemeColor[300]:myThemeColor[100],
        titleAlignment: ListTileTitleAlignment.center,
        visualDensity: VisualDensity.compact,
      ),
      outlinedButtonTheme: MyButtonStyle.getOutlinedButtonThemeData(),
      inputDecorationTheme: MyInputDecorationThemeData.getLightMode(),
      //splashColor: myThemeColor[50],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: myThemeColor[50],
        elevation: StyleConstant.mainElevation,
        selectedIconTheme: IconThemeData(
          color: myThemeColor[500],
          applyTextScaling: true,
          size: MyFontSize.sizeLarge,
        ),
        selectedItemColor: myThemeColor[500],
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[600],
          applyTextScaling: true,
          size: MyFontSize.sizeLarge,
        ),
        selectedLabelStyle: MyThemeTextStyle.labelSmall(),
        unselectedLabelStyle: MyThemeTextStyle.labelSmall(),
        unselectedItemColor: Colors.grey[600],
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: StyleConstant.mainElevation,
        backgroundColor: myThemeColor[50],
        modalBackgroundColor: myThemeColor[50],
        modalElevation: StyleConstant.mainElevation,
        showDragHandle: true,
        dragHandleColor: Colors.grey,
        constraints: BoxConstraints(
          minHeight:sizeConstants.sH1,
          maxHeight:sizeConstants.sH7,
        ),
        clipBehavior: Clip.hardEdge,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: myThemeColor[50],
        actionsPadding: MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM01),
        contentTextStyle: MyThemeTextStyle.bodyLarge().copyWith(
          color: Colors.black,
        ),
        elevation: StyleConstant.subElevation,
        shadowColor: Colors.grey[50],
        insetPadding: MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM05),
        titleTextStyle: MyThemeTextStyle.titleLarge().copyWith(
          color: Colors.black,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
          actionBackgroundColor: Colors.grey[300],
          elevation: StyleConstant.subElevation,
          backgroundColor: Colors.grey[200],
          closeIconColor: Colors.black87,
          contentTextStyle: MyThemeTextStyle.labelSmall(),
          dismissDirection: DismissDirection.horizontal,
          shape: RoundedRectangleBorder(borderRadius: getBorderRadius(),),
          showCloseIcon: true,
          insetPadding: MyPadding.getDimensionEdgeInsets(multiplier: MultiplierConstant.dM01),
          behavior: SnackBarBehavior.floating
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        // shape: RoundedRectangleBorder(borderRadius: getBorderRadius()),
        backgroundColor: myThemeColor[300],
        elevation: StyleConstant.subElevation,
        focusElevation: StyleConstant.mainElevation,
        highlightElevation: StyleConstant.subElevation + 1,
        // largeSizeConstraints: BoxConstraints(
        //   minHeight: sizeConstants.sH1,
        //   minWidth: sizeConstants.sW2,
        //   maxHeight: sizeConstants.sH1 + sizeConstants.sH04,
        //   maxWidth: sizeConstants.sW4,
        // ),
        extendedIconLabelSpacing: sizeConstants.sW01,
        extendedPadding: EdgeInsets.all(sizeConstants.sW01),
        // extendedSizeConstraints: BoxConstraints(
        //   minHeight: sizeConstants.sH07,
        //   minWidth: sizeConstants.sW4,
        //   maxHeight: sizeConstants.sH1,
        //   maxWidth: sizeConstants.sW9,
        // ),
        iconSize: sizeConstants.sH03,
        extendedTextStyle: MyThemeTextStyle.titleSmall(),
        // sizeConstraints: BoxConstraints(
        //   minHeight: sizeConstants.sH1,
        //   minWidth: sizeConstants.sW1,
        //   maxHeight: sizeConstants.sH2,
        //   maxWidth: sizeConstants.sW2,
        // ),
        // smallSizeConstraints: BoxConstraints(
        //   minHeight: sizeConstants.sH05,
        //   minWidth: sizeConstants.sW05,
        //   maxHeight: sizeConstants.sH07,
        //   maxWidth: sizeConstants.sW1 + sizeConstants.sW03,
        // ),
        splashColor: myThemeColor[900],
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: getBorderRadius(),
        ),
        splashRadius: StyleConstant.mainElevation,
        side: getBorderSide(color: Colors.black87),
        checkColor: WidgetStateProperty.resolveWith<Color>(
            getStateColorForCheckBoxCheckedColor),
        fillColor: WidgetStateProperty.all<Color>(Colors.white54),
        visualDensity: VisualDensity.comfortable,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          visualDensity: VisualDensity.comfortable,
          elevation:
          WidgetStateProperty.all<double>(StyleConstant.subElevation),
          side: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return getBorderSide(color: Colors.black87);
              }
              return getBorderSide(color: Colors.black54);
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: getBorderRadius(),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[100]!),
          alignment: Alignment.bottomRight,
          maximumSize: WidgetStateProperty.all<Size>(
            Size(sizeConstants.sW9, sizeConstants.sH1),
          ),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(sizeConstants.sW4, sizeConstants.sH05),
          ),
        ),
        inputDecorationTheme: MyInputDecorationThemeData.getLightMode(),
        textStyle: MyThemeTextStyle.bodyMedium(),
      ),
      visualDensity: VisualDensity.comfortable,
      iconTheme: IconThemeData(
        color: myThemeColor[500],
        applyTextScaling: true,
        size: sizeConstants.sW06,
      ),
      iconButtonTheme: MyButtonStyle.getIconButtonThemeData(),
      actionIconTheme: ActionIconThemeData(
        drawerButtonIconBuilder: (_) => const Icon(Icons.dehaze_outlined),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: myThemeColor[200],
        elevation: StyleConstant.subElevation,
        height: sizeConstants.sH09,
        indicatorColor: myThemeColor[600],
        indicatorShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        shadowColor: myThemeColor[50],
      ),
      hoverColor: myThemeColor[200],
      navigationDrawerTheme: NavigationDrawerThemeData(
        backgroundColor: myThemeColor[50],
        elevation: StyleConstant.mainElevation,
        shadowColor: myThemeColor[800],
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(sizeConstants.sH06),
            bottomRight: Radius.circular(sizeConstants.sH06),
          ),
        ),
        indicatorColor: Colors.red,
        tileHeight: MyFontSize.sizeLarge,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }


}
