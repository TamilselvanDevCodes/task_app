import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';

sealed class AppBars{
  static AppBar getAppBar({required String title}){
    return AppBar(title: Text(title,style: MyThemeTextStyle.titleLarge(),),centerTitle: true,);
  }
}