import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_v1/cubits/add_noteCubit/add_note_cubit.dart';
import 'package:notes_v1/cubits/notesCubit/notes_cubit.dart';
import 'package:notes_v1/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailed) {
            print('Failed: ${state.errorMSG}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // بتخلي الفورم تاخد مساحتها بالممللي طبعا الكولوم كمان الي جوه الفورم
          return SingleChildScrollView(
            child: AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 8,
                  left: 8,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
