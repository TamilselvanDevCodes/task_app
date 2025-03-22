// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// /// Manages local notifications
// // class NotificationService {
// //   static final NotificationService _instance = NotificationService._internal();
// //   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   factory NotificationService() => _instance;
// //
// //   NotificationService._internal();
// //
// //   Future<void> init() async {
// //     const AndroidInitializationSettings androidSettings =
// //     AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //     const InitializationSettings initSettings =
// //     InitializationSettings(android: androidSettings);
// //
// //     await _flutterLocalNotificationsPlugin.initialize(
// //       initSettings,
// //       onDidReceiveNotificationResponse: (NotificationResponse response) {
// //         print("Notification Clicked: ${response.payload}");
// //       },
// //     );
// //   }
// //
// //   Future<void> showNotification({
// //     required int id,
// //     required String title,
// //     required String body,
// //   }) async {
// //     await _flutterLocalNotificationsPlugin.show(
// //       id,
// //       title,
// //       body,
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //           'channel_id',
// //           'Instant Notifications',
// //           channelDescription: 'Instant notification',
// //           importance: Importance.high,
// //           priority: Priority.high,
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Future<void> cancelNotification(int id) async {
// //     await _flutterLocalNotificationsPlugin.cancel(id);
// //   }
// //
// //   Future<void> cancelAllNotifications() async {
// //     await _flutterLocalNotificationsPlugin.cancelAll();
// //   }
// // }
//
// /// Manages background services
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationService().init();
//   await BackgroundService().init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String buttonText = "Stop Service";
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Service App')),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return const CircularProgressIndicator();
//                 final data = snapshot.data!;
//                 return Column(
//                   children: [
//                     Text(data["device"] ?? 'Unknown'),
//                     Text(data["current_date"] ?? ''),
//                   ],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () => FlutterBackgroundService().invoke("setAsForeground"),
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () => FlutterBackgroundService().invoke("setAsBackground"),
//             ),
//             ElevatedButton(
//               child: Text(buttonText),
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();
//                 isRunning ? service.invoke("stopService") : service.startService();
//                 setState(() {
//                   buttonText = isRunning ? 'Start Service' : 'Stop Service';
//                 });
//               },
//             ),
//             const Expanded(child: LogView()),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LogView extends StatefulWidget {
//   const LogView({Key? key}) : super(key: key);
//
//   @override
//   State<LogView> createState() => _LogViewState();
// }
//
// class _LogViewState extends State<LogView> {
//   late final Timer timer;
//   List<String> logs = [];
//
//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       final SharedPreferences sp = await SharedPreferences.getInstance();
//       logs = sp.getStringList('log') ?? [];
//       if (mounted) setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: logs.length,
//       itemBuilder: (context, index) => Text(logs[index]),
//     );
//   }
// }
