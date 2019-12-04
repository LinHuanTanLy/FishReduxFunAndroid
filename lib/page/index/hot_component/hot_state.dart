import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';

class HotArticleState implements Cloneable<HotArticleState> {
  List<HotArticleCellBean> hotArticleDataSource;
  List<CommArticleCellBean> commArticleDataSource;
  @override
  HotArticleState clone() {
    return HotArticleState()..hotArticleDataSource = hotArticleDataSource
    ..commArticleDataSource=commArticleDataSource;
  }
}

HotArticleState initState(Map<String, dynamic> args) {
  return HotArticleState();
}
