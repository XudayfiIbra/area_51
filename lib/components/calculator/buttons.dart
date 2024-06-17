import 'package:flutter/material.dart';

class CalBtn extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final btnTapped;

  const CalBtn(
      {super.key,
      required this.color,
      required this.textColor,
      required this.buttonText,
      required this.btnTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
