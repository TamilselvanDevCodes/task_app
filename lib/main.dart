import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/routes/route_config.dart';
import 'package:task_app/routes/route_constant.dart';

bool isDarkMode = false;

void main() async {
  await initVariables();
  runApp(const TaskApp());
}

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> with WidgetsBindingObserver {
  MyThemeData myThemeData = MyThemeData();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    changeDimension();
  }

  void changeDimension() {
    sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    debugPrint("didChangeMetrics called");
  }

  @override
  Widget build(BuildContext context) {
    sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    return MaterialApp(
      onGenerateRoute: RouteConfig.onGenerateRoute,
      initialRoute: RouteConstant.rInitialRoute,
      theme: myThemeData.getBaseThemeData(isDarkMode: isDarkMode),
      darkTheme: myThemeData.getBaseThemeData(isDarkMode: isDarkMode),
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackBarKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => child!,
            ),
          ],
        );
      },
    );
  }
}
