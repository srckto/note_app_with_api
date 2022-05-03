import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  String hintText;
  bool obscureText;
  int? maxLines;
  String? initialValue;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  CustomField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
