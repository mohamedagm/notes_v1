import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel notemodel) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(notemodel);
      // await Future.delayed(Duration(seconds: 10));
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailed(errorMSG: e.toString()));
    }
  }
}
