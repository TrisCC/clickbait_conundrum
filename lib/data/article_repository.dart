import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

import '../models/models.dart';

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    final rawData = await rootBundle.loadString('assets/WELFake_Dataset.csv');

    List<Article> articles = Article.csvToArticleList(rawData);

    return [articles.first];
  }

  Future<List<Level>> getLevels() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final files = manifestMap.keys
        .where((String key) => key.contains('level_data/'))
        .where((String key) => key.contains('.csv'))
        .toList();

    print(files);

    return [Level(10, 1)];
  }
}
