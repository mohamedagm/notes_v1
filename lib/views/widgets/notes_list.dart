import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/notes_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const NotesItem();
      },
    );
  }
}
