import 'package:flutter/material.dart';

class CWText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;

  const CWText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xffF6F8FF),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
