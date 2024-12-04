part of 'theme_bloc.dart';

class ThemeState {
  final ThemeMode themeMode;
  const ThemeState(this.themeMode);
}

class ThemeChangedState extends ThemeState {
  const ThemeChangedState(super.themeMode);
}
