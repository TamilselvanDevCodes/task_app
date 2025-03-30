import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/image_constant.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';
import 'package:task_app/routes/route_constant.dart';

import '../../core_needs/variables/global_variables.dart';

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

  void navigate() async {
    await initVariables().then((_)async{
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteConstant.rDashBoardScreen);
      }
    });
    // await Future.delayed(
    //   const Duration(seconds: 10),
    // );
    // if (mounted) {
    //   Navigator.pushReplacementNamed(context, RouteConstant.rDashBoardScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: SizeGetter.getHeight(multiplier: MultiplierConstant.dM4,),
          width: SizeGetter.getWidth(multiplier: MultiplierConstant.dM4,),
          child: Image.asset(
            ImageConstant.iAppLogo,
          ),
        ),
      ),
    );
  }
}
