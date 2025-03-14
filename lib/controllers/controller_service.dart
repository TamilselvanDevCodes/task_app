import 'package:get/get.dart';
import 'package:task_app/controllers/task_controller.dart';

class ControllerService {
  static final ControllerService _instance = ControllerService._internal();

  ControllerService._internal();

  factory ControllerService() {
    return _instance;
  }

  void initializeAllControllers(){
    Get.put(TaskController());
  }

}
