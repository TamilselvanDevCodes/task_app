import 'package:flutter/material.dart';
import '../theme_data/theme.dart';
class CircleTile extends StatefulWidget {
  final String childText;
  final bool initialSelected; // Pass initial selection state

  const CircleTile({
    super.key,
    required this.childText,
    this.initialSelected = false,
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
    isSelected.value = !isSelected.value; // Update only this widget
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection, // Toggle on tap
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
