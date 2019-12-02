import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'main_action.dart';
import 'main_state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  BottomNavigationBarItem _renderBottomMenuItem(
      String imgStr, String menuStr, int indexFlag) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          imgStr,
          width: state.iconSize,
          color: indexFlag == state.currIndex
              ? ColorConf.Color48586D
              : ColorConf.Color8048586D,
        ),
        title: Text(menuStr));
  }

  return Scaffold(
    primary: true,
//    appBar: AppBar(),
    body: IndexedStack(
      index: state.currIndex,
      children: <Widget>[
        viewService.buildComponent('index'),
        viewService.buildComponent('second'),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 11,
        selectedFontSize: 12,
        currentIndex: state.currIndex,
        unselectedItemColor: ColorConf.Color8048586D,
        selectedItemColor: ColorConf.Color48586D,
        onTap: (index) {
          dispatch(MainActionCreator.onClickTab(index));
        },
        items: <BottomNavigationBarItem>[
          _renderBottomMenuItem('images/icon_index.png', '首页', 0),
          _renderBottomMenuItem('images/icon_second.png', '发现', 1),
        ]),
  );
}
