import 'package:fish_redux/fish_redux.dart';
import 'dart:ui';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/utils/SpUtils.dart';
import 'global_action.dart';
import 'global_state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.updateGlobalH: _onUpdateGlobalH,
      GlobalAction.updateGlobalW: _onUpdateGlobalW,
      GlobalAction.updateLoginStatus: _onUpdateLoginStatus,
      GlobalAction.updateUserPoint: _onUpdateGlobalPoint,
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

GlobalState _onUpdateLoginStatus(GlobalState state, Action action) {
  debugPrint('修改用户登录状态');
  final ifLogin = action.payload;
  debugPrint('修改用户登录状态 ifLogin =$ifLogin');
  if (state.themeColor == null) {
    return state
      ..ifLogin = ifLogin
      ..themeColor = Color(0xffE81F63);
  } else {
    return state..ifLogin = ifLogin;
  }
}

GlobalState _onUpdateGlobalH(GlobalState state, Action action) {
  debugPrint('修改系统高度');
  final double h = action.payload;
  debugPrint('修改系统高度---$h');
  return state.clone()..screenH = h;
}

GlobalState _onUpdateGlobalPoint(GlobalState state, Action action) {
  debugPrint('修改用户积分');
  final int point = action.payload;
  debugPrint('修改用户积分----$point');
  return state.clone()..userPoint = point;
}

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  debugPrint('修改系统配色');
  final int next = action.payload;
  SpUtils.putInt('themeColor', next);
  debugPrint('修改系统配色---$next');
  debugPrint('ColorConf.ColorList---${ColorConf.ColorList}');
  return state.clone()..themeColor = ColorConf.ColorList[next];
}
