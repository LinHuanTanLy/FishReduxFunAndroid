import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemChildBean.dart';

class SystemChildCellState implements Cloneable<SystemChildCellState> {
  SystemChildCellBean systemChildCellBean;
  @override
  SystemChildCellState clone() {
    return SystemChildCellState()..systemChildCellBean = systemChildCellBean;
  }
}

SystemChildCellState initState(Map<String, dynamic> args) {
  return SystemChildCellState();
}
