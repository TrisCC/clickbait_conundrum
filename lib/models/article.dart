import 'package:csv/csv.dart';

class Article {
  final int id;
  final String title;
  final String text;
  final String? source;
  final String? url;
  final String? imageUrl;
  final bool isFake;

  Article(this.id, this.title, this.text, this.source, this.url, this.imageUrl,
      this.isFake);

  static List<Article> csvToArticleList(String data) {
    // CSVs are in the following format: index,title,text,label
    List<List<dynamic>> rawList = const CsvToListConverter().convert(data);

    List<Article> articles = [];

    for (int i = 1; i < rawList.length - 1; i++) {
      articles.add(Article(rawList[i][0], rawList[i][1], rawList[i][2], null,
          null, null, rawList[i][3] == 0));
    }

    return articles;
  }
}
