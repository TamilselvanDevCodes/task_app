import 'package:flutter/material.dart';
import 'package:task_app/routes/route_constant.dart';
import 'package:task_app/screens/add_task/view/add_task_screen.dart';
import 'package:task_app/screens/dashboard/dashboard_screen.dart';
import 'package:task_app/screens/notification/notification_screen.dart';
import 'package:task_app/screens/splash/splash_screen.dart';
import 'package:task_app/screens/task_detail/task_details_screen.dart';
import 'package:task_app/screens/task_list/view/task_list_screen.dart';

import '../data/model/task_model.dart';

class RouteConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.rInitialRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case RouteConstant.rDashBoardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );

      case RouteConstant.rAddTaskScreen:
        return MaterialPageRoute(
          builder: (_) => const AddTaskScreen(),
          settings: settings,
        );

      case RouteConstant.rTaskListScreen:
        return MaterialPageRoute(
          builder: (_) => const TaskListScreen(),
          settings: settings,
        );

      case RouteConstant.rTaskDetailScreen:
        return MaterialPageRoute(
          builder: (_) => TaskDetailsScreen(
            taskModel: settings.arguments as TaskModel?,
          ),
          settings: settings,
        );
      case RouteConstant.rNotificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "Page Not Found",
              ),
            ),
          ),
        );
    }
  }
}
