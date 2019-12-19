import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/page/second/second_action.dart';

import 'second_state.dart';

Widget buildView(
    SecondState state, Dispatch dispatch, ViewService viewService) {
  /// 用户信息
  Widget _initUserInfoWidget() {
    return state.ifLogin
        ? Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: state.themeColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('images/author_pic9.jpg'))),
                    width: 50,
                    height: 50,
                  ),
                  Text(state.userBean?.data?.username ?? '',
                      style: TextStyle(
                          fontSize: 18, color: ColorConf.Color48586D)),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('images/icon_credits.png', width: 20),
                              Container(
                                child: Text(
                                  '我的积分',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorConf.Color48586D),
                                ),
                                margin: const EdgeInsets.only(left: 10),
                              )
                            ],
                          ),
                          Container(
                              child: Text('总积分为${state?.userPoint}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorConf.Color8048586D)),
                              margin: const EdgeInsets.only(top: 4))
                        ],
                      ),
                      onTap: () {
                        dispatch(SecondActionCreator.onToSeeCredits());
                      },
                    )),
                    Expanded(
                        child: GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('images/icon_rank.png', width: 20),
                              Container(
                                child: Text(
                                  '我的排名',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: ColorConf.Color48586D),
                                ),
                                margin: const EdgeInsets.only(left: 10),
                              )
                            ],
                          ),
                          Container(
                            child: Text('当前排名${state?.userBean?.data?.rank}',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorConf.Color8048586D)),
                            margin: const EdgeInsets.only(top: 4),
                          )
                        ],
                      ),
                      onTap: () {
                        dispatch(SecondActionCreator.onToSeeRank());
                      },
                    )),
                  ],
                ),
                margin: const EdgeInsets.only(top: 20),
              )
            ],
          )
        : Container();
  }

  /// 渲染子分页item
  Widget _initTopMenuItem({String iconStr, String str, Function function}) {
    return Column(
      children: <Widget>[
        Image.asset(
          iconStr ?? 'images/icon_second.png',
          color: state.themeColor,
          width: 34,
          height: 34,
        ),
        Container(
          child: Text(str ?? '我的收藏',
              style: TextStyle(fontSize: 12, color: Colors.black)),
          margin: const EdgeInsets.only(top: 4),
        )
      ],
    );
  }

  /// 中部分类item
  Widget _initClassifyItem(String iconStr, String titleStr) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Image.asset(
          iconStr ?? 'images/icon_second.png',
          color: ColorConf.Color8048586D,
          width: 24,
        ),
        Container(
          child: Text(
            titleStr ?? '吃枣药丸',
            style: TextStyle(fontSize: 8, color: ColorConf.Color8048586D),
          ),
          margin: const EdgeInsets.only(top: 4),
        )
      ],
    ));
  }

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          margin:
              const EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0x33181A2B),
                    offset: Offset(2, 2),
                    blurRadius: 16)
              ]),
          child: _initUserInfoWidget(),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: _initTopMenuItem(
                      iconStr: 'images/icon_flower.png',
                      str: '收藏网址',
                      function: () {}),
                  onTap: () {
                    dispatch(SecondActionCreator.onToSeeCollection());
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: _initTopMenuItem(
                      iconStr: 'images/icon_history.png',
                      str: '收藏文章',
                      function: () {}),
                  onTap: () {
                    dispatch(SecondActionCreator.onToArticleCollection());
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: _initTopMenuItem(
                      iconStr: 'images/icon_index.png',
                      str: '我的分享',
                      function: () {}),
                  onTap: () {
                    dispatch(SecondActionCreator.onToSeeShare());
                  },
                ),
              )
            ],
          ),
          margin: const EdgeInsets.only(top: 10),
        ),
        Divider(
          color: state.themeColor.withAlpha(100),
          height: 32,
        ),
        Row(
          children: <Widget>[
            _initClassifyItem('images/icon_girl.png', '体系'),
            _initClassifyItem('images/icon_second.png', '吃枣药丸'),
            _initClassifyItem('images/icon_enjoy.png', '放松放松'),
            _initClassifyItem('images/icon_boy.png', '导航'),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          height: 8,
          color: ColorConf.ColorF6f6f6,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.keyboard_arrow_down),
              Text(
                '自建Todo',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
