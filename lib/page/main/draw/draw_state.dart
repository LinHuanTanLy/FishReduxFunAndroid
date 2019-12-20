import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class DrawState implements  GlobalBaseState,Cloneable<DrawState> {

  @override
  DrawState clone() {
    return DrawState()
    ..screenW=screenW
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

DrawState initState(Map<String, dynamic> args) {
  return DrawState();
}
