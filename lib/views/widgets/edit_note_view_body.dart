import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        CustomAppBar(text: 'Edit note', iconData: Icons.check),
      ],
    );
  }
}
