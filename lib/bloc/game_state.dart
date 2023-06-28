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
  final int selectedPercentage;
  final int selectedLevelNumber;
  final List<Article> articleList;
  final List<bool> articleIsReal;

  GameStarted(this.selectedPercentage, this.selectedLevelNumber,
      this.articleList, this.articleIsReal, List<Level> levels)
      : super(levels);
}
