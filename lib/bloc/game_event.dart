part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameInitialized extends GameEvent {}

class GameSelectLevel extends GameEvent {
  final int selectedPercentage;
  final int selectedLevelNumber;

  GameSelectLevel(this.selectedPercentage, this.selectedLevelNumber);
}
