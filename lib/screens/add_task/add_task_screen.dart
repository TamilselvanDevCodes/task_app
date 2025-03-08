import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/screens/drawer.dart';
import 'package:task_app/core_needs/widgets/app_bar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(
        title: WordConstants.wAddTask,
      ),
      drawer: const MyDrawer(),
      body: Center(child: ,),
    );
  }
}
