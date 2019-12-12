import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';

class UserPointState implements Cloneable<UserPointState> {
  List<String> menuList = [];
  TabController tabController;
  UserPointBean userPointBean;
  List<UserPointCell> pointCell;

  @override
  UserPointState clone() {
    return UserPointState()
      ..menuList = menuList
      ..tabController = tabController
      ..userPointBean = userPointBean
      ..pointCell = pointCell;
  }
}

UserPointState initState(Map<String, dynamic> args) {
  return UserPointState()..menuList = ['个人积分，积分排行'];
}

class StateWithTickerProvider extends ComponentState<UserPointState>
    with TickerProviderStateMixin {}
