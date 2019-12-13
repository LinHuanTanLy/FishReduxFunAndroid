import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/app.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/KeepAliveWidget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ProjectListState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: ColorConf.ColorFFFFFF),
          title: Text(
            '项目列表',
            style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
          ),
          bottom: PreferredSize(
              child: state.projectList.length > 0
                  ? Container(
                      height: 40,
                      child: TabBar(
                          labelColor: ColorConf.ColorFFFFFF,
                          controller: state.tabControllerForMenu,
                          isScrollable: true,
                          tabs: state.projectList
                              .map((e) => Text(e?.name))
                              .toList()),
                    )
                  : Container(),
              preferredSize: Size.fromHeight(40))),
      body: state.projectList.isNotEmpty == true
          ? TabBarView(
              controller: state.tabControllerForMenu,
              children: state.projectList
                  .map((e) => KeepAliveWidget(AppRoute.global
                      .buildPage('project_child_list', {"id": e.id})))
                  .toList(),
            )
          : Container());
}
