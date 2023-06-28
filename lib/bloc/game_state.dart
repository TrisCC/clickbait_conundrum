part of 'game_bloc.dart';

@immutable
abstract class GameState {
  final List<GameLevel> levels;

  const GameState(this.levels);
}

class GameInitial extends GameState {
  GameInitial() : super([]);
}

class GameLevelSelection extends GameState {
  const GameLevelSelection(List<GameLevel> levels) : super(levels);
}

class GameStarted extends GameState {
  final GameLevel level;
  final List<Article> articleList;
  final List<bool> articleIsRealList;

  const GameStarted(this.level, this.articleList, this.articleIsRealList,
      List<GameLevel> levels)
      : super(levels);
}
