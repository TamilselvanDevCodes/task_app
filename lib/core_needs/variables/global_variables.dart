import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:task_app/controllers/controller_service.dart';
import 'package:task_app/notification/firebase-notification_service.dart';
import 'package:task_app/notification/notification_service.dart';
import '../../data/shared_preference/shared_preference_service.dart';
import '../../firebase_options.dart';
import '../../notification/background_service.dart';

Logger logger=Logger();
SharedPreferenceService? sharedPreferenceService;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
NotificationService notificationService=NotificationService();
final FirebaseNotificationService firebaseNotificationService=FirebaseNotificationService();
final ControllerService controllerService=ControllerService();


Future<void> initVariables()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  notificationService=NotificationService();
  await FirebaseNotificationService.init();
  controllerService.initializeAllControllers();
  await initializeBackgroundService();
  demoLog();
}

void demoLog() {
  logger.t("Trace log");
  logger.d("Debug log");
  logger.i("Info log");
  logger.w("Warning log");
  logger.e("Error log", error: 'Test Error');
  logger.f("Fatal log", error: "Error param", stackTrace: StackTrace.current);
}