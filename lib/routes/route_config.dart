import 'package:flutter/material.dart';
import 'package:task_app/routes/route_constant.dart';
import 'package:task_app/screens/add_task/view/add_task_screen.dart';
import 'package:task_app/screens/dashboard/dashboard_screen.dart';
import 'package:task_app/screens/splash/splash_screen.dart';

class RouteConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.rInitialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteConstant.rDashBoardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case RouteConstant.rAddTaskScreen:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page Not Found")),
          ),
        );
    }
  }
}
