import 'package:clickbait_conondrum/bloc/game_bloc.dart';
import 'package:clickbait_conondrum/models/article.dart';
import 'package:clickbait_conondrum/ui/full_article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class DetectTab extends StatelessWidget {
  const DetectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                            onPressed: () {},
                            child: const Text('Show answers'),
                          )
                        ],
                      ),
                      SafeArea(
                        child: CardSwiper(
                          isLoop: false,
                          cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) {
                            return ArticleCard(
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

  const ArticleCard({super.key, required this.article});

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
                ElevatedButton(
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
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
