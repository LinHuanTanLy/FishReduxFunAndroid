import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/widget/KeepAliveWidget.dart';

import '../../app.dart';
import 'main_action.dart';
import 'main_state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染appBar
  AppBar _renderAppBar() {
    return AppBar(
      backgroundColor: state.themeColor,
      centerTitle: true,
      titleSpacing: 60,
      title: TabBar(
        tabs: state.menuList
            .map((e) => Tab(
                  text: e,
                ))
            .toList(),
        labelColor: Colors.white,
        controller: state.tabControllerForMenu,
        labelPadding: const EdgeInsets.all(0),
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        indicatorPadding: const EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.label,
      ),
      leading: Builder(builder: (ctx) {
        return IconButton(
          onPressed: () {
            dispatch(MainActionCreator.onOpenDraw(ctx));
          },
          icon: Image.asset(
            'images/icon_more.png',
            color: Colors.white,
            height: 24,
          ),
        );
      }),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }

  return Scaffold(
    primary: true,
    appBar: _renderAppBar(),
    body: TabBarView(
      controller: state.tabControllerForMenu,
      children: <Widget>[
        KeepAliveWidget(AppRoute.global.buildPage('second', null)),
        KeepAliveWidget(AppRoute.global.buildPage('index', null)),
//        KeepAliveWidget(AppRoute.global.buildPage('login', null)),
      ],
    ),
    drawer: AppRoute.global.buildPage('draw', null),
  );
}
