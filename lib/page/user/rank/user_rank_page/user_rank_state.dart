import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserRankBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserRankState implements GlobalBaseState, Cloneable<UserRankState> {
  List<UserCellRankBean> listForRank;

  int pageNum;

  RefreshController refreshController;

  @override
  UserRankState clone() {
    return UserRankState()
      ..pageNum = pageNum
      ..listForRank = listForRank
      ..refreshController = refreshController
    ..themeColor=themeColor;
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

UserRankState initState(Map<String, dynamic> args) {
  return UserRankState()
    ..pageNum = 1
    ..listForRank = []
    ..refreshController = RefreshController();
}
