import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/word_constants.dart';
import 'package:task_app/core_needs/theme_data/my_padding.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';

class FormTile extends StatefulWidget {
  final String title;
  final bool? isMandatory;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final bool? isLarge;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isDateTimePicker;
  final TextInputAction? textInputAction;

  @override
  State<FormTile> createState() => _FormTileState();

  const FormTile({
    super.key,
    required this.title,
    this.isMandatory,
    this.suffixIcon,
    this.isDateTimePicker,
    this.isLarge,
    this.validator,
    this.isObscureText,
    required this.controller,
    this.textInputAction,
  });
}

class _FormTileState extends State<FormTile> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SizeGetter.getHeight(
        multiplier: MultiplierConstant.dMRelatedValueSeparation,
      ),
      children: [
        Padding(
          padding: MyPadding.getLeftEdgeInsets(
            multiplier: MultiplierConstant.dM02,
          ),
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: MyThemeTextStyle.labelMedium().copyWith(
                color: Colors.black,
              ),
              children: [
                const TextSpan(
                  text: UIWordConstant.wBlankString,
                ),
                if(widget.isMandatory!=null&&widget.isMandatory!)TextSpan(
                  text: UIWordConstant.wMandatory,
                  style: MyThemeTextStyle.labelMedium().copyWith(
                    color: Colors.red.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isObscureText ?? false,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          readOnly: widget.isDateTimePicker != null && widget.isDateTimePicker!,
          onTap: widget.isDateTimePicker != null && widget.isDateTimePicker!
              ? () async {
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 60,
                      ),
                    ),
                  );
                  if (dateTime != null) {
                    widget.controller.text =
                        "${dateTime.day.toString().padLeft(2, '0')}-"
                        "${dateTime.month.toString().padLeft(2, '0')}-"
                        "${dateTime.year}";
                  }
                }
              : null,
          maxLines: widget.isLarge != null && widget.isLarge! ? 3 : 1,
          validator: widget.validator,
          textInputAction: widget.textInputAction??TextInputAction.next,
          decoration: InputDecoration(
            counterText: "",
            suffixIcon: widget.suffixIcon ??
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.controller,
                  builder: (context, value, child) {
                    return value.text.length>20
                        ? IconButton(
                      onPressed: () {
                        widget.controller.clear();
                      },
                      icon: const Icon(Icons.clear_outlined),
                    )
                        : const SizedBox.shrink(); // Ensures layout remains stable
                  },
                ),
            // fillColor: myThemeColor[50],
          ).applyDefaults(
            Theme.of(context).inputDecorationTheme,
          ), //
        ),
      ],
    );
  }
}
