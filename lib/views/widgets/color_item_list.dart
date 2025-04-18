import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/color_item.dart';

class ColorItemList extends StatelessWidget {
  const ColorItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ColorItem(),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
