import 'package:flutter/material.dart';
import 'package:notes_v1/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Column(children: [SizedBox(height: 50), CustomAppBar()]),
    );
  }
}
