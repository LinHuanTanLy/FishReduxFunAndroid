import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import '../../app.dart';
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

  Widget _renderIndexStack() {
    var indexedStack = IndexedStack(
      index: state.currIndex,
      children: <Widget>[
        AppRoute.global.buildPage('index', null),
        AppRoute.global.buildPage('second', null),
      ],
    );
    IndexedStack _tempIndex = indexedStack;
    return _tempIndex;
    // return Stack(children: <Widget>[
    // Offstage(child: viewService.buildComponent('index'),offstage: state.currIndex!=0,),
    // Offstage(child: viewService.buildComponent('second'),offstage: state.currIndex==0,),

    // ],);
  }

  return Scaffold(
    primary: true,
    body: _renderIndexStack(),
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
