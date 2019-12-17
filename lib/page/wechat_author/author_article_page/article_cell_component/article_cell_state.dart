import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';

class ArticleAuthorCellState implements Cloneable<ArticleAuthorCellState> {
  ArticleCellChildList articleCellChildList;

  @override
  ArticleAuthorCellState clone() {
    return ArticleAuthorCellState()..articleCellChildList = articleCellChildList;
  }
}

ArticleAuthorCellState initState(Map<String, dynamic> args) {
  return ArticleAuthorCellState();
}
