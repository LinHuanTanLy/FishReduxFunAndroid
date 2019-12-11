import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';

class AuthorArticleState implements Cloneable<AuthorArticleState> {
  int courseId;
  int pageNum;
  List<ArticleCellChildList> listForArticleList;

  @override
  AuthorArticleState clone() {
    return AuthorArticleState()
      ..courseId = courseId
      ..pageNum = pageNum
      ..listForArticleList = listForArticleList.toList();
  }
}

AuthorArticleState initState(Map<String, dynamic> args) {
  return AuthorArticleState()
    ..pageNum = 1
    ..listForArticleList = []
    ..courseId = args['courseId'];
}
