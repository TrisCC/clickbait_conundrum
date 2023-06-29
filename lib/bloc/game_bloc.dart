import 'package:bloc/bloc.dart';
import 'package:clickbait_conundrum/data/article_repository.dart';
import 'package:clickbait_conundrum/main.dart';
import 'package:clickbait_conundrum/models/models.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ArticleRepository articleRepository;

  Logger logger = ClickbaitConundrum.logger;
  static const String tag = '[GameBloc]';

  GameBloc(this.articleRepository) : super(GameInitial()) {
    on<GameInitialized>((event, emit) async {
      logger.d('$tag Game initialized');
      emit(GameLevelSelection(await articleRepository.getLevels()));
    });

    on<GameSelectLevel>((event, emit) async {
      logger.d('$tag Level selected');
      emit(GameStarted(
          event.level,
          await articleRepository.getArticles(event.level),
          const [],
          state.levels));
    });

    on<GameSwipedArticle>(
      (event, emit) {
        logger.d(
            '$tag Player marked article as ${event.isReal ? "real" : "fake"}');

        GameState currentState = state;
        if (currentState is GameStarted) {
          List<bool> newArticleIsRealList =
              List.from(currentState.articleIsRealList);
          newArticleIsRealList.add(event.isReal);

          emit(GameStarted(currentState.level, currentState.articleList,
              newArticleIsRealList, currentState.levels));
        }
      },
    );
  }
}
