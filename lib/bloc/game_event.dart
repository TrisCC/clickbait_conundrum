part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameInitialized extends GameEvent {}

class GameSelectLevel extends GameEvent {
  final GameLevel level;

  GameSelectLevel(this.level);
}

class GameSwipedArticle extends GameEvent {
  final bool isReal;

  GameSwipedArticle(this.isReal);
}
