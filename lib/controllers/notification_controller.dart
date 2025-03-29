import 'package:get/get.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/data/database/repository/notification_repository.dart';
import 'package:task_app/data/database/repository/task_repository.dart';
import 'package:task_app/data/model/notification_response_model.dart';

import '../data/model/task_model.dart';


class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository = NotificationRepository();
  final TaskRepository _taskRepository=TaskRepository();
  List<NotificationPayload> notifications = <NotificationPayload>[].obs;

  NotificationController() {
    getAllNotifications();
  }

  Future<void> getAllNotifications() async {
    notifications = await _notificationRepository.getAllNotifications();
    update();
    logger.d("Notifications :$notifications");
  }



  void addNotification({required NotificationPayload notificationPayload}) async {
    bool isInserted = await _notificationRepository.insertNotification(notification:notificationPayload);
    logger.i("addNotification : $isInserted");
    if (isInserted) {
      notifications.add(notificationPayload);
      update();
    }
  }

  void deleteNotification({required int? notificationId}) async {
    if (notificationId == null) {
      logger.e("deleteNotification notificationId is null!");
      return;
    }
    bool isDeleted = await _notificationRepository.deleteNotification(notificationId:notificationId);
    logger.i("deleteNotification : $isDeleted");
    if (isDeleted) {
      getAllNotifications();
      // showSnackBar(
      //   content: MessageWordConstant.,
      //   snackBarEnum: SnackBarEnum.success,
      // );
    } else {
      // showSnackBar(
      //   content: MessageWordConstant.mErrorMessage,
      //   snackBarEnum: SnackBarEnum.error,
      // );
    }
  }
  Future<TaskModel?> getTaskForNotification({required int taskId})async{
    return await _taskRepository.getTaskById(id: taskId);
  }

}
