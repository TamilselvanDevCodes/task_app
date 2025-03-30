import 'package:get/get.dart';
import 'package:task_app/core_needs/utils/navigation_service.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/data/database/repository/task_repository.dart';
import 'package:task_app/data/enums/all_enums.dart';

import '../core_needs/constants/comparison_constants.dart';
import '../core_needs/constants/message_word_constants.dart';
import '../core_needs/utils/common_functions.dart';
import '../data/model/task_model.dart';

class TaskController extends GetxController {
  final TaskRepository _taskRepository = TaskRepository();
  List<TaskModel> tasks = <TaskModel>[].obs;
  List<TaskModel> pendingTasks = <TaskModel>[].obs;
  List<TaskModel> overDueTasks = <TaskModel>[].obs;
  List<TaskModel> completedTasks = <TaskModel>[].obs;

  TaskController() {
    getAllTasks();
  }

  void getAllTasks() async {
    tasks = await _taskRepository.getAllTasks();
    _sortTasks();
    _filterTasksByStatus();
    update();
    logger.d("Tasks :$tasks");
    logger.d("PendingTasks :$pendingTasks");
    logger.d("OverDueTasks :$overDueTasks");
    logger.d("CompletedTasks :$completedTasks");
  }

  void _filterTasksByStatus() {
    for (TaskModel task in tasks) {
      if (task.status == ComparisonConstant.cPending) {
        pendingTasks.add(task);
      } else if (task.status == ComparisonConstant.cOverdue) {
        overDueTasks.add(task);
      } else if (task.status == ComparisonConstant.cCompleted) {
        completedTasks.add(task);
      }
    }
  }

  void _sortTasks() {
    tasks.sort((a, b) => b.dueDate.compareTo(a.dueDate));
  }

  void insertTask({required TaskModel newTask}) async {
    bool isInserted = await _taskRepository.insertTask(taskModel: newTask);
    logger.i("insertTask : $isInserted");
    if (isInserted) {
      tasks.add(newTask);
      _sortTasks();
      update();
    }
    if (newTask.confirmed == "yes") {
      _insertTaskActionForSave(isInserted: isInserted);
    } else {
      _insertTaskActionForDraft(isInserted: isInserted);
    }
  }

  void deleteTask({required int? taskId}) async {
    if (taskId == null) {
      logger.e("DeleteTask taskId is null!");
      return;
    }
    bool isDeleted = await _taskRepository.deleteTask(taskId: taskId);
    logger.i("deleteTask : $isDeleted");
    if (isDeleted) {
      getAllTasks();
      showSnackBar(
        content: MessageWordConstant.mTaskDeletedMessage,
        snackBarEnum: SnackBarEnum.success,
      );
    } else {
      showSnackBar(
        content: MessageWordConstant.mErrorMessage,
        snackBarEnum: SnackBarEnum.error,
      );
    }
  }

  Future<void> updateTask({required TaskModel? taskModel}) async {
    if (taskModel == null) {
      logger.e("UpdateTask taskModel is null!");
      return;
    }
    bool isUpdated = await _taskRepository.updateTask(taskModel: taskModel,);
    logger.i("isUpdated : $isUpdated");
    if (isUpdated) {
      NavigationService.pop();
      getAllTasks();
      showSnackBar(
        content: MessageWordConstant.mTaskUpdatedMessage,
        snackBarEnum: SnackBarEnum.success,
      );
    } else {
      showSnackBar(
        content: MessageWordConstant.mErrorMessage,
        snackBarEnum: SnackBarEnum.error,
      );
    }
  }

  void updateStatus() {
    DateTime today = DateTime.now();

    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].status == ComparisonConstant.cCompleted) {
        continue; // Ignore completed tasks
      }
      int remainingDays = tasks[i].dueDate.difference(today).inDays;

      if (remainingDays < 0) {
        tasks[i] = tasks[i].copyWith(status: ComparisonConstant.cOverdue);
      } else {
        tasks[i] = tasks[i].copyWith(status: ComparisonConstant.cPending);
      }
    }
  }
}

void _insertTaskActionForDraft({required bool isInserted}) {
  if (isInserted) {
    showSnackBar(
      content: MessageWordConstant.mDraftSavedMessage,
      snackBarEnum: SnackBarEnum.success,
    );
  } else {
    showSnackBar(
      content: MessageWordConstant.mErrorMessage,
      snackBarEnum: SnackBarEnum.error,
    );
  }
  NavigationService.pop();
  NavigationService.pop();
}

void _insertTaskActionForSave({required bool isInserted}) {
  if (isInserted) {
    showSnackBar(
      content: MessageWordConstant.mTaskAddedMessage,
      snackBarEnum: SnackBarEnum.success,
    );
  } else {
    showSnackBar(
      content: MessageWordConstant.mErrorMessage,
      snackBarEnum: SnackBarEnum.error,
    );
  }
  NavigationService.pop();
}
