import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_v1/cubits/notesCubit/notes_cubit.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.notemodel});
  final NoteModel notemodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: notemodel);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(notemodel.color),
            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                //tileColor: Colors.orangeAccent,
                title: Text(
                  notemodel.title,
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    notemodel.content,
                    style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.7),
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: BlocBuilder<NotesCubit, NotesState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        notemodel.delete();
                        BlocProvider.of<NotesCubit>(context).getNotes();
                      },
                      icon: Icon(Icons.delete, color: Colors.black),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  notemodel.date,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
