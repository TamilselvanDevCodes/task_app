import 'package:flutter/material.dart';

import '../theme.dart';

sealed class ColorGetter{
  static bool isDarkMode({required BuildContext context}){
    var mode=Theme.of(context).brightness;
    //debugPrint("mode : ${mode}");
    return mode==Brightness.dark?true:false;
  }
}
Color getStateColorForCheckBoxCheckedColor(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return myThemeColor[700]!;
  }
  return myThemeColor[500]!;
}