import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onsaved,
    required this.hint,
    this.maxLines,
  });
  void Function(String?)? onsaved;
  final String hint;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      onSaved: onsaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder([Color]) => OutlineInputBorder(
    borderSide: BorderSide(color: Color ?? Colors.white, width: 2),
    borderRadius: BorderRadius.circular(8),
  );
}
