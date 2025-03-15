import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';

// showSnackBar({required String content}) {
//   snackBarKey.currentState?.showSnackBar(
//     SnackBar(
//       content: Text(content),
//     ),
//   );
// }


void showSnackBar({required String content}) {
  Fluttertoast.showToast(
    msg: content,
    backgroundColor: myThemeColor.shade300,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER_LEFT,
  );
}

