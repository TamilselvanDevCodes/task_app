import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/notification_controller.dart';
import 'package:task_app/core_needs/constants/comparison_constants.dart';
import 'package:task_app/core_needs/constants/message_word_constants.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/screens/drawer.dart';
import 'package:task_app/core_needs/theme_data/styles/border_style.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/core_needs/utils/common_functions.dart';
import 'package:task_app/core_needs/utils/date_formatter.dart';
import 'package:task_app/core_needs/utils/navigation_service.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/core_needs/widgets/alert_dialog.dart';
import 'package:task_app/core_needs/widgets/app_bar.dart';
import 'package:task_app/data/enums/all_enums.dart';
import 'package:task_app/data/model/task_model.dart';
import 'package:task_app/routes/route_constant.dart';
import 'package:task_app/controllers/task_controller.dart';

import '../../../core_needs/theme_data/my_padding.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        title: UIWordConstant.wNotifications,
        isNotificationScreen: true,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: MyPadding.getDimensionEdgeInsets(
          multiplier: MultiplierConstant.dMOverAllScreen,
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<NotificationController>(
                builder: (controller) {
                  return controller.notifications.isEmpty
                      ? Center(
                          child: Text(
                            MessageWordConstant.mNoNotificationAvailableMessage,
                            style: MyThemeTextStyle.titleLarge(),
                            maxLines: 2,
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                TaskModel? taskModel =
                                    await controller.getTaskForNotification(
                                  taskId:
                                      controller.notifications[index].taskId,
                                );
                                if (taskModel == null) {
                                  showSnackBar(
                                    content: MessageWordConstant.mErrorMessage,
                                    snackBarEnum: SnackBarEnum.error,
                                  );
                                  return;
                                }
                                NavigationService.pushNamed(
                                  RouteConstant.rTaskDetailScreen,
                                  arguments: taskModel,
                                );
                              },
                              child: Card(
                                child: Padding(
                                  padding: MyPadding.getDimensionEdgeInsets(
                                    multiplier: MultiplierConstant.dM01,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: SizeGetter.getHeight(
                                      multiplier: MultiplierConstant
                                          .dMNotRelatedValueSeparation,
                                    ),
                                    children: [
                                      Text(
                                        controller.notifications[index].title,
                                        style: MyThemeTextStyle.titleMedium(),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        controller.notifications[index].message,
                                        style: MyThemeTextStyle.bodyLarge(),
                                        maxLines: 3,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          DateFormatter.formatDate(
                                            controller
                                                .notifications[index].timestamp,
                                          ),
                                          style: MyThemeTextStyle.bodyLarge(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: controller.notifications.length,
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
          ],
        ),
      ),
    );
  }
}
