import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';


class MainState implements GlobalBaseState, Cloneable<MainState> {
  double iconSize = 22;
  int currIndex = 0;

  @override
  MainState clone() {
    return MainState()
      ..currIndex = currIndex
      ..iconSize = iconSize;
  }

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}




