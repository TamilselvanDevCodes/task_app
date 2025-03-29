import 'package:flutter/material.dart';
import 'package:task_app/controllers/notification_controller.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/core_needs/utils/navigation_service.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/routes/route_constant.dart';
import 'package:get/get.dart';

sealed class AppBars {
  static AppBar getAppBar({required String title, bool? isNotificationScreen}) {
    return AppBar(
      title: Text(
        title,
        style: MyThemeTextStyle.titleLarge(),
      ),
      centerTitle: true,
      actions: [
        if (!(isNotificationScreen != null && isNotificationScreen))
          IconButton(
            onPressed: () async{
              NotificationController notificationController=Get.find();
              try{
                await notificationController.getAllNotifications();
              }catch(error,stackTrace){
                logger.e("ERROR : $error\nSTACKTRACE : $stackTrace");
                NavigationService.pushNamed(RouteConstant.rNotificationScreen);
              }
              NavigationService.pushNamed(RouteConstant.rNotificationScreen);
            },
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
      ],
    );
  }
}
