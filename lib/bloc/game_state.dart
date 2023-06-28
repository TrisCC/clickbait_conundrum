part of 'game_bloc.dart';

@immutable
abstract class GameState {
  final List<Level> levels;

  const GameState(this.levels);
}

class GameInitial extends GameState {
  GameInitial() : super([]);
}

class GameLevelSelection extends GameState {
  GameLevelSelection(List<Level> levels) : super(levels);
}

class GameStarted extends GameState {
  final Level level;
  final List<Article> articleList;
  final List<bool> articleIsRealList;

  GameStarted(
      this.level, this.articleList, this.articleIsRealList, List<Level> levels)
      : super(levels);
}
