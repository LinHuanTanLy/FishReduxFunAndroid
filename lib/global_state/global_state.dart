import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  double get screenW;

  double get screenH;

  set themeColor(Color color);

  set screenW(double d);

  set screenH(double d);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;
  @override
  double screenW;
  @override
  double screenH;

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..screenW = screenW
      ..screenH = screenH;
  }
}
