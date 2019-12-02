import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

import 'index/index_state.dart';
import 'second/state.dart';

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

class IndexConnector extends ConnOp<MainState, IndexState>
    with ReselectMixin<MainState, IndexState> {
  @override
  void set(MainState state, IndexState subState) {}

  @override
  IndexState computed(MainState state) {
    return IndexState();
  }

  @override
  List factors(MainState state) {
    return [state.currIndex];
  }
}

class SecondConnector extends ConnOp<MainState, SecondState>
    with ReselectMixin<MainState, SecondState> {
  @override
  SecondState computed(MainState state) {
    return SecondState();
  }

  @override
  List factors(MainState state) {
    return [state.currIndex];
  }
}
