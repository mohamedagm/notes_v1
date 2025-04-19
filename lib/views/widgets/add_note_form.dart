import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_v1/cubits/add_noteCubit/add_note_cubit.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/views/widgets/color_item_list.dart';
import 'package:notes_v1/views/widgets/custom_button.dart';
import 'package:notes_v1/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          SizedBox(height: 15),
          CustomTextField(
            onsaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),

          SizedBox(height: 25),

          ColorItemList(),

          SizedBox(height: 25),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // formKey.currentState!.reset();
                    NoteModel notemodel = NoteModel(
                      title: title!,
                      content: subTitle!,
                      color: BlocProvider.of<AddNoteCubit>(context).colorValue,
                      date: DateFormat(
                        'd MMMM, yyyy – hh:mm a',
                      ).format(DateTime.now()),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                childtext: 'Add',
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
