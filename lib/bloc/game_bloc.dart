import 'package:bloc/bloc.dart';
import 'package:clickbait_conondrum/data/article_repository.dart';
import 'package:clickbait_conondrum/models/models.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ArticleRepository articleRepository;

  GameBloc(this.articleRepository) : super(GameInitial()) {
    on<GameInitialized>((event, emit) async {
      emit(GameLevelSelection(await articleRepository.getLevels()));
    });

    on<GameSelectLevel>((event, emit) async {
      emit(GameStarted(
          event.level,
          await articleRepository.getArticles(event.level),
          const [],
          state.levels));
    });
  }
}
