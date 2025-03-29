import '../../../core_needs/constants/database_constants.dart';
import '../../model/notification_response_model.dart';
import '../model_repository.dart';

class NotificationRepository {
  final ModelRepository<NotificationPayload> notificationRepository =
  ModelRepository<NotificationPayload>(
    tableName: TableNameConstant.tNotification,
    createTableQuery: CreateTableConstant.cNotification,
  );

  /// Insert a new notification and return true if successful
  Future<bool> insertNotification({required NotificationPayload notification}) async {
    return await notificationRepository.insert(model: notification) != 0;
  }

  /// Update an existing notification based on its ID
  Future<bool> updateNotification({required NotificationPayload notification}) async {
    return await notificationRepository.update(
      model: notification,
      where: 'id = ?',
      whereArgs: [notification.id],
    ) != 0;
  }

  /// Delete a notification by ID
  Future<bool> deleteNotification({required int notificationId}) async {
    return await notificationRepository.delete(
      where: 'id = ?',
      whereArgs: [notificationId],
    ) != 0;
  }

  /// Get all notifications from the database
  Future<List<NotificationPayload>> getAllNotifications() async {
    return await notificationRepository.getAll(fromMap: NotificationPayload.fromJson);
  }

  /// Get a single notification by ID
  Future<NotificationPayload> getNotificationById({required int id}) async {
    List<NotificationPayload> notifications = await notificationRepository.get(
      fromMap: NotificationPayload.fromJson,
      where: "id = ?",
      whereArgs: [id],
    );
    return notifications.first;
  }

  /// Get unread notifications
  Future<List<NotificationPayload>> getUnreadNotifications() async {
    return await notificationRepository.get(
      fromMap: NotificationPayload.fromJson,
      where: "isRead = ?",
      whereArgs: [0], // Assuming 0 = false (unread)
    );
  }

  /// Mark a notification as read
  Future<bool> markNotificationAsRead({required int notificationId}) async {
    return await notificationRepository.update(
      model: NotificationPayload(
        id: notificationId,
        taskId: 0,
        title: '',
        message: '',
        timestamp: DateTime.now(),
        taskType: '',
        isRead: true, // Mark as read
      ),
      where: 'id = ?',
      whereArgs: [notificationId],
    ) != 0;
  }

  /// Clear all notifications
  Future<void> deleteAllNotifications() async {
    await notificationRepository.deleteAll();
  }
}
