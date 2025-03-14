import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/core_needs/constants/comparison_constants.dart';
import 'package:task_app/core_needs/constants/message_word_constants.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/screens/drawer.dart';
import 'package:task_app/core_needs/theme_data/styles/border_style.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/core_needs/utils/date_formatter.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/core_needs/widgets/alert_dialog.dart';
import 'package:task_app/core_needs/widgets/app_bar.dart';
import 'package:task_app/routes/route_constant.dart';
import 'package:task_app/controllers/task_controller.dart';

import '../../../core_needs/theme_data/my_padding.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(
        title: UIWordConstant.wTasks,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: MyPadding.getDimensionEdgeInsets(
          multiplier: MultiplierConstant.dMOverAllScreen,
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<TaskController>(
                builder: (controller) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Dismissible(
                          key: Key(
                            controller.tasks[index].hashCode.toString(),
                          ),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: MyPadding.getDimensionEdgeInsets(
                              multiplier:
                              MultiplierConstant.dMRelatedValueSeparation,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: getBorderRadius(),
                              color: Colors.red.shade300,
                            ),
                            child: Icon(
                              Icons.delete,
                              size: MyFontSize.sizeMedium,
                              color: Colors.white,
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            bool confirmDelete = false;
                            await MyAlertDialog.showTwoButtonAlertDialog(
                              context: context,
                              title: UIWordConstant.wDeleteTask,
                              message:
                              MessageWordConstant.mTaskDeleteContentMessage,
                              elevatedButtonText: UIWordConstant.wYes,
                              outlinedButtonText: UIWordConstant.wNo,
                              outlinedButtonOnPressed: () {
                                Navigator.pop(context);
                              },
                              elevatedButtonOnPressed: () {
                                logger.d("controller.tasks[index].id: ${controller.tasks[index].id}");
                                controller.deleteTask(
                                    taskId: controller.tasks[index].id);
                                confirmDelete = true;
                                Navigator.pop(context);
                              },
                            );

                            return confirmDelete;
                          },
                          child: Padding(
                            padding: MyPadding.getDimensionEdgeInsets(
                              multiplier: MultiplierConstant.dM01,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: SizeGetter.getHeight(
                                multiplier: MultiplierConstant
                                    .dMNotRelatedValueSeparation,
                              ),
                              children: [
                                Text(
                                  controller.tasks[index].title,
                                  style: MyThemeTextStyle.titleMedium(),
                                  maxLines: 2,
                                ),
                                if (controller.tasks[index].description !=
                                        null &&
                                    controller.tasks[index].description!
                                        .trim()
                                        .isNotEmpty)
                                  Text(
                                    controller.tasks[index].description!,
                                    style: MyThemeTextStyle.bodyLarge(),
                                    maxLines: 2,
                                  ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: DateFormatter.formatDate(
                                            controller.tasks[index].dueDate,
                                          ),
                                          children: [
                                            const TextSpan(text: " ("),
                                            getDayView(
                                              dueDate: controller
                                                  .tasks[index].dueDate,
                                              taskStatus: controller
                                                  .tasks[index].status,
                                            ),
                                            const TextSpan(text: ")"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    getTaskStatusTextWidget(
                                        taskStatus:
                                            controller.tasks[index].status),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.tasks.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: SizeGetter.getHeight(
                          multiplier:
                              MultiplierConstant.dMRelatedValueSeparation,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: sizeConstants.sH07,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            RouteConstant.rAddTaskScreen,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  TextSpan getDayView({required String taskStatus, required DateTime dueDate}) {
    DateTime today = DateTime.now();
    int remainingDays = dueDate.difference(today).inDays;

    if (taskStatus == ComparisonConstant.cPending) {
      return TextSpan(
        text: remainingDays > 0
            ? "$remainingDays ${UIWordConstant.wDaysRemaining}"
            : UIWordConstant.wDueToday,
        style: MyThemeTextStyle.bodyMedium(),
      );
    } else if (taskStatus == ComparisonConstant.cOverdue) {
      return TextSpan(
        text: UIWordConstant.wTaskIsOverdue,
        style: MyThemeTextStyle.bodyMedium(),
      );
    } else if (taskStatus == ComparisonConstant.cCompleted) {
      return const TextSpan(text: "");
    }
    return TextSpan(
      text: UIWordConstant.wUnknownStatus,
      style: MyThemeTextStyle.bodyMedium(),
    );
  }

  Widget getTaskStatusTextWidget({required String taskStatus}) {
    Color color = Colors.red;
    if (taskStatus == ComparisonConstant.cOverdue) {
      color = Colors.red.shade800;
    } else if (taskStatus == ComparisonConstant.cCompleted) {
      color = Colors.green.shade500;
    }
    return Text(
      taskStatus,
      style: MyThemeTextStyle.bodyMedium().copyWith(color: color),
    );
  }
}
