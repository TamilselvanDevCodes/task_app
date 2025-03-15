import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_response_model.dart';

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
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification Clicked: ${response.payload}");
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
      ),
    );
  }

  /// Show an immediate notification
  void showNotification({
    required int id,
    required String title,
    required String body,
  }) {
    _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _getNotificationDetails(),
    );
  }

  void triggerScheduledNotification({
    required NotificationPayload notificationPayload,
  }) {
    _scheduleNotification(
      id: 1,
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
    _flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.hourly,
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
