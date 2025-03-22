class NotificationPayload {
  final int id;         // Unique Notification ID
  final String taskId;     // Associated Task ID
  final String title;      // Notification Title
  final String message;    // Notification Content
  final DateTime timestamp; // When the notification was created
  final String taskType;   // Quadrant Type (Immediate, Priority, etc.)
  final String actionType; // Action Type (open_task, mark_done)
  final bool isRead;       // Status if notification is read

  NotificationPayload({
    required this.id,
    required this.taskId,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.taskType,
    required this.actionType,
    this.isRead = false,
  });

  // Convert JSON to NotificationPayload object
  factory NotificationPayload.fromJson(Map<String, dynamic> json) {
    return NotificationPayload(
      id: json['id'],
      taskId: json['taskId'],
      title: json['title'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
      taskType: json['taskType'],
      actionType: json['actionType'],
      isRead: json['isRead'] ?? false,
    );
  }

  // Convert NotificationPayload object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'taskType': taskType,
      'actionType': actionType,
      'isRead': isRead,
    };
  }
}
