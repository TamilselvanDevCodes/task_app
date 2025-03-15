import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/core_needs/utils/common_functions.dart';
import 'package:task_app/core_needs/utils/date_formatter.dart';
import 'package:task_app/data/database/repository/task_repository.dart';

import '../../core_needs/constants/word_constants.dart';
import '../../core_needs/theme_data/my_padding.dart';
import '../../core_needs/widgets/app_bar.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel? taskModel;

  const TaskDetailsScreen({
    super.key,
    required this.taskModel,
  });

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late TaskModel? taskModel;

  @override
  void initState() {
    initializeParams();
    super.initState();
  }

  void initializeParams() {
    taskModel = widget.taskModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(
        title: UIWordConstant.wDetail,
      ),
      body: Padding(
        padding: MyPadding.getDimensionEdgeInsets(
          multiplier: MultiplierConstant.dMOverAllScreen,
        ),
        child: taskModel != null
            ? Column(
                spacing: SizeGetter.getHeight(
                  multiplier: MultiplierConstant.dMNotRelatedValueSeparation,
                ),
                children: [
                  TaskDetailRowView(
                    heading: UIWordConstant.wTitle,
                    value: taskModel!.title,
                  ),
                  TaskDetailRowView(
                    heading: UIWordConstant.wDescription,
                    value: taskModel!.description,
                  ),
                  TaskDetailRowView(
                    heading: UIWordConstant.wTaskCategoryType,
                    value: taskModel!.taskCategory,
                  ),
                  TaskDetailRowView(
                    heading: UIWordConstant.wPriorityType,
                    value: taskModel!.priority,
                  ),
                  TaskDetailRowView(
                    heading: UIWordConstant.wDueDate,
                    value: DateFormatter.formatDate(
                      taskModel!.dueDate,
                    ),
                  ),
                  Column(
                    spacing: SizeGetter.getHeight(
                      multiplier: MultiplierConstant.dMRelatedValueSeparation,
                    ),
                    children: [
                      TaskDetailRowView(
                        heading: UIWordConstant.wRepeat,
                        value: taskModel!.repeat,
                      ),
                      if (taskModel?.repeatList?.isNotEmpty ?? false)
                        Row(
                          children: taskModel!.repeatList!
                              .map(
                                (value) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(value.toString()),
                                ),
                              )
                              .toList(),
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class TaskDetailRowView extends StatelessWidget {
  final String heading;
  final String? value;

  const TaskDetailRowView({
    super.key,
    required this.heading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: sizeConstants.sW4,
          child: Text(
            heading,
            style: MyThemeTextStyle.bodyMedium().copyWith(
              fontWeight: MyFontWeight.title,
            ),
            maxLines: 2,
          ),
        ),
        Text(
          value == null || value!.isEmpty ? "-" : value!,
          style: MyThemeTextStyle.bodyMedium(),
          maxLines: 10,
        ),
      ],
    );
  }
}
