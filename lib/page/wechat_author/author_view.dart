import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import '../../app.dart';
import 'author_action.dart';
import 'author_state.dart';

Widget buildView(
    AuthorState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConf.ColorFFFFFF),
        title: Text(
          '微信公众号列表',
          style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
        ),
        bottom: PreferredSize(
            child: state.listForMenu.length > 0
                ? TabBar(
                    labelColor: ColorConf.ColorFFFFFF,
                    controller: state.tabController,
                    isScrollable: true,
                    tabs: state.listForMenu.map((e) => Text(e?.name)).toList())
                : Container(),
            preferredSize: Size.fromHeight(41))),
    body: state.listForMenu.length > 0
        ? TabBarView(
            controller: state.tabController,
            children: state.listForMenu
                .map(
                  (e) => AppRoute.global.buildPage(
                      'wechat_author_article', {'courseId': e.id}),
                )
                .toList())
        : Container(),
  );
}
