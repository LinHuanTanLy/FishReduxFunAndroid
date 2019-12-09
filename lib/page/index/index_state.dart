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

  @override
  IndexState clone() {
    return IndexState()
      ..bannerDataSource = bannerDataSource
      ..classifyDataSource = classifyDataSource
      ..hotArticleDataSource = hotArticleDataSource
      ..commArticleDataSource = commArticleDataSource
      ..projectListDataSource = projectListDataSource
      ..screenH = screenH
      ..screenW = screenW;
  }

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()
    ..bannerDataSource = []
    ..classifyDataSource = []
    ..hotArticleDataSource = []
    ..commArticleDataSource = []
    ..projectListDataSource = [];
}

class HotArticleConnector extends Reselect4<
    IndexState,
    HotArticleState,
    List<HotArticleCellBean>,
    List<CommArticleCellBean>,
    List<ProjectListCellBean>,
    Size> {
  @override
  HotArticleState computed(
      List<HotArticleCellBean> sub0,
      List<CommArticleCellBean> sub1,
      List<ProjectListCellBean> sub2,
      Size sub3) {
    return HotArticleState()
      ..hotArticleDataSource = sub0
      ..commArticleDataSource = sub1
      ..projectDataSource = sub2
      ..size = sub3;
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
  List<ProjectListCellBean> getSub2(IndexState state) {
    return state.projectListDataSource;
  }

  @override
  Size getSub3(IndexState state) {
    return Size(state.screenW, state.screenH);
  }

  @override
  void set(IndexState state, HotArticleState subState) {
    subState..commArticleDataSource = state.commArticleDataSource;
    subState..hotArticleDataSource = state.hotArticleDataSource;
    subState..projectDataSource = state.projectListDataSource;
    subState..size = Size(state.screenW, state.screenH);
  }
}
// /// 热门置顶文章连接器
// class HotArticleConnector extends Reselect3<
//     IndexState,
//     HotArticleState,
//     List<HotArticleCellBean>,
//     List<CommArticleCellBean>,
//     List<ProjectListCellBean>> {
//   @override
//   HotArticleState computed(List<HotArticleCellBean> sub0,
//       List<CommArticleCellBean> sub1, List<ProjectListCellBean> sub2) {
//     return HotArticleState()
//       ..hotArticleDataSource = sub0
//       ..commArticleDataSource = sub1
//       ..projectDataSource = sub2;
//   }

//   @override
//   List<HotArticleCellBean> getSub0(IndexState state) {
//     return state.hotArticleDataSource;
//   }

//   @override
//   List<CommArticleCellBean> getSub1(IndexState state) {
//     return state.commArticleDataSource;
//   }

//   @override
//   List<ProjectListCellBean> getSub2(IndexState state) {
//     return state.projectListDataSource;
//   }

//   @override
//   void set(IndexState state, HotArticleState subState) {
//     subState..commArticleDataSource = state.commArticleDataSource;
//     subState..hotArticleDataSource = state.hotArticleDataSource;
//     subState..projectDataSource = state.projectListDataSource;
//   }
// }

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
