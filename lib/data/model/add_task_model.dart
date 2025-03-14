import 'package:task_app/data/enums/priority_enum.dart';

import '../enums/task_category_enum.dart';

class AddTaskModel {
  final String title;
  final String? description;
  final TaskCategoryType? taskCategoryType;
  final DateTime? dueDate;
  final bool? isRepeat;
  final PriorityType? priorityType;
  final String confirmed;
  final String status;
  AddTaskModel({
    required this.title,
    this.description,
    this.taskCategoryType,
    this.dueDate,
    this.isRepeat,
    this.priorityType,
    required this.confirmed,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'taskCategoryType': taskCategoryType,
      'dueDate': dueDate,
      'isRepeat': isRepeat,
      'priorityType': priorityType,
      'confirmed': confirmed,
      'status': status,
    };
  }

  factory AddTaskModel.fromMap(Map<String, dynamic> map) {
    return AddTaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      taskCategoryType: map['taskCategoryType'] as TaskCategoryType,
      dueDate: map['dueDate'] as DateTime,
      isRepeat: map['isRepeat'] as bool,
      priorityType: map['priorityType'] as PriorityType,
      confirmed: map['confirmed'] as String,
      status: map['status'] as String
    );
  }


}
