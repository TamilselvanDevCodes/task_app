import 'package:task_app/routes/route_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/screens/add_task/add_task_screen.dart';
import 'package:task_app/screens/dashboard/dashboard_screen.dart';
import '../screens/splash/splash_screen.dart';

class RouteConfig {

  Future<GoRouter> getRouteConfig()async{
    GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: RouteConstant.rInitialRoute,
          builder: (context, state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: RouteConstant.rDashBoardScreen,
          builder: (context, state) {
            return const DashboardScreen();
          },
        ),
        GoRoute(
          path: RouteConstant.rAddTaskScreen,
          builder: (context, state) {
            return const AddTaskScreen();
          },
        ),
      ],
    );
    return router;
  }
}
