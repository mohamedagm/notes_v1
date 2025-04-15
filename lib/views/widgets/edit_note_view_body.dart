import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_app_bar.dart';
import 'package:notes_v1/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(text: 'Edit note', iconData: Icons.check),
          SizedBox(height: 25),
          CustomTextField(onsaved: (value) {}, hint: 'title'),
          SizedBox(height: 25),
          CustomTextField(onsaved: (value) {}, hint: 'content', maxLines: 5),
        ],
      ),
    );
  }
}
