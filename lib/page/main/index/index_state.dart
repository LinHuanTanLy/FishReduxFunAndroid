import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_android_fun/page/main/index/banner_component/banner_state.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  List<Data> dataForBanner;

  @override
  IndexState clone() {
    return IndexState()..dataForBanner = dataForBanner;
  }

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;
}

class BannerConnector extends Reselect1<IndexState, BannerState,List<Data>> {
  @override
  BannerState computed(List<Data> state) {
    return BannerState()..dataForBanner=state;
  }

  @override
  List<Data> getSub0(IndexState state) {
    return state.dataForBanner;
  }

  @override
  void set(IndexState state, BannerState subState) {
    subState.dataForBanner=state.dataForBanner;
  }

}
