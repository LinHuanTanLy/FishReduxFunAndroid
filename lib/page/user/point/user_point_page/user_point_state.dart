import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPointState implements GlobalBaseState, Cloneable<UserPointState> {
  List<String> menuList = [];
  UserPointBean userPointBean;
  List<UserPointCell> pointCell;
  RefreshController refreshController;
  int pageNum;
  @override
  UserPointState clone() {
    return UserPointState()
      ..menuList = menuList
      ..userPointBean = userPointBean
      ..pointCell = pointCell
      ..themeColor = themeColor
      ..refreshController = refreshController
      ..pageNum=pageNum;
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

UserPointState initState(Map<String, dynamic> args) {
  return UserPointState()
    ..menuList = ['个人积分，积分排行']
    ..refreshController = RefreshController()
    ..pointCell=[]
    ..pageNum=1;
}

class StateWithTickerProvider extends ComponentState<UserPointState>
    with TickerProviderStateMixin {}
