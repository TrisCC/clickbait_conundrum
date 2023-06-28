import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/models.dart';

class ArticleRepository {
  Future<List<Article>> getArticles(GameLevel selectedLevel) async {
    final rawData = await rootBundle.loadString(
        'assets/level_data/percentage_${selectedLevel.percentage}_level_${selectedLevel.levelNumber.toString().padLeft(2, '0')}.csv');

    List<Article> articles = Article.csvToArticleList(rawData);

    return articles;
  }

  Future<List<GameLevel>> getLevels() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final List<String> files = manifestMap.keys
        .where((String key) => key.contains('level_data/'))
        .where((String key) => key.contains('.csv'))
        .toList();

    List<GameLevel> levels = [];

    for (String filePath in files) {
      final split = filePath.split(RegExp(r'[_.]'));

      levels.add(GameLevel(int.parse(split[split.length - 4]),
          int.parse(split[split.length - 2])));
    }

    return levels;
  }
}
