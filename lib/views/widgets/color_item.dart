import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final int color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          backgroundColor: kPrimaryColor,
          radius: 35,
          child: CircleAvatar(backgroundColor: Color(color), radius: 32),
        )
        : CircleAvatar(backgroundColor: Color(color), radius: 32);
  }
}
