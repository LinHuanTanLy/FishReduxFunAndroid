import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';

class HotArticleState implements Cloneable<HotArticleState> {
  List<HotArticleCellBean> hotArticleDataSource;
  List<CommArticleCellBean> commArticleDataSource;
  List<ProjectListCellBean> projectDataSource;
  @override
  HotArticleState clone() {
    return HotArticleState()
      ..hotArticleDataSource = hotArticleDataSource
      ..commArticleDataSource = commArticleDataSource
      ..projectDataSource = projectDataSource;
  }
}


