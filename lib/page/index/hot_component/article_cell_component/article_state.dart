import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';

class ArticleCellState implements Cloneable<ArticleCellState> {
  HotArticleCellBean hotArticleCellBean;
  @override
  ArticleCellState clone() {
    return ArticleCellState()..hotArticleCellBean=hotArticleCellBean;
  }
}

ArticleCellState initState(Map<String, dynamic> args) {
  return ArticleCellState();
}
