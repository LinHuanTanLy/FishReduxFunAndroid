import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/domain/entity/SystemTreeBean.dart';

class SystemCellState implements Cloneable<SystemCellState> {
  SystemTreeCellBean systemTreeCellBean;
  Color color;

  @override
  SystemCellState clone() {
    return SystemCellState()
      ..systemTreeCellBean = systemTreeCellBean
      ..color = color;
  }
}

SystemCellState initState(Map<String, dynamic> args) {
  return SystemCellState();
}
