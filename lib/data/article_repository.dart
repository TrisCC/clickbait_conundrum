import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    final rawData = await rootBundle.loadString('assets/WELFake_Dataset.csv');

    List<Article> articles = Article.csvToArticleList(rawData);


    return [articles.first];
  }
}