import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  getNotes() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    notes = noteBox.values.toList();
  }
}
