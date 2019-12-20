import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class ThemeChangeState implements GlobalBaseState, Cloneable<ThemeChangeState> {
  List<Color> colorList;
  int maxRowItem;

  @override
  ThemeChangeState clone() {
    return ThemeChangeState()
      ..themeColor = themeColor
      ..colorList = colorList.toList()
      ..maxRowItem = maxRowItem
      ..screenW = screenW;
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

ThemeChangeState initState(Map<String, dynamic> args) {
  return ThemeChangeState()
    ..colorList = ColorConf.ColorList
    ..maxRowItem = 7;
}
