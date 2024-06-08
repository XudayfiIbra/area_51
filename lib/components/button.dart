import 'package:area_51/components/butto_toggle.dart';
import 'package:flutter/material.dart';

class ButtonBox extends StatefulWidget {
  final Color? color;
  final void Function()? onTap;
  const ButtonBox({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  bool playing = false;
  void iconTapped() {
    if (playing == false) {
      _animationController.forward();
      playing = true;
    } else {
      _animationController.reverse();
      playing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
        ),
        // padding: const EdgeInsets.all(25),
        child: const Center(
          child: ToggleButton(),
        ),
      ),
    );
  }
}
