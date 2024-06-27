import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool? status) onChanged;
  final Color? activeColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        width: Checkbox.width,
        height: Checkbox.width,
        child: Checkbox(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          value: value,
          onChanged: onChanged,
          activeColor: activeColor ?? Colors.blue,
        ),
      ),
    );
  }
}
