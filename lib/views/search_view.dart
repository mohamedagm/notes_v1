import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_v1/constants.dart';
import 'package:notes_v1/cubits/searchCubit/search_cubit.dart';
import 'package:notes_v1/views/widgets/search_view_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchViewBody(),
      ),
    );
  }
}
