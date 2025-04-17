import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  getNotes() {
    //emit(AddNoteLoading()); مش شغال بنت اصلا فمش محتاج اللودينج هنا خالص
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notes = noteBox.values.toList();
      emit(NotesSuccess(notes: notes));
    } catch (e) {
      emit(NotesFailed(errorMSG: e.toString()));
    }
  }
}
