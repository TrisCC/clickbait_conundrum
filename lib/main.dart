import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:logger/logger.dart';

import 'bloc/game_bloc.dart';
import 'data/article_repository.dart';
import 'models/models.dart';

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
          child: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: _selectedTab,
      onSelectedIndexChange: (int index) {
        setState(() {
          _selectedTab = index;
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.checklist), label: 'Levels'),
        NavigationDestination(icon: Icon(Icons.newspaper), label: 'Detect'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings')
      ],
      body: (context) {
        switch (_selectedTab) {
          case 0:
            return const LevelSelectionTab();
          case 1:
            return const DetectTab();
          case 2:
            return const Text('asdasdasd');
          default:
            return const Text('Something went wrong');
        }
      },
    );
  }
}

class LevelSelectionTab extends StatelessWidget {
  const LevelSelectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GameInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemCount: state.levels.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () => BlocProvider.of<GameBloc>(context).add(
                      GameSelectLevel(GameLevel(state.levels[index].percentage,
                          state.levels[index].levelNumber))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.levels[index].percentage}% fake'),
                      Text(state.levels[index].levelNumber.toString()),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

class DetectTab extends StatelessWidget {
  const DetectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GameInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GameLevelSelection) {
          return const Center(
            child: Text('Select a level in the levels menu'),
          );
        }

        if (state is GameStarted) {
          return Stack(
            children: [
              const Center(
                child: Text('No more articles!'),
              ),
              SafeArea(
                child: CardSwiper(
                    isLoop: false,
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      return Text(state.articleList[index].title);
                    },
                    cardsCount: state.articleList.length),
              )
            ],
          );
        }

        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
