import 'package:clickbait_conundrum/models/article.dart';
import 'package:flutter/material.dart';

class FullArticleScreen extends StatelessWidget {
  final Article article;

  const FullArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Full article')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  article.text,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ));
  }
}
