import 'package:flutter/material.dart';
import 'package:note_app_with_api/components/custom_text.dart';

class Alert extends StatelessWidget {
  final String message;
  const Alert({
    Key? key,
    required this.message,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
        text: "Note",
        fontWeight: FontWeight.bold,
      ),
      content: CustomText(text: message),
    );
  }
}
