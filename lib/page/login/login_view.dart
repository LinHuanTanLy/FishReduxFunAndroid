import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'login_action.dart';
import 'login_state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染输入框
  Container _renderTextEdit({double topMargin, hintStr, controller}) {
    return Container(
      margin: EdgeInsets.only(
          left: 40, right: 40, top: topMargin ?? 10, bottom: 10),
      decoration: BoxDecoration(
        color: ColorConf.ColorFFFFFF,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorConf.ColorF6f6f6),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0x1E181A2B), offset: Offset(2, 2), blurRadius: 10)
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            border: InputBorder.none,
            hintText: hintStr,
            hintStyle: TextStyle(fontSize: 14, color: ColorConf.Color8048586D)),
      ),
    );
  }

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/author_pic9.jpg'),
                      ),
                      width: 140,
                      height: 140,
                    )
                  ],
                ),
                GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: ColorConf.ColorFFFFFF,
                    size: 40,
                  ),
                  onTap: () {
                    dispatch(LoginActionCreator.onToFinish());
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: ColorConf.Color18C8A1,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80))),
          ),
          _renderTextEdit(
              topMargin: 40,
              hintStr: '请输入您的账号${state.screenW}',
              controller: state.controllerForAccount),
          _renderTextEdit(
              topMargin: 10,
              hintStr: '请输入您的密码${state.ifLogin}',
              controller: state.controllerForPassWord),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(bottom: 6, right: 40),
              alignment: Alignment.centerRight,
              child: Text(
                '尚无账号，点击去注册',
                style: TextStyle(
                    fontSize: 12,
                    color: ColorConf.Color18C8A1,
                    decoration: TextDecoration.underline),
              ),
            ),
            onTap: () {
              dispatch(LoginActionCreator.onToRegister());
            },
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                dispatch(LoginActionCreator.onToLogin());
              },
              child: Text(
                '登录',
                style: TextStyle(fontSize: 15, color: ColorConf.ColorFFFFFF),
              ),
              padding: const EdgeInsets.only(
                  left: 120, right: 120, top: 10, bottom: 10),
              color: ColorConf.Color18C8A1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            margin: const EdgeInsets.only(top: 10),
          )
        ],
      ),
    ),
  );
}
