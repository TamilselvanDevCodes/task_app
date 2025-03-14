import 'package:flutter/material.dart';
import 'package:task_app/core_needs/constants/message_word_constants.dart';
import 'package:task_app/core_needs/theme_data/styles/text_style.dart';

import '../constants/word_constants.dart';
import '../theme_data/my_padding.dart';

class DropDownFormTile extends StatefulWidget {
  final List<String> dropDownItems;
  final TextEditingController controller;
  final int? initialIndexValue;
  final String title;
  final void Function(String value)? onUpdated;

  const DropDownFormTile({
    super.key,
    this.initialIndexValue,
    required this.dropDownItems,
    required this.controller,
    this.onUpdated,
    required this.title,
  });

  @override
  State<DropDownFormTile> createState() => _DropDownFormTileState();
}

class _DropDownFormTileState extends State<DropDownFormTile> {
  @override
  void initState() {
    if (widget.initialIndexValue != null &&
        widget.initialIndexValue! >= 0 &&
        widget.initialIndexValue! < widget.dropDownItems.length) {

      widget.controller.text = widget.dropDownItems[widget.initialIndexValue!];
    } else {
      widget.controller.text = widget.dropDownItems.last;
    }

    setState(() {});
    super.initState();
  }

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
                TextSpan(
                  text: UIWordConstant.wMandatory,
                  style: MyThemeTextStyle.labelMedium().copyWith(
                    color: Colors.red.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          value: widget.controller.text,
          items: widget.dropDownItems.map((String item) {
            return DropdownMenuItem(
              value: item, // Each item has its correct value
              child: Text(item,style: MyThemeTextStyle.bodyMedium(),),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.controller.text =
                  value ?? widget.controller.text; // Update state correctly
            });
            if(widget.onUpdated!=null){
              widget.onUpdated!(widget.controller.text);
            }
          },
          style:MyThemeTextStyle.bodySmall(),
        ),
      ],
    );
  }
}
