import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'register_action.dart';
import 'register_state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染输入框
  Container _renderTextEdit(
      {double topMargin, hintStr, controller, obscureText}) {
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
        obscureText: obscureText??false,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
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
                    dispatch(RegisterActionCreator.onToFinish());
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: state.themeColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
          ),
          _renderTextEdit(
              topMargin: 40,
              hintStr: '请输入您的账号',
              controller: state.controllerForAccount),
          _renderTextEdit(
              topMargin: 10,
              hintStr: '请输入您的密码',
              controller: state.controllerForPsw,
              obscureText: true),
          _renderTextEdit(
              topMargin: 10,
              hintStr: '请确认您的密码',
              controller: state.controllerForPswConfirm,
              obscureText: true),
          Container(
            child: MaterialButton(
              onPressed: () {
                dispatch(RegisterActionCreator.onToRegister());
              },
              child: Text(
                '注册',
                style: TextStyle(fontSize: 15, color: ColorConf.ColorFFFFFF),
              ),
              padding: const EdgeInsets.only(
                  left: 120, right: 120, top: 10, bottom: 10),
              color: state.themeColor,
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
