import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AuthorArticleState implements Cloneable<AuthorArticleState> {
  int courseId;
  int pageNum;
  List<ArticleCellChildList> listForArticleList;
  RefreshController mRefreshController;
  @override
  AuthorArticleState clone() {
    return AuthorArticleState()
      ..courseId = courseId
      ..mRefreshController = mRefreshController
      ..pageNum = pageNum
      ..listForArticleList = listForArticleList.toList();
  }
}

AuthorArticleState initState(Map<String, dynamic> args) {
  return AuthorArticleState()
    ..pageNum = 1
    ..mRefreshController = RefreshController()
    ..listForArticleList = []
    ..courseId = args['courseId'];
}
