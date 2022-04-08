// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'select_language_bloc.dart';

class SelectedLanguageScreen extends StatelessWidget {
  SelectedLanguageScreen({Key? key}) : super(key: key);

  final SelectedLanguageBloc _bloc = SelectedLanguageBloc();

  MaterialButton selectLang(BuildContext context, String language) {
    return MaterialButton(
      onPressed: () => _bloc.selectedLanguage(context, language),
      child: Text(
        language,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectLang(context, "English"),
            selectLang(context, "العربية"),
          ],
        ),
      ),
    );
  }
}
