import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSized;
  final FontWeight fontWeight;
  final int? maxLine;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSized = 16,
    this.fontWeight = FontWeight.normal,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSized,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
