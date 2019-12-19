import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/NaviTreeBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class NaviState implements GlobalBaseState, Cloneable<NaviState> {
  List<NaviCellBean> listForNavi;
  int currIndex;
  @override
  NaviState clone() {
    return NaviState()
      ..listForNavi = listForNavi.toList()
      ..screenH = screenH
      ..screenW = screenW
      ..themeColor=themeColor
      ..currIndex = currIndex;
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

NaviState initState(Map<String, dynamic> args) {
  return NaviState()
    ..listForNavi = []
    ..currIndex = 0;
}
