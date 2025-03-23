import 'package:task_app/core_needs/constants/database_constants.dart';
import 'package:task_app/data/database/model_repository.dart';
import '../../model/task_model.dart';

class TaskRepository {
  final ModelRepository<TaskModel> taskRepository = ModelRepository<TaskModel>(
    tableName: TableNameConstant.tTask,
    createTableQuery: CreateTableConstant.cTask,
  );

  /// Insert a new task and return true if successful
  Future<bool> insertTask({required TaskModel taskModel}) async {
    return await taskRepository.insert(model: taskModel) != 0;
  }

  /// Update an existing task based on its ID
  Future<bool> updateTask({required TaskModel taskModel}) async {
    return await taskRepository.update(
      model: taskModel,
      where: 'id = ?',
      whereArgs: [taskModel.id],
    ) != 0;
  }

  /// Delete a task by ID
  Future<bool> deleteTask({required int taskId}) async {
    return await taskRepository.delete(
      where: 'id = ?',
      whereArgs: [taskId],
    ) != 0;
  }

  /// Get all tasks from the database
  Future<List<TaskModel>> getAllTasks() async {
    return await taskRepository.getAll(fromMap: TaskModel.fromMap);
  }
  Future<TaskModel> getTaskById({required int id}) async {
    List<TaskModel>tasks= await taskRepository.get(fromMap: TaskModel.fromMap,whereArgs:[id],where: "id");
    return tasks.first;
  }

}



