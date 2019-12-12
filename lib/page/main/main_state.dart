import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class MainState implements GlobalBaseState, Cloneable<MainState> {
  double iconSize = 22;
  int currIndex = 0;

  /// 菜单列表
  List<String> menuList;
  TabController tabControllerForMenu;
  @override
  MainState clone() {
    return MainState()
      ..currIndex = currIndex
      ..iconSize = iconSize
      ..ifLogin = ifLogin
      ..menuList = menuList
      ..tabControllerForMenu = tabControllerForMenu;
  }

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  bool ifLogin;

  @override
  int userPoint;
}

MainState initState(Map<String, dynamic> args) {
  return MainState()..menuList = ['我的', '好文', '休闲'];
}
