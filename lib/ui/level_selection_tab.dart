import 'package:clickbait_conundrum/bloc/game_bloc.dart';
import 'package:clickbait_conundrum/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelSelectionTab extends StatelessWidget {
  final void Function() onSelectLevel;

  const LevelSelectionTab({super.key, required this.onSelectLevel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Level selection',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 256),
                    itemCount: state.levels.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            BlocProvider.of<GameBloc>(context).add(
                                GameSelectLevel(GameLevel(
                                    state.levels[index].percentage,
                                    state.levels[index].levelNumber)));
                            onSelectLevel();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${state.levels[index].percentage}% fake'),
                              Text(
                                  'Level ${state.levels[index].levelNumber.toString()}'),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
