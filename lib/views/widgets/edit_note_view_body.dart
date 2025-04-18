import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_v1/cubits/notesCubit/notes_cubit.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/views/widgets/custom_app_bar.dart';
import 'package:notes_v1/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(
              text: 'Edit note',
              iconData: Icons.check,
              ontap: () {
                formKey.currentState!.save();
                note.save();
                BlocProvider.of<NotesCubit>(context).getNotes();
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 25),
            CustomTextField(
              onsaved: (value) {
                if (value != null && value.isNotEmpty) {
                  note.title = value;
                }
              },
              hint: 'title',
            ),
            SizedBox(height: 25),
            CustomTextField(
              onsaved: (value) {
                if (value != null && value.isNotEmpty) {
                  note.content = value;
                }
              },
              hint: 'content',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
