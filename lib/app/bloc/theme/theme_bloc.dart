import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeChangedState(ThemeMode.light)) {
    on<ToggleTheme>((event, emit) {
      emit(ThemeChangedState(
          event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
    });
  }
}
