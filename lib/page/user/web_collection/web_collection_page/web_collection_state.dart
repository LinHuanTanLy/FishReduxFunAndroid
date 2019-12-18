import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WebCollectionState
    implements GlobalBaseState, Cloneable<WebCollectionState> {
  RefreshController refreshController;
  int pageNum;
  List<WebKitCellCollectionBean> listForWebkit;

  @override
  WebCollectionState clone() {
    return WebCollectionState()
      ..refreshController = refreshController
      ..pageNum = pageNum
      ..listForWebkit = listForWebkit.toList()
      ..themeColor = themeColor;
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

WebCollectionState initState(Map<String, dynamic> args) {
  return WebCollectionState()
    ..refreshController = RefreshController()
    ..pageNum = 1
    ..listForWebkit = [];
}
