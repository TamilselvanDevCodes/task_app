import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_app/controllers/notification_controller.dart';

import '../core_needs/utils/navigation_service.dart';
import '../core_needs/variables/global_variables.dart';
import '../data/model/notification_response_model.dart';
import '../data/model/task_model.dart';
import 'package:get/get.dart';

import '../routes/route_constant.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal() {
    _init(); // Automatically initialize when an instance is created
  }

  /// Initialize notifications
  Future<void> _init() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async{
        if (response.payload != null) {
          final Map<String, dynamic> data = jsonDecode(response.payload!);
          NotificationPayload notification = NotificationPayload.fromJson(data);
          NotificationController notificationController=Get.find();
          TaskModel? taskModel =
              await notificationController.getTaskForNotification(
            taskId:notification.taskId,
          );
          logger.i("Notification Clicked: ${notification.title}");
          if(taskModel==null){
            return;
          }
          else{
            NavigationService.pushNamed(
              RouteConstant.rTaskDetailScreen,
              arguments: taskModel,
            );
          }
        } else {
          logger.w("Notification Clicked but payload is null");
        }
      },
    );
  }

  NotificationDetails _getNotificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'General Notifications',
        channelDescription: 'Displays notifications',
        importance: Importance.high,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(''),

      ),
    );
  }

  /// Show an immediate notification
  void showNotification({
   required NotificationPayload notificationPayload,
  }) {
    _flutterLocalNotificationsPlugin.show(
      notificationPayload.id,
      notificationPayload.title,
      notificationPayload.message,
      payload: jsonEncode(notificationPayload),
      _getNotificationDetails(),
    );
  }

  void triggerScheduledNotification({
    required NotificationPayload notificationPayload,
  }) {
    _scheduleNotification(
      id: 2,
      title: notificationPayload.title,
      body: notificationPayload.message,
      payload: jsonEncode(notificationPayload),
    );
  }

  /// Schedule a notification after a delay (without timezone)
  void _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) {
    _flutterLocalNotificationsPlugin.periodicallyShowWithDuration(
      id,
      title,
      body,
      const Duration(seconds: 1),
      _getNotificationDetails(),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  /// Cancel a specific notification
  Future<void> cancelNotification({required int id}) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
