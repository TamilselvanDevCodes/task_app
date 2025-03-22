import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';

class FirebaseNotificationService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> init()async{
    await requestPermission();
    await getFCMToken();
    onMessageListener();
    setupBackgroundMessageHandler();
  }

  // Request notification permissions (iOS & Android)
  static Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    logger.i("Permission granted Status: ${settings.authorizationStatus}");
  }

  // Get FCM Token
  static Future<String?> getFCMToken() async {
    String? token = await _firebaseMessaging.getToken();
    logger.i("FCM Token: $token");
    return token;
  }

  // Handle incoming messages when the app is in the foreground
  static void onMessageListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.d("Received message Foreground: ${message.notification?.title} - ${message.notification?.body}");
    });
  }


  // Subscribe to a topic
  static Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    logger.d("Subscribed to topic: $topic");
  }

  // Unsubscribe from a topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    logger.d("Unsubscribed from topic: $topic");
  }

  // Background & Terminated State Handling
  static void setupBackgroundMessageHandler() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    logger.d("Handling background message: ${message.notification?.title} - ${message.notification?.body}");
  }
}
