import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_state.dart';

import 'banner_component/banner_state.dart';

class IndexState implements Cloneable<IndexState> {
  List<Data> bannerDataSource;
  List<ClassifyData> dartForClassify;
  @override
  IndexState clone() {
    return IndexState()
      ..bannerDataSource = bannerDataSource
      ..dartForClassify = dartForClassify;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()
    ..bannerDataSource = []
    ..dartForClassify = [];
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
    return state.dartForClassify;
  }

  @override
  void set(IndexState state, ClassifyState subState) {
    subState..dataForClassify = state.dartForClassify;
  }
}
