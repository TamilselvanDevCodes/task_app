import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'constants/size_constants.dart';

Color getStateColorForElevatedButton(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return Colors.white70;
  }
  return Colors.white;
}
Color getStateColorForOutlinedButton(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return myThemeColor[800]!;
  }
  return myThemeColor[600]!;
}
Color getStateShadowColorForButton(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return myThemeColor[300]!;
  }
  return myThemeColor[50]!;
}
WidgetStateProperty<Size> getMaximumSizeForButton(){
  return WidgetStateProperty.all<Size>(
    Size(sizeConstants.sW9,sizeConstants.sH1),
  );
}

WidgetStateProperty<Size> getMinimumSizeForButton(){
  return  WidgetStateProperty.all<Size>(
    Size(sizeConstants.sW3,sizeConstants.sH05),
  );
}
Color getStateColorForIconButton(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return Colors.grey[900]!;
  }
  return Colors.grey[700]!;
}

Color getStateColorForCheckBoxCheckedColor(Set<WidgetState>states){
  if (states.contains(WidgetState.pressed)) {
    return myThemeColor[700]!;
  }
  return myThemeColor[500]!;
}