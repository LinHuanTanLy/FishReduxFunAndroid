import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

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
                          Text('总积分为${state?.userPoint}',
                              style: TextStyle(
                                  fontSize: 12, color: ColorConf.Color8048586D))
                        ],
                      ),
                    ),
                    Expanded(
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
                          Text('当前排名${state?.userBean?.data?.rank}',
                              style: TextStyle(
                                  fontSize: 12, color: ColorConf.Color8048586D))
                        ],
                      ),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 20),
              )
            ],
          )
        : Container();
  }

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
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
        )
      ],
    ),
  );
}
