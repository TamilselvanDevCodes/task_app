import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/constants/size_constants.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/variables/global_variables.dart';
import 'package:task_app/routes/route_constant.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: MyPadding.getDimensionEdgeInsets(
          multiplier: MultiplierConstant.dM01,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DrawerTile(
              title: UIWordConstant.wDashboard,
              navigationScreenName: RouteConstant.rDashBoardScreen,
              iconData: Icons.dashboard_outlined,
            ),
            _DrawerTile(
              title: UIWordConstant.wTasks,
              navigationScreenName: RouteConstant.rTaskListScreen,
              iconData: Icons.task_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatefulWidget {
  final String title;
  final String navigationScreenName;
  final IconData iconData;

  const _DrawerTile({
    required this.title,
    required this.navigationScreenName,
    required this.iconData,
  });

  @override
  State<_DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<_DrawerTile> {
  @override
  Widget build(BuildContext context) {
    String? currentScreenName;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentScreenName = ModalRoute.of(context)?.settings.name;
      logger.d("currentScreenName : $currentScreenName");
    });

    return ListTile(
      tileColor: currentScreenName==widget.navigationScreenName?myThemeColor[400]:myThemeColor[50],
      leading: Icon(widget.iconData),
      title: Text(
        widget.title,
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, widget.navigationScreenName,);
      },
    );
  }
}
