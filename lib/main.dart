import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/cubits/add_noteCubit/add_note_cubit.dart';
import 'package:notes_v1/cubits/notesCubit/notes_cubit.dart';
import 'package:notes_v1/models/note_model.dart';
import 'package:notes_v1/simple_bloc_Observer.dart';
import 'package:notes_v1/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      ),
    );
  }
}
