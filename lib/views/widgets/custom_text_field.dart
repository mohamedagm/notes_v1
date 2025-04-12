import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onChanged,
    required this.hint,
    this.maxLines,
  });
  final String hint;
  void Function(String data)? onChanged;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: KprimaryColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(KprimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder([Color]) => OutlineInputBorder(
    borderSide: BorderSide(color: Color ?? Colors.white, width: 2),
    borderRadius: BorderRadius.circular(8),
  );
}
