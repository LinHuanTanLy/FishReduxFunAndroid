import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'index_action.dart';
import 'index_state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            titleSpacing: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Container(
              margin: const EdgeInsets.only(left: 14),
              padding:
                  const EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 14),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConf.Colorfcfcfc),
              child: Text(
                '点击进行搜索',
                style: TextStyle(fontSize: 13, color: ColorConf.Color8048586D),
              ),
            ),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: ColorConf.Color48586D,
                  ),
                  label: Text(
                    '搜索',
                    style:
                        TextStyle(fontSize: 13, color: ColorConf.Color48586D),
                  ))
            ],
          ),
          preferredSize: Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: viewService.buildComponent('banner'),
      ));
}
