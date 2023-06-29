part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(ThemeMode.system);
}

class ThemeSelected extends ThemeState {
  const ThemeSelected(ThemeMode themeMode) : super(themeMode);
}
