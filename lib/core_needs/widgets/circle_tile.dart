import 'package:flutter/material.dart';
import '../theme_data/theme.dart';
class CircleTile extends StatefulWidget {
  final String childText;
  final bool initialSelected;
  final bool? canToggle;
  final VoidCallback? onChanged;
  const CircleTile({
    super.key,
    required this.childText,
    this.initialSelected = false,
    this.onChanged,
    this.canToggle,
  });

  @override
  State<CircleTile> createState() => _CircleTileState();
}

class _CircleTileState extends State<CircleTile> {
  late ValueNotifier<bool> isSelected; // Use ValueNotifier for efficient updates

  @override
  void initState() {
    super.initState();
    isSelected = ValueNotifier(widget.initialSelected); // Initialize with passed state
  }

  @override
  void dispose() {
    isSelected.dispose(); // Clean up
    super.dispose();
  }

  void toggleSelection() {
    isSelected.value = !isSelected.value;
    if(widget.onChanged!=null){
      widget.onChanged!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.canToggle!=null&&!widget.canToggle!?null:toggleSelection, // Toggle on tap
      child: ValueListenableBuilder<bool>(
        valueListenable: isSelected,
        builder: (context, value, child) {
          return CircleAvatar(
            backgroundColor: value ? myThemeColor.shade400:Colors.white,
            child: Text(
              widget.childText,
              style: TextStyle(
                fontWeight: value ? FontWeight.w600 : FontWeight.w400,
                color: value ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
