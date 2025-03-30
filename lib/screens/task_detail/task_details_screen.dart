import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/comparison_constants.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/core_needs/utils/date_formatter.dart';
import 'package:task_app/core_needs/widgets/form_tile.dart';
import '../../controllers/task_controller.dart';
import '../../core_needs/constants/word_constants.dart';
import '../../core_needs/theme_data/my_padding.dart';
import '../../core_needs/widgets/app_bar.dart';
import '../../data/model/task_model.dart';
import 'package:get/get.dart';

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
  TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    initializeParams();
    super.initState();
  }

  @override
  void dispose() {
    remarksController.dispose();
    super.dispose();
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
        isNotificationViewNotVisible: true,
      ),
      body: Container(
        color: taskModel?.status == ComparisonConstant.cPending
            ? Colors.red.shade50
            : taskModel?.status == ComparisonConstant.cCompleted
                ? Colors.green.shade50
                : taskModel?.status == ComparisonConstant.cOverdue
                    ? Colors.red.shade200
                    : null,
        child: Padding(
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
                    taskModel!.status == ComparisonConstant.cCompleted
                        ? TaskDetailRowView(
                            heading: UIWordConstant.wCompletedDate,
                            value: DateFormatter.formatDate(
                              taskModel!.completedDate!,
                            ),
                          )
                        : const SizedBox(),
                    taskModel!.status == ComparisonConstant.cCompleted
                        ? TaskDetailRowView(
                            heading: UIWordConstant.wRemarks,
                            value: taskModel!.remarks,
                          )
                        : const SizedBox(),
                    const Spacer(),
                    taskModel!.status == ComparisonConstant.cPending
                        ? _getPendingTaskView(
                            context: context,
                            taskModel: taskModel!,
                          )
                        : const SizedBox(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget _getPendingTaskView({
    required BuildContext context,
    required TaskModel taskModel,
  }) {
    return ElevatedButton(
      onPressed: () async {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          // Ensures the bottom sheet takes up necessary space
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Push content above keyboard
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: MyPadding.getDimensionEdgeInsets(
                    multiplier: MultiplierConstant.dMOverAllScreen,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FormTile(
                        title: UIWordConstant.wRemarks,
                        controller: remarksController,
                        isLarge: true,
                        textInputAction: TextInputAction.done,
                        canDisposeController: false,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          taskModel.completedDate = DateTime.now();
                          taskModel.remarks = remarksController.text;
                          taskModel.status = ComparisonConstant.cCompleted;
                          TaskController taskController = Get.find();
                          await taskController.updateTask(taskModel: taskModel);
                          setState(() {});
                        },
                        child: const Text(
                          UIWordConstant.wSave,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Text(
        UIWordConstant.wMarkAsComplete,
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
