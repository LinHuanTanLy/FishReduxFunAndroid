import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemChildBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SystemChildState implements GlobalBaseState, Cloneable<SystemChildState> {
  String title;
  int id;
  List<SystemChildCellBean> listForSystemArticle;
  RefreshController refreshController;
  int pageNum;

  @override
  SystemChildState clone() {
    return SystemChildState()
      ..title = title
      ..listForSystemArticle=listForSystemArticle.toList()
      ..id = id
      ..refreshController=refreshController
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

SystemChildState initState(Map<String, dynamic> args) {
  return SystemChildState()
    ..id = args['id']
    ..title = args['name']
    ..refreshController = RefreshController()
    ..pageNum = 0
    ..listForSystemArticle=[];
}
