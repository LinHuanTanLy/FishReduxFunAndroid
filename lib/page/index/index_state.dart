import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_state.dart';
import 'package:flutter_android_fun/page/index/hot_component/hot_state.dart';

import 'banner_component/banner_state.dart';

class IndexState implements Cloneable<IndexState> {
  List<Data> bannerDataSource;
  List<ClassifyData> classifyDataSource;
  List<HotArticleCellBean> hotArticleDataSource;
  List<CommArticleCellBean> commArticleDataSource;

  @override
  IndexState clone() {
    return IndexState()
      ..bannerDataSource = bannerDataSource
      ..classifyDataSource = classifyDataSource
      ..hotArticleDataSource = hotArticleDataSource
      ..commArticleDataSource = commArticleDataSource;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()
    ..bannerDataSource = []
    ..classifyDataSource = []
    ..hotArticleDataSource = []
    ..commArticleDataSource = [];
}

/// 热门置顶文章连接器
class HotArticleConnector extends Reselect2<IndexState, HotArticleState,
    List<HotArticleCellBean>, List<CommArticleCellBean>> {
  @override
  HotArticleState computed(
      List<HotArticleCellBean> sub0, List<CommArticleCellBean> sub1) {
    return HotArticleState()
      ..hotArticleDataSource = sub0
      ..commArticleDataSource = sub1;
  }

  @override
  List<HotArticleCellBean> getSub0(IndexState state) {
    return state.hotArticleDataSource;
  }

  @override
  List<CommArticleCellBean> getSub1(IndexState state) {
    return state.commArticleDataSource;
  }

  @override
  void set(IndexState state, HotArticleState subState) {
    subState..commArticleDataSource = state.commArticleDataSource;
    subState..hotArticleDataSource = state.hotArticleDataSource;
  }
//  @override
//  HotArticleState computed(List<HotArticleCellBean> state) {
//    return HotArticleState()..hotArticleDataSource = state;
//  }
//
//  @override
//  List<HotArticleCellBean> getSub0(IndexState state) {
//    return state.hotArticleDataSource;
//  }
//
//  @override
//  void set(IndexState state, HotArticleState subState) {
//    subState.hotArticleDataSource = state.hotArticleDataSource;
//  }
}

/// banner模块的连接器
class BannerConnector extends Reselect1<IndexState, BannerState, List<Data>> {
  @override
  BannerState computed(List<Data> state) {
    return BannerState()..bannerDataSource = state;
  }

  @override
  List<Data> getSub0(IndexState state) {
    return state.bannerDataSource;
  }

  @override
  void set(IndexState state, BannerState subState) {
    subState.bannerDataSource = state.bannerDataSource;
  }
}

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
