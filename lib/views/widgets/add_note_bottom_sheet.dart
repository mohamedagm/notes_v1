import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_button.dart';
import 'package:notes_v1/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomTextField(onChanged: (value) {}, hint: 'Title'),
          SizedBox(height: 15),
          CustomTextField(onChanged: (value) {}, hint: 'Content', maxLines: 5),
          SizedBox(height: 50),
          CustomButton(onTap: () {}, childtext: 'Add'),
        ],
      ),
    );
  }
}
