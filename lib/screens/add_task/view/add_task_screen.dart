import 'package:flutter/material.dart';
import 'package:task_app/controllers/task_controller.dart';
import 'package:task_app/core_needs/constants/comparison_constants.dart';
import 'package:task_app/core_needs/constants/message_word_constants.dart';
import 'package:task_app/core_needs/constants/validators.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/utils/date_formatter.dart';
import 'package:task_app/core_needs/utils/drop_down_list_items.dart';
import 'package:task_app/core_needs/widgets/alert_dialog.dart';
import 'package:task_app/core_needs/widgets/app_bar.dart';
import 'package:task_app/core_needs/widgets/circle_tile.dart';
import 'package:task_app/core_needs/widgets/drop_down_form_tile.dart';
import 'package:task_app/core_needs/widgets/form_tile.dart';
import 'package:get/get.dart';

import '../../../data/model/task_model.dart';
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> with Validators {
  TaskController taskController=Get.find<TaskController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController repeatTaskTypeController = TextEditingController();
  List<ToggleItem> toggleItems = [
    ToggleItem(name: UIWordConstant.wSunday, isSelected: false),
    ToggleItem(name: UIWordConstant.wMonday, isSelected: false),
    ToggleItem(name: UIWordConstant.wTuesday, isSelected: false),
    ToggleItem(name: UIWordConstant.wWednesday, isSelected: false),
    ToggleItem(name: UIWordConstant.wThursday, isSelected: false),
    ToggleItem(name: UIWordConstant.wFriday, isSelected: false),
    ToggleItem(name: UIWordConstant.wSaturday, isSelected: false),
  ];
  ValueNotifier<String> repeatTaskTypeValueNotifier =
      ValueNotifier(UIWordConstant.wEveryday);

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(
        title: UIWordConstant.wAddTask,
      ),
      body: Padding(
        padding: MyPadding.getPaddingFormat(
          paddingType: PaddingType.overAllScreen,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: SizeGetter.getHeight(
                  multiplier: MultiplierConstant.dMNotRelatedValueSeparation,
                ),
                children: [
                  FormTile(
                    title: UIWordConstant.wTitle,
                    controller: titleController,
                    isMandatory: true,
                    validator: validateTitle,
                  ),
                  FormTile(
                    title: UIWordConstant.wDescription,
                    controller: descriptionController,
                    textInputAction: TextInputAction.none,
                    // isLarge: true,
                  ),
                  FormTile(
                    title: UIWordConstant.wDueDate,
                    controller: dueDateController,
                    suffixIcon: Icon(
                      Icons.date_range_outlined,
                      color: myThemeColor[300],
                    ),
                    isDateTimePicker: true,
                  ),
                  DropDownFormTile(
                    title: UIWordConstant.wTaskCategoryType,
                    dropDownItems: DropDownListItems.taskCategoryType,
                    controller: taskCategoryController,
                  ),
                  DropDownFormTile(
                    title: UIWordConstant.wPriorityType,
                    dropDownItems: DropDownListItems.priorityType,
                    controller: priorityController,
                  ),
                  repeatTaskTypeView(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder()),
              onPressed:onPressedForCancelButton,
              child: const Text(
                UIWordConstant.wCancel,
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed:onPressedForSaveButton,
              child: const Text(
                UIWordConstant.wSave,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedForDiscardButton() async{
    if(titleController.text.isNotEmpty){
      List<int> repeatDays = List.from(
        toggleItems.takeWhile(
              (toggleItem) => toggleItem.isSelected,
        ),
      );
      TaskModel newTask = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        dueDate: DateFormatter.parseDate(dueDateController.text),
        taskCategory: taskCategoryController.text,
        priority: priorityController.text,
        confirmed: ComparisonConstant.cNo,
        status: ComparisonConstant.cPending,
        repeat: repeatTaskTypeController.text,
        repeatList: repeatDays.isEmpty
            ? null
            : repeatDays,
      );
      taskController.insertTask(newTask: newTask);
    }
  }

  void onPressedForExitButton() async{
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void onPressedForSaveButton()async{
    bool validated = validate();
    if (validated) {
      List<int> repeatDays = List.from(
        toggleItems.takeWhile(
              (toggleItem) => toggleItem.isSelected,
        ),
      );
      TaskModel newTask = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        dueDate: DateFormatter.parseDate(dueDateController.text),
        taskCategory: taskCategoryController.text,
        priority: priorityController.text,
        confirmed: ComparisonConstant.cYes,
        status:ComparisonConstant.cPending,
        repeat: repeatTaskTypeController.text,
        repeatList: repeatDays.isEmpty
            ? null
            : repeatDays, // Example repeating on Monday, Wednesday, Friday
      );
      taskController.insertTask(newTask: newTask);
    }
  }

  void onPressedForCancelButton () {
    if(titleController.text.isNotEmpty){
      MyAlertDialog.showTwoButtonAlertDialog(
        context: context,
        title: UIWordConstant.wDiscardChanges,
        message: MessageWordConstant.mDiscardContentMessage,
        elevatedButtonText: UIWordConstant.wDiscard,
        outlinedButtonText: UIWordConstant.wExit,
        outlinedButtonOnPressed: onPressedForExitButton,
        elevatedButtonOnPressed: onPressedForDiscardButton,
      );
    }
    else{
    Navigator.pop(context);
    }
  }

  Widget repeatTaskTypeView() {
    return ValueListenableBuilder(
      valueListenable: repeatTaskTypeValueNotifier,
      builder: (context, repeatTaskType, child) {
        if (repeatTaskType != UIWordConstant.wCustom) {
          return DropDownFormTile(
            title: UIWordConstant.wRepeat,
            dropDownItems: DropDownListItems.repeatType,
            controller: repeatTaskTypeController,
            onUpdated: (value) {
              repeatTaskTypeValueNotifier.value = value;
            },
            initialIndexValue: 0,
          );
        } else {
          return Column(
            spacing: SizeGetter.getHeight(
              multiplier: MultiplierConstant.dMRelatedValueSeparation,
            ),
            children: [
              DropDownFormTile(
                title: UIWordConstant.wRepeat,
                dropDownItems: DropDownListItems.repeatType,
                controller: repeatTaskTypeController,
                onUpdated: (value) {
                  repeatTaskTypeValueNotifier.value = value;
                },
              ),
              Wrap(
                spacing: SizeGetter.getWidth(
                  multiplier: MultiplierConstant.dMCloseRelatedValueSeparation,
                ),
                runSpacing: SizeGetter.getHeight(
                  multiplier: MultiplierConstant.dMCloseRelatedValueSeparation,
                ),
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: List.generate(
                  toggleItems.length,
                  (index) => CircleTile(
                    initialSelected:
                        index == 0 || index == toggleItems.length - 1
                            ? toggleItems[index].isSelected
                            : true,
                    childText: toggleItems[index].name,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class ToggleItem {
  String name;
  bool isSelected;

  ToggleItem({
    required this.name,
    required this.isSelected,
  });
}
