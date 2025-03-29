import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/styles/border_style.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/data/enums/all_enums.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// showSnackBar({required String content}) {
//   snackBarKey.currentState?.showSnackBar(
//     SnackBar(
//       content: Text(content),
//     ),
//   );
// }

void showSnackBarToast({required String content}) {
  Fluttertoast.showToast(
    msg: content,
    backgroundColor: myThemeColor.shade300,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER_LEFT,
  );
}

void showSnackBar(
    {required String content, required SnackBarEnum snackBarEnum}) {
  BuildContext? context = navigatorKey.currentContext;

  // If context is null, fallback to toast notification
  if (context == null) {
    showSnackBarToast(content: content);
    return;
  }

  // Define common properties for snack bar
  const duration = Duration(milliseconds: 500);
  final dismissDirection = [DismissDirection.horizontal];
  const dismissType = DismissType.onSwipe;
  const displayDuration = Duration(seconds: 4);
  final padding = MyPadding.getDimensionEdgeInsets(
    multiplier: MultiplierConstant.dMOverAllScreen,
  );
  final borderRadius = getBorderRadius();
  final messagePadding = MyPadding.getDimensionEdgeInsets(
    multiplier: MultiplierConstant.dMOverAllScreen * 0.5,
  );
  CustomSnackBar snackBar;
  Curve animationCurve;
  switch (snackBarEnum) {
    case SnackBarEnum.info:
      animationCurve = Curves.bounceOut;
      snackBar = CustomSnackBar.info(
        message: content,
        maxLines: 3,
        backgroundColor: Colors.grey,
        icon: const Icon(Icons.info_outline, color: Colors.transparent),
        borderRadius: borderRadius,
        messagePadding: messagePadding,
      );
      break;
    case SnackBarEnum.success:
      animationCurve = Curves.easeOutCubic;
      snackBar = CustomSnackBar.success(
        message: content,
        backgroundColor: myThemeColor.shade300,
        maxLines: 3,
        icon: const Icon(Icons.done_outlined, color: Colors.transparent),
        borderRadius: borderRadius,
        messagePadding: messagePadding,
      );
      break;
    case SnackBarEnum.error:
      animationCurve = Curves.bounceInOut;
      snackBar = CustomSnackBar.error(
        message: content,
        backgroundColor: Colors.red.shade200,
        maxLines: 3,
        icon: const Icon(Icons.error_outline, color: Colors.transparent),
        borderRadius: borderRadius,
        messagePadding: messagePadding,
      );
      break;
  }

  // Show the top snack bar
  showTopSnackBar(
    Overlay.of(context),
    snackBar,
    curve: animationCurve,
    animationDuration: duration,
    dismissDirection: dismissDirection,
    dismissType: dismissType,
    displayDuration: displayDuration,
    padding: padding,
  );
}
