import 'package:clickbait_conundrum/ui/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/game_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'data/article_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const ClickbaitConundrum());
}

class ClickbaitConundrum extends StatelessWidget {
  const ClickbaitConundrum({super.key});

  static Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Clickbait Conundrum',
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
            themeMode: state.themeMode,
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
        },
      ),
    );
  }
}
