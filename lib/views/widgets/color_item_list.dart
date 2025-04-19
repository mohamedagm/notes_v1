import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/cubits/add_noteCubit/add_note_cubit.dart';
import 'package:notes_v1/views/widgets/color_item.dart';

class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key});

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

class _ColorItemListState extends State<ColorItemList> {
  bool isActive = true;
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () {
                isActive = true;
                colorIndex = index;
                BlocProvider.of<AddNoteCubit>(context).colorValue =
                    noteColors[index];
                setState(() {});
              },
              child: ColorItem(
                color: noteColors[index],
                isActive: colorIndex == index ? isActive : false,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 8,
      ),
    );
  }
}

final List<int> noteColors = [
  kPrimaryColor.value,
  0xffff70a6,
  0xffff9770,
  0xffffd670,
  0xffe9ff70,
  0xffc19477,
  0xff204b57,
  0xff2af5ff,
];
