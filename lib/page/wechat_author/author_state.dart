import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class AuthorState implements GlobalBaseState, Cloneable<AuthorState> {
  List<ClassifyData> listForMenu;
  TabController tabController;
  int defIndexId;

  @override
  AuthorState clone() {
    return AuthorState()
      ..listForMenu = listForMenu.toList()
      ..tabController = tabController
      ..defIndexId = defIndexId
      ..themeColor = themeColor;
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

AuthorState initState(Map<String, dynamic> args) {
  return AuthorState()
    ..listForMenu = []
    ..defIndexId = args['id'];
}
