import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class IndexState implements GlobalBaseState, Cloneable<IndexState> {
  List<Data> dataForBanner = [];

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
