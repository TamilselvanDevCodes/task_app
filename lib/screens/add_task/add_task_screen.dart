import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/error_word_constants.dart';
import 'package:task_app/core_needs/constants/validators.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/screens/drawer.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';
import 'package:task_app/core_needs/utils/common_functions.dart';
import 'package:task_app/core_needs/utils/drop_down_list_items.dart';
import 'package:task_app/core_needs/widgets/alert_dialog.dart';
import 'package:task_app/core_needs/widgets/app_bar.dart';
import 'package:task_app/core_needs/widgets/circle_tile.dart';
import 'package:task_app/core_needs/widgets/drop_down_form_tile.dart';
import 'package:task_app/core_needs/widgets/form_tile.dart';
import 'package:task_app/routes/route_constant.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<_FormViewState> formViewKey = GlobalKey<_FormViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(
        title: UIWordConstant.wAddTask,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: MyPadding.getPaddingFormat(
          paddingType: PaddingType.overAllScreen,
        ),
        child: Center(
          child: _FormView(
            key: formViewKey,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                MyAlertDialog.showTwoButtonAlertDialog(
                  context: context,
                  title: UIWordConstant.wDiscardChanges,
                  message: MessageWordConstant.mDiscardContentMessage,
                  elevatedButtonText: UIWordConstant.wDiscard,
                  outlinedButtonText: UIWordConstant.wExit,
                  outlinedButtonOnPressed: onPressedForExitButton,
                  elevatedButtonOnPressed: onPressedForDiscardButton,
                );
              },
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
              onPressed: () {
                bool validated = formViewKey.currentState?.validate() ?? false;
                if (validated) {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteConstant.rDashBoardScreen,
                  );
                  showSnackBar(
                    context: context,
                    content: MessageWordConstant.mTaskAddedMessage,
                  );
                }
                debugPrint("Save button pressed!");
              },
              child: const Text(
                UIWordConstant.wSave,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressedForDiscardButton() {
    Navigator.pushReplacementNamed(
      context,
      RouteConstant.rDashBoardScreen,
    );
    showSnackBar(
      context: context,
      content: MessageWordConstant.mDraftSavedMessage,
    );
  }

  onPressedForExitButton() {
    Navigator.pushReplacementNamed(
      context,
      RouteConstant.rDashBoardScreen,
    );
  }
}

class _FormView extends StatefulWidget {
  const _FormView({super.key});

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> with Validators {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController taskCategoryController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController repeatTaskTypeController = TextEditingController();
  List<ToggleItem> toggleItems = [
    ToggleItem(
      name: UIWordConstant.wSunday,
      isSelected: false,
    ),
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
    return SingleChildScrollView(
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
    );
  }

  Widget repeatTaskTypeView() {
    return ValueListenableBuilder(
      valueListenable: repeatTaskTypeValueNotifier,
      builder: (context, repeatTaskType, child) {
        print("calledanafjdf0-------------------");
        // if (repeatTaskType == UIWordConstant.wEveryday) {
        //   return DropDownFormTile(
        //     title: UIWordConstant.wRepeat,
        //     dropDownItems: DropDownListItems.repeatType,
        //     controller: repeatTaskTypeController,
        //     initialIndexValue: 0,
        //   );
        // } else if (repeatTaskType == UIWordConstant.wWeekly) {
        //   return DropDownFormTile(
        //     title: UIWordConstant.wRepeat,
        //     dropDownItems: DropDownListItems.repeatType,
        //     controller: repeatTaskTypeController,
        //     initialIndexValue: 1,
        //   );
        // } else if (repeatTaskType == UIWordConstant.wMonthly) {
        //   return DropDownFormTile(
        //     title: UIWordConstant.wRepeat,
        //     dropDownItems: DropDownListItems.repeatType,
        //     controller: repeatTaskTypeController,
        //     initialIndexValue: 2,
        //   );
        // }
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
