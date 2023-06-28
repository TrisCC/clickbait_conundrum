import 'package:clickbait_conondrum/ui/about_tab.dart';
import 'package:clickbait_conondrum/ui/detect_tab.dart';
import 'package:clickbait_conondrum/ui/level_selection_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'bloc/game_bloc.dart';
import 'data/article_repository.dart';

void main() {
  runApp(const ClickbaitConondrum());
}

class ClickbaitConondrum extends StatelessWidget {
  const ClickbaitConondrum({super.key});

  static Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: RepositoryProvider(
        create: (context) => ArticleRepository(),
        child: BlocProvider(
          create: (context) =>
              GameBloc(RepositoryProvider.of<ArticleRepository>(context))
                ..add(GameInitialized()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
