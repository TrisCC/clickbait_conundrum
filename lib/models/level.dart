class GameLevel {
  final int percentage;
  final int levelNumber;

  GameLevel(this.percentage, this.levelNumber)
      : assert(percentage % 10 == 0),
        assert(levelNumber >= 0 && levelNumber <= 12);
}
