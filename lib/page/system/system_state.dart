import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemTreeBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class SystemState implements GlobalBaseState, Cloneable<SystemState> {
  List<SystemTreeCellBean> listForSystemTree;

  @override
  SystemState clone() {
    return SystemState()..listForSystemTree = listForSystemTree.toList()
    ..themeColor=themeColor;
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

SystemState initState(Map<String, dynamic> args) {
  return SystemState()..listForSystemTree = [];
}
