part of 'language_bloc.dart';

sealed class LanguageState {
  final Locale locale;
  final bool isRTL;
  const LanguageState(this.locale, [this.isRTL = false]);
}

class LanguageChangedState extends LanguageState {
  const LanguageChangedState(super.locale, super.isRTL);
}
