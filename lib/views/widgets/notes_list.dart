import 'package:flutter/material.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/views/widgets/notes_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return NotesItem(
            notemodel: NoteModel(
              title: 'myfitness tips',
              content:
                  'firstly you must do your trainng every day and also take a good rest',
              color: 0xFFFF9800,
              date: '17April, 2025',
            ),
          );
        },
      ),
    );
  }
}
