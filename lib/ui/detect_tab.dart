import 'package:clickbait_conondrum/bloc/game_bloc.dart';
import 'package:clickbait_conondrum/models/article.dart';
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
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const Center(
                      child: Text('No more articles!'),
                    ),
                    SafeArea(
                      child: CardSwiper(
                          isLoop: false,
                          cardBuilder: (context, index, percentThresholdX,
                              percentThresholdY) {
                            return ArticleCard(
                                article: state.articleList[index]);
                          },
                          cardsCount: state.articleList.length),
                    )
                  ],
                ),
              ),
              GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  })
            ],
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
                  onPressed: () {},
                  child: Text("Read full article"),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
