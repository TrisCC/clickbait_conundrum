import 'package:clickbait_conondrum/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage('assets/images/Tin Star Logo.png'),
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.palette),
          title: const Text('Theme'),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ListTile(
                            title: const Text('Light'),
                            trailing: Radio(
                              groupValue: state.themeMode,
                              onChanged: (ThemeMode? value) {},
                              value: ThemeMode.light,
                            ),
                            onTap: () => BlocProvider.of<ThemeBloc>(context)
                                .add(ThemeSelection(ThemeMode.light)),
                          ),
                          ListTile(
                            title: const Text('Dark'),
                            trailing: Radio(
                              groupValue: state.themeMode,
                              onChanged: (ThemeMode? value) {},
                              value: ThemeMode.dark,
                            ),
                            onTap: () {
                              BlocProvider.of<ThemeBloc>(context)
                                  .add(ThemeSelection(ThemeMode.dark));
                            },
                          ),
                          ListTile(
                            title: const Text('System'),
                            trailing: Radio(
                              groupValue: state.themeMode,
                              onChanged: (ThemeMode? value) {},
                              value: ThemeMode.system,
                            ),
                            onTap: () {
                              BlocProvider.of<ThemeBloc>(context)
                                  .add(ThemeSelection(ThemeMode.system));
                            },
                          )
                        ],
                      );
                    },
                  );
                });
          },
        )
      ],
    );
  }
}
