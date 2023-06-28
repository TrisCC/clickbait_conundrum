import 'package:clickbait_conondrum/bloc/game_bloc.dart';
import 'package:clickbait_conondrum/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelSelectionTab extends StatelessWidget {
  const LevelSelectionTab({super.key});

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

        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemCount: state.levels.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: InkWell(
                  onTap: () => BlocProvider.of<GameBloc>(context).add(
                      GameSelectLevel(GameLevel(state.levels[index].percentage,
                          state.levels[index].levelNumber))),
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
            });
      },
    );
  }
}
