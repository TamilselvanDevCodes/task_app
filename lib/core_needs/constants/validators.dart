import 'package:task_app/core_needs/constants/error_word_constants.dart';

mixin Validators {
  String? validateUsername(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    value=value.trim();
    // Check if the value length is within the valid range (3 to 30 characters)
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    } else if (value.length > 30) {
      return 'Username must not be more than 30 characters';
    }
    return null;
  }
  String? validateTitle(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return MessageWordConstant.mTitleEmptyMessage;
    }
    return null;
  }

  String? validatePassword(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    value=value.trim();
    // Check if the value length is within the valid range (3 to 30 characters)
    if (value.length < 3) {
      return 'Password must be at least 8 characters long';
    } else if (value.length > 30) {
      return 'Password must not be more than 15 characters';
    }
    return null;
  }

  String? validateContactNumber(String? value) {
    // Check if the value is null or empty

    if (value == null || value.isEmpty) {
      return 'Contact Number cannot be empty';
    }
    value=value.trim();
    if (value.length !=10) {
      return 'Contact Number should be exactly 10 characters long';
    }
    return null;
  }
}