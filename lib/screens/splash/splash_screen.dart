import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/routes/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }
  void navigate()async{
    await Future.delayed(Duration(seconds: 1),);
    if (mounted) {
      Navigator.pushReplacementNamed(context, RouteConstant.rDashBoardScreen);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Splash",style: MyThemeTextStyle.headLineLarge(),),
    );
  }
}
