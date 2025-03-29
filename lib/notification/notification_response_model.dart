class NotificationPayload {
  final int id;         // Unique Notification ID
  final int taskId;     // Associated Task ID
  final String title;      // Notification Title
  final String message;    // Notification Content
  final DateTime timestamp; // When the notification was created
  final String taskType;   // Quadrant Type (Immediate, Priority, etc.)
  final bool isRead;       // Status if notification is read

  NotificationPayload({
    required this.id,
    required this.taskId,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.taskType,
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
      'isRead': isRead,
    };
  }
}
