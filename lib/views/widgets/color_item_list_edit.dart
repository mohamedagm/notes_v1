import 'package:flutter/material.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/views/widgets/color_item.dart';

class ColorItemListEdit extends StatefulWidget {
  const ColorItemListEdit({super.key, required this.note});
  final NoteModel note;
  @override
  State<ColorItemListEdit> createState() => _ColorItemListEditState();
}

class _ColorItemListEditState extends State<ColorItemListEdit> {
  bool isActive = true;
  // int colorIndex = 0;
  late int currentColorIndex;
  @override
  void initState() {
    currentColorIndex = kNoteColors.indexOf(widget.note.color);
    super.initState();
  }

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
                //colorIndex = index;
                widget.note.color = kNoteColors[index];
                currentColorIndex = index;
                setState(() {});
              },
              child: ColorItem(
                color: kNoteColors[index],
                isActive: currentColorIndex == index ? isActive : false,
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
