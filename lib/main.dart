import 'package:task_app/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:task_app/routes/route_constant.dart';

import 'core_needs/theme_data/constants/size_constants.dart';
import 'core_needs/theme_data/theme.dart';
import 'core_needs/variables/global_variables.dart';

bool isDarkMode=false;

void main()async{
  demoLog();
  runApp(const TaskApp());
}

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> with WidgetsBindingObserver{

  MyThemeData myThemeData=MyThemeData();


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

  void changeDimension() async {
    sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    logger.i("sizeConstants.height : ${sizeConstants.height}, sizeConstants.width : ${sizeConstants.width}");
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
      debugShowCheckedModeBanner: false,
    );
  }

}
void demoLog(){
  logger.t("Trace log");

  logger.d("Debug log");

  logger.i("Info log");

  logger.w("Warning log");

  logger.e("Error log", error: 'Test Error');

  logger.f("What a fatal log", error:"Error param" , stackTrace: StackTrace.current);
}
