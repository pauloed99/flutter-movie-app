import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: textOverflow,
      ),
      textAlign: textAlign,
    );
  }
}
