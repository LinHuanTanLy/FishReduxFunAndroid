import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';

class AuthorState implements Cloneable<AuthorState> {
  List<ClassifyData> listForMenu;
  TabController tabController;

  @override
  AuthorState clone() {
    return AuthorState()
      ..listForMenu = listForMenu.toList()
      ..tabController = tabController;
  }
}

AuthorState initState(Map<String, dynamic> args) {
  return AuthorState()..listForMenu = [];
}
