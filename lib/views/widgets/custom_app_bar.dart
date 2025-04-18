import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.text,
    required this.iconData,
    this.ontap,
  });
  final String text;
  final IconData iconData;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 28)),
        Spacer(flex: 1),
        GestureDetector(onTap: ontap, child: CustomIcon(icon: iconData)),
      ],
    );
  }
}
