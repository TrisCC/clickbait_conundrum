import 'package:clickbait_conondrum/bloc/game_bloc.dart';
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
          return Stack(
            children: [
              const Center(
                child: Text('No more articles!'),
              ),
              SafeArea(
                child: CardSwiper(
                    isLoop: false,
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      return Text(state.articleList[index].title);
                    },
                    cardsCount: state.articleList.length),
              )
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
