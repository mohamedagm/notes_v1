import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.iconData});
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 28)),
        Spacer(flex: 1),
        CustomIcon(icon: iconData),
      ],
    );
  }
}
