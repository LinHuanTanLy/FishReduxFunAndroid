import 'package:fish_redux/fish_redux.dart';
import 'dart:ui';
import 'package:flutter/material.dart' hide Action;
import 'global_action.dart';
import 'global_state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.updateGlobalH: _onUpdateGlobalH,
      GlobalAction.updateGlobalW: _onUpdateGlobalW,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue
];

GlobalState _onUpdateGlobalW(GlobalState state, Action action) {
  debugPrint('修改系统宽度');
  final double w = action.payload;
  debugPrint('修改系统宽度---$w');
  return state.clone()..screenW = w;
}

GlobalState _onUpdateGlobalH(GlobalState state, Action action) {
  debugPrint('修改系统高度');
  final double h = action.payload;
  debugPrint('修改系统高度---$h');
  return state.clone()..screenH = h;
}

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  debugPrint('修改系统配色');
  final Color next =
      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  debugPrint('修改系统配色---$next');
  return state.clone()..themeColor = next;
}
