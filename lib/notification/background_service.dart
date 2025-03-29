import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import '../controllers/task_controller.dart';
import '../core_needs/variables/global_variables.dart';
import '../data/model/task_model.dart';
import '../data/remote/gemini_service.dart';
import 'package:get/get.dart';
import 'notification_response_model.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: false,
    ),
    iosConfiguration: IosConfiguration(),
  );

  service.startService();
}

// Background Service Logic
void onStart(ServiceInstance service) async {
  controllerService.initializeAllControllers();
  Timer.periodic(const Duration(hours: 1), (timer) async {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    // Run only between 6 AM and 10 PM (22:00)
    if (currentHour >= 6 && currentHour < 22) {
      await checkPendingTasks();
    } else {
      logger.d("Background service paused outside allowed hours.");
    }
  });
}

// Fetch Pending Tasks from SQLite & Send Notification
Future<void> checkPendingTasks() async {
  TaskController taskController = Get.find();
  GeminiService geminiService = GeminiService();
  List<TaskModel> tasks = taskController.pendingTasks;

  if (tasks.isNotEmpty) {
    TaskModel? pendingTask = tasks.first;
    String message =
        await geminiService.generateTaskReminder(taskModel: pendingTask);
    logger.d("Notification Message From Gemini : $message");
    NotificationPayload notificationPayload = NotificationPayload(
      id: pendingTask.hashCode,
      taskId: pendingTask.id ?? 0,
      title: pendingTask.title,
      message: message,
      timestamp: DateTime.now(),
      taskType: pendingTask.taskCategory,
    );
    notificationService.showNotification(
      notificationPayload: notificationPayload,
    );
  }
}
