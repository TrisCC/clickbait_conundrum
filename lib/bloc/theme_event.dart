part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeInitialized extends ThemeEvent {}

class ThemeSelection extends ThemeEvent {
  final ThemeMode themeMode;

  ThemeSelection(this.themeMode);
}
