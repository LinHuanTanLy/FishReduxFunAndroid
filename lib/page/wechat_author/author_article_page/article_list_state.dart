import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AuthorArticleState implements GlobalBaseState, Cloneable<AuthorArticleState> {
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

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  int userPoint;
}

AuthorArticleState initState(Map<String, dynamic> args) {
  return AuthorArticleState()
    ..pageNum = 1
    ..mRefreshController = RefreshController()
    ..listForArticleList = []
    ..courseId = args['courseId'];
}
