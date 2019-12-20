import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/TodoListBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class SecondState implements GlobalBaseState, Cloneable<SecondState> {
  UserPointBean userBean;
  List<TodoCellBean> listForTodoMenu;

  @override
  SecondState clone() {
    return SecondState()
      ..themeColor = themeColor
      ..ifLogin = ifLogin
      ..userBean = userBean
      ..userPoint=userPoint
      ..listForTodoMenu = listForTodoMenu.toList();
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

SecondState initState(Map<String, dynamic> args) {
  return SecondState()..listForTodoMenu = [];
}
