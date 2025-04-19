import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/constants/style_constant.dart';
import 'package:task_app/core_needs/theme_data/styles/border_style.dart';
import 'package:task_app/core_needs/theme_data/theme.dart';

class FilterDropdown extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onChanged;

  const FilterDropdown({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _currentValue,
      icon: const Icon(Icons.arrow_drop_down),
      borderRadius: getBorderRadius(),
      elevation: StyleConstant.subElevation.toInt(),
      items: widget.options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() => _currentValue = newValue);
          widget.onChanged(newValue);
        }
      },
    );
  }
}
