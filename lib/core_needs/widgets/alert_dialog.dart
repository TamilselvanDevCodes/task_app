import 'package:flutter/material.dart';

class MyAlertDialog {
  static Future<void> showTwoButtonAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String elevatedButtonText,
    required String outlinedButtonText,
    void Function()? elevatedButtonOnPressed,
    void Function()? outlinedButtonOnPressed,
  }) async{
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            message,
            maxLines: 8,
          ),
          actions: [
            OutlinedButton(
              onPressed: outlinedButtonOnPressed,
              child: Text(
                outlinedButtonText,
              ),
            ),
            ElevatedButton(
              onPressed: elevatedButtonOnPressed,
              child: Text(
                elevatedButtonText,
              ),
            ),
          ],
        );
      },
    );
  }
}
