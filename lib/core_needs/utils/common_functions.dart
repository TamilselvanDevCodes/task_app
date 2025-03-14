import 'package:flutter/material.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';

showSnackBar({required String content}) {
  snackBarKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
