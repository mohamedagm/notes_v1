import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchNotes(String query) {
    final notesBox = Hive.box<NoteModel>(kNoteBox);

    final notes = notesBox.values.toList();

    final filtered =
        notes.where((note) {
          final title = note.title.toLowerCase();
          final content = note.content.toLowerCase();
          final search = query.toLowerCase();

          return title.contains(search) || content.contains(search);
        }).toList();
    emit(SearchSuccess(filtered));
  }
}
