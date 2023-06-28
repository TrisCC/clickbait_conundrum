part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameInitialized extends GameEvent {}

class GameSelectLevel extends GameEvent {
  final Level level;

  GameSelectLevel(this.level);
}
