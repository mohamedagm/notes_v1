import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.onsaved,
    required this.hint,
    this.maxLines,
    required this.text,
  });
  final String text;
  final void Function(String?)? onsaved;
  final String hint;
  final int? maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController? controller = TextEditingController();
  @override
  void initState() {
    controller?.text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      onSaved: widget.onsaved,
      maxLines: widget.maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: widget.hint,
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
