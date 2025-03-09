import 'package:task_app/data/enums/priority_enum.dart';

import '../enums/task_category_enum.dart';

class AddTaskModel {
  final String title;
  final String? description;
  final TaskCategoryType? taskCategoryType;
  final DateTime? dueDate;
  final bool? isRepeat;
  final PriorityType? priorityType;

  AddTaskModel({
    required this.title,
    this.description,
    this.taskCategoryType,
    this.dueDate,
    this.isRepeat,
    this.priorityType,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'taskCategoryType': taskCategoryType,
      'dueDate': dueDate,
      'isRepeat': isRepeat,
      'priorityType': priorityType,
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
    );
  }

  AddTaskModel copyWith({
    final String? title,
    final String? description,
    final TaskCategoryType? taskCategoryType,
    final DateTime? dueDate,
    final bool? isRepeat,
    final PriorityType? priorityType,
  }) {
    return AddTaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      taskCategoryType: taskCategoryType ?? this.taskCategoryType,
      dueDate: dueDate ?? this.dueDate,
      isRepeat: isRepeat ?? this.isRepeat,
      priorityType: priorityType ?? this.priorityType,
    );
  }

}
