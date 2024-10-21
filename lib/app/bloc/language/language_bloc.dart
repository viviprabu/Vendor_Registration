import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final locales = const <String, Locale>{
    "Arabic": Locale('ar', 'KW'), // Arabic, Kuwait
    "English": Locale('en', 'US'), // English, United States
  };

  LanguageBloc()
      : super(const LanguageChangedState(Locale('en', 'US'), false)) {
    on<ChangeLanguage>(
      (event, emit) {
        if (event.locale.languageCode == 'ar') {
          emit(LanguageChangedState(event.locale, true));
        } else {
          emit(LanguageChangedState(event.locale, false));
        }
      },
    );
  }
}
