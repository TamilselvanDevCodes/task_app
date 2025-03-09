import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/routes/route_constant.dart';

int currentTileIndex=0;

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: MyPadding.getDimensionEdgeInsets(
          multiplier: MultiplierConstant.dM01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _DrawerTile(
              title: UIWordConstant.wDashboard,
              navigationScreenName: RouteConstant.rDashBoardScreen,
              iconData: Icons.dashboard_outlined,
              tileIndex: 0,
            ),
            _DrawerTile(
              title: UIWordConstant.wAddTask,
              navigationScreenName: RouteConstant.rAddTaskScreen,
              iconData: Icons.add_task_outlined,
              tileIndex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String title;
  final String navigationScreenName;
  final IconData iconData;
  final int tileIndex;

  const _DrawerTile({
    required this.title,
    required this.navigationScreenName,
    required this.iconData,
    required this.tileIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: currentTileIndex==tileIndex?myThemeColor[400]:myThemeColor[50],
      leading: Icon(iconData),
      title: Text(
        title,
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, navigationScreenName,);
        currentTileIndex=tileIndex;
      },
    );
  }
}
