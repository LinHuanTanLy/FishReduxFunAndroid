import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class UserPointState implements Cloneable<UserPointState> {
  List<String> menuList = [];
  TabController tabController;

  @override
  UserPointState clone() {
    return UserPointState()
      ..menuList = menuList
      ..tabController = tabController;
  }
}

UserPointState initState(Map<String, dynamic> args) {
  return UserPointState()..menuList = ['个人积分，积分排行'];
}

class StateWithTickerProvider extends ComponentState<UserPointState>
    with TickerProviderStateMixin {}
