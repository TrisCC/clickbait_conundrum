import 'package:clickbait_conondrum/models/models.dart';
import 'package:clickbait_conondrum/ui/full_article_screen.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final GameLevel gameLevel;
  final List<Article> articleList;
  final List<bool> articleIsRealList;

  const ResultsScreen(
      {super.key,
      required this.articleList,
      required this.articleIsRealList,
      required this.gameLevel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
        ),
        body: Column(
          children: [
            const ListTile(
              leading: Row(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text('Guess'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text('Correct'),
                )
              ]),
              title: Text('Article title'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullArticleScreen(
                                  article: articleList[index])),
                        );
                      },
                      leading: Row(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Icon(
                            articleIsRealList[index]
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: articleIsRealList[index]
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Icon(
                            !articleList[index].isFake
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: !articleList[index].isFake
                                ? Colors.green
                                : Colors.red,
                          ),
                        )
                      ]),
                      title: Text(
                        articleList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
