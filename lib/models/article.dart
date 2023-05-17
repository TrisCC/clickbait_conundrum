import 'dart:io';

class Article {
  final int id;
  final String title;
  final String? text;
  final String? source;
  final String? url;
  final String? imageUrl;
  final bool isFake;

  Article(this.id, this.title, this.text, this.source, this.url, this.imageUrl, this.isFake);

  static List<Article> csvToArticleList(String data) {
    List<Article> articles = [];

    List<String> articleStrings = data.split('\n');

    for (int i = 1; i < articleStrings.length; i++) {
      List<String> article = articleStrings[i].split(',');

      // TODO: Look at data format
      // articles.add(new Article(user[0].trim(), user[1].trim(), user[2].trim()));
    }

    return articles;
  }
}