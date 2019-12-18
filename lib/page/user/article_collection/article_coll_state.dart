import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleCollectionState
    implements GlobalBaseState, Cloneable<ArticleCollectionState> {
  RefreshController refreshController;
  int pageNum = 0;
  List<ArticleCollCellBean> listForArticle;

  @override
  ArticleCollectionState clone() {
    return ArticleCollectionState()
      ..refreshController = refreshController
      ..pageNum = pageNum
      ..listForArticle = listForArticle;
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

ArticleCollectionState initState(Map<String, dynamic> args) {
  return ArticleCollectionState()
    ..refreshController = RefreshController()
    ..pageNum = 0
    ..listForArticle = [];
}
