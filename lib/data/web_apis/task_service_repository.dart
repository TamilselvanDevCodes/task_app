import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app/core_needs/constants/firebase_constants.dart';
import 'package:task_app/notification/firebase-notification_service.dart';
import '../model/task_model.dart';

class TaskServiceRepository {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new task
  static Future<void> addTask({required TaskModel task}) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "test_user";
    String? fcmToken = await FirebaseNotificationService.getFCMToken();

    Map<String, dynamic> taskData = task.toMap();
    taskData["fcmToken"] = fcmToken;
    taskData["userId"]=userId;

    await _db.collection(FirebaseConstant.fDatabaseCollection).add(taskData);
  }

  // Fetch all tasks for the current user
  static Future<List<TaskModel>> getTasks() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "test_user";
    QuerySnapshot snapshot = await _db.collection(FirebaseConstant.fDatabaseCollection).where("userId", isEqualTo: userId).get();
    return snapshot.docs.map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  // Update a task
  static Future<void> updateTask(String taskId, Map<String, dynamic> updatedData) async {
    await _db.collection(FirebaseConstant.fDatabaseCollection).doc(taskId).update(updatedData);
  }

  // Delete a task
  static Future<void> deleteTask(String taskId) async {
    await _db.collection("tasks").doc(taskId).delete();
  }

  // Subscribe to task changes
  static Stream<List<TaskModel>> taskStream() {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "test_user";
    return _db.collection(FirebaseConstant.fDatabaseCollection).where("userId", isEqualTo: userId).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TaskModel.fromMap(doc.data())).toList());
  }
}
