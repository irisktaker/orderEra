import 'package:flutter/material.dart';

import 'package:orderera_dio_http/bloc/utils/singleton/singleton.dart';
import 'package:orderera_dio_http/ui/views/select_user_type_screen/select_user_type_screen.dart';

class SelectedLanguageBloc {
  void selectedLanguage(BuildContext context, String language) {
    switch (language) {
      case "English":
        Singleton.instance.selectedLanguage = "en";
        break;
      case "العربية":
        Singleton.instance.selectedLanguage = "ar";
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectUserTypeScreen()),
    );
  }
}
