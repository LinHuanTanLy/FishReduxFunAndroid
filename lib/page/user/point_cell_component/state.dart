import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';

class PointCellState implements Cloneable<PointCellState> {
  UserPointCell pointCell;
  @override
  PointCellState clone() {
    return PointCellState()
    ..pointCell=pointCell;
  }
}

PointCellState initState(Map<String, dynamic> args) {
  return PointCellState();
}
