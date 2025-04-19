import 'package:task_app/core_needs/constants/word_constants.dart';

import '../constants/comparison_constants.dart';

sealed class DropDownListItems{
  static const List<String> taskCategoryType=[
    UIWordConstant.wImmediate,
    UIWordConstant.wPriority,
    UIWordConstant.wDelegate,
    UIWordConstant.wIgnore,
  ];
  static const List<String> priorityType=[
    UIWordConstant.wHigh,
    UIWordConstant.wMedium,
    UIWordConstant.wLow,
  ];
  static const List<String> repeatType=[
    UIWordConstant.wOnce,
    UIWordConstant.wEveryday,
    UIWordConstant.wWeekly,
    UIWordConstant.wMonthly,
    UIWordConstant.wCustom,
  ];
  static const List<String> days=[
    UIWordConstant.wSunday,
    UIWordConstant.wMonday,
    UIWordConstant.wTuesday,
    UIWordConstant.wWednesday,
    UIWordConstant.wThursday,
    UIWordConstant.wFriday,
    UIWordConstant.wSaturday,
  ];
  static List<String> tasksFilterOptions=[
    ComparisonConstant.cPending,
    ComparisonConstant.cOverdue,
    ComparisonConstant.cCompleted,
    ComparisonConstant.cAll,
  ];
}