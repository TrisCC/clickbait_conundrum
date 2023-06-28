import 'package:clickbait_conondrum/bloc/game_bloc.dart';
import 'package:clickbait_conondrum/models/article.dart';
import 'package:clickbait_conondrum/ui/full_article_screen.dart';
import 'package:clickbait_conondrum/ui/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class DetectTab extends StatelessWidget {
  final CardSwiperController cardSwiperController = CardSwiperController();

  DetectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
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
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Level: ${state.level.levelNumber}',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                          'Percentage of fake news: ${state.level.percentage}%',
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
                GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10),
                    itemCount: state.articleList.length,
                    itemBuilder: (context, index) {
                      if (index > state.articleIsRealList.length - 1) {
                        return const Center(
                          child: Icon(
                            Icons.help,
                            color: Colors.grey,
                          ),
                        );
                      } else {
                        return Center(
                          child: Icon(
                            state.articleIsRealList[index]
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: state.articleIsRealList[index]
                                ? Colors.green
                                : Colors.red,
                          ),
                        );
                      }
                    }),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text('Did you guess correctly?'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultsScreen(
                                          gameLevel: state.level,
                                          articleIsRealList:
                                              state.articleIsRealList,
                                          articleList: state.articleList,
                                        )),
                              );
                            },
                            child: const Text('Show answers'),
                          )
                        ],
                      ),
                      SafeArea(
                        child: CardSwiper(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          numberOfCardsDisplayed: 3,
                          initialIndex: state.articleIsRealList.length <
                                  state.articleList.length
                              ? state.articleIsRealList.length
                              : state.articleIsRealList.length - 1,
                          controller: cardSwiperController,
                          isLoop: false,
                          cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) {
                            return ArticleCard(
                                cardSwiperController: cardSwiperController,
                                article: state.articleList[index]);
                          },
                          cardsCount: state.articleList.length,
                          allowedSwipeDirection:
                              AllowedSwipeDirection.symmetric(horizontal: true),
                          onSwipe: (previousIndex, currentIndex, direction) {
                            if (direction == CardSwiperDirection.left) {
                              BlocProvider.of<GameBloc>(context)
                                  .add(GameSwipedArticle(false));
                            } else if (direction == CardSwiperDirection.right) {
                              BlocProvider.of<GameBloc>(context)
                                  .add(GameSwipedArticle(true));
                            }

                            return true;
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }

        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Article article;
  final CardSwiperController cardSwiperController;

  const ArticleCard(
      {super.key, required this.article, required this.cardSwiperController});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Text(
                  article.text,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                        onPressed: () => cardSwiperController.swipeLeft(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text(
                          'Fake',
                          style: TextStyle(color: Colors.white),
                        )),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FullArticleScreen(article: article)),
                          );
                        },
                        child: const Text('Read full article'),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => cardSwiperController.swipeRight(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          'Real',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
