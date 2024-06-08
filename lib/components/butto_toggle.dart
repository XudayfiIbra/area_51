import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isDark = false;

  void iconToggle() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: iconToggle,
      child: Icon(
        isDark ? Icons.sunny : Icons.nightlight,
      ),
    );
  }
}
