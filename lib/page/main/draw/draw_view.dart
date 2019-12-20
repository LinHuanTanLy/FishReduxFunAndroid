import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'draw_action.dart';
import 'draw_state.dart';

Widget buildView(DrawState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染单个Item
  Widget _renderItem({String iconStr, String titleStr, Function function}) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 16, left: 16),
        child: Row(
          children: <Widget>[
            Image.asset(
              iconStr ?? Icons.accessible_forward,
              width: 24,
              color: ColorConf.Color48586D,
            ),
            Container(
              child: Text(
                titleStr ?? '色彩主题',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              margin: const EdgeInsets.only(left: 8),
            )
          ],
        ),
      ),
      onTap: function,
    );
  }

  return Scaffold(
    primary: true,
    backgroundColor: Colors.transparent,
    body: GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          top: state.screenH * 0.1,
        ),
        color: ColorConf.ColorFFFFFF.withAlpha(240),
        width: state.screenW * 5 / 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _renderItem(
                iconStr: 'images/icon_credits.png',
                titleStr: '查看积分',
                function: () {
                  dispatch(DrawActionCreator.onToSeeCredits());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            _renderItem(
                iconStr: 'images/icon_rank.png',
                titleStr: '查看排名',
                function: () {
                  dispatch(DrawActionCreator.onToSeeRank());
                }),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: Color(0XFFEEEEEE),
              height: 8,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_06.png',
                titleStr: '添加文章分享',
                function: () {
                  dispatch(DrawActionCreator.onToAddArticleShare());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_05.png',
                titleStr: '添加网站分享',
                function: () {
                  dispatch(DrawActionCreator.onToAddWebShare());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_03.png',
                titleStr: '添加Todo',
                function: () {
                  dispatch(DrawActionCreator.onToAddTodo());
                }),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              color: Color(0XFFEEEEEE),
              height: 8,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_02.png',
                titleStr: '修改主题颜色',
                function: () {
                  dispatch(DrawActionCreator.onToChangeThemeColor());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_01.png',
                titleStr: '关于本项目',
                function: () {
                  dispatch(DrawActionCreator.onToSeeAbout());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            _renderItem(
                iconStr: 'images/icon_unknow_06.png',
                titleStr: '编译环境',
                function: () {
                  dispatch(DrawActionCreator.onToSeeEnv());
                }),
            Divider(
              indent: 16,
              endIndent: 16,
            ),
            Expanded(
                child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, bottom: 10, top: 10),
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'images/exit.png',
                      width: 24,
                      color: ColorConf.Color48586D,
                    ),
                    Container(
                      child: Text(
                        '退出登录',
                        style: TextStyle(
                            fontSize: 14, color: ColorConf.Color48586D),
                      ),
                      margin: const EdgeInsets.only(left: 4, right: 4),
                    )
                  ],
                ),
              ),
              onTap: () {
                dispatch(DrawActionCreator.onToLogout());
              },
            ))
          ],
        ),
      ),
    ),
  );
}
