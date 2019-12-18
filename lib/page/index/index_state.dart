import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_state.dart';
import 'package:flutter_android_fun/page/index/hot_component/hot_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'banner_component/banner_state.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  /// banner
  List<Data> bannerDataSource;

  /// 微信公众号分类
  List<ClassifyData> classifyDataSource;

  /// 置顶热门文章
  List<HotArticleCellBean> hotArticleDataSource;

  /// 首页文章
  List<CommArticleCellBean> commArticleDataSource;

  /// 首页项目
  List<ProjectListCellBean> projectListDataSource;

  /// 刷新控器器
  RefreshController mRefreshController;

  /// 页面下标
  int mPageSize;

  @override
  IndexState clone() {
    return IndexState()
      ..mRefreshController = mRefreshController
      ..bannerDataSource = bannerDataSource
      ..classifyDataSource = classifyDataSource
      ..hotArticleDataSource = hotArticleDataSource
      ..commArticleDataSource = commArticleDataSource
      ..projectListDataSource = projectListDataSource
      ..mPageSize = mPageSize
      ..ifLogin = ifLogin
      ..userPoint = userPoint;
  }

  @override
  Color themeColor;

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  int userPoint;
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()
    ..bannerDataSource = []
    ..classifyDataSource = []
    ..hotArticleDataSource = []
    ..commArticleDataSource = []
    ..projectListDataSource = []
    ..mPageSize=1
    ..mRefreshController = RefreshController();
}

class HotArticleConnector extends ConnOp<IndexState, HotArticleState> {
  @override
  HotArticleState get(IndexState state) {
    return HotArticleState()
      ..hotArticleDataSource = state.hotArticleDataSource.toList()
      ..commArticleDataSource = state.commArticleDataSource.toList()
      ..projectDataSource = state.projectListDataSource.toList()
      ..size = Size(state.screenW, state.screenH);
  }

  @override
  void set(IndexState state, HotArticleState subState) {
    super.set(state, subState);
  }
}

///// banner模块的连接器
class BannerConnector extends ConnOp<IndexState, BannerState>
    with ReselectMixin<IndexState, BannerState> {
  @override
  BannerState computed(IndexState state) {
    return BannerState()
      ..bannerDataSource = state.bannerDataSource
      ..loginStatus = state.ifLogin
      ..userPoint = state.userPoint;
  }

  @override
  List factors(IndexState state) {
    return [state.bannerDataSource, state.ifLogin, state.userPoint];
  }
}
///// banner模块的连接器
//class BannerConnector extends Reselect1<IndexState, BannerState, List<Data>> {
//  @override
//  BannerState computed(List<Data> state) {
//    return BannerState()..bannerDataSource = state;
//  }
//
//  @override
//  List<Data> getSub0(IndexState state) {
//    return state.bannerDataSource;
//  }
//
//  @override
//  void set(IndexState state, BannerState subState) {
//    subState.bannerDataSource = state.bannerDataSource;
//  }
//}

/// classify模块的连接器
class ClassifyConnector
    extends Reselect1<IndexState, ClassifyState, List<ClassifyData>> {
  @override
  ClassifyState computed(List<ClassifyData> state) {
    return ClassifyState()..dataForClassify = state;
  }

  @override
  List<ClassifyData> getSub0(IndexState state) {
    return state.classifyDataSource;
  }

  @override
  void set(IndexState state, ClassifyState subState) {
    subState..dataForClassify = state.classifyDataSource;
  }
}
