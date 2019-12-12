import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  double get screenW;

  double get screenH;

  bool get ifLogin;

  int get userPoint;

  set themeColor(Color color);

  set userPoint(int point);

  set screenW(double d);

  set screenH(double d);

  set ifLogin(bool ifLogin);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;
  @override
  double screenW;
  @override
  double screenH;
  @override
  bool ifLogin;
  @override
  int userPoint;
  @override
  GlobalState clone() {
    return GlobalState()
      ..themeColor = themeColor
      ..screenW = screenW
      ..screenH = screenH
      ..ifLogin = ifLogin
      ..userPoint = userPoint;
  }


}
