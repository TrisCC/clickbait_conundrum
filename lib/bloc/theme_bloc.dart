import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ThemeInitialized>((event, emit) {
      emit(const ThemeInitial());
    });

    on<ThemeSelection>((event, emit) {
      emit(ThemeSelected(event.themeMode));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    dynamic theme = json['themeMode'];

    switch (theme) {
      case 'dark':
        return const ThemeSelected(ThemeMode.dark);
      case 'light':
        return const ThemeSelected(ThemeMode.light);
      case 'system':
        return const ThemeSelected(ThemeMode.system);
      default:
        return const ThemeSelected(ThemeMode.system);
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    String themeString = 'system';

    switch (state.themeMode) {
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.system:
        themeString = 'system';
        break;
    }

    return {'themeMode': themeString};
  }
}
