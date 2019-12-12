import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class LoginState implements GlobalBaseState, Cloneable<LoginState> {
  TextEditingController controllerForAccount;
  TextEditingController controllerForPassWord;

  @override
  LoginState clone() {
    return LoginState()
      ..controllerForAccount = controllerForAccount
      ..controllerForPassWord = controllerForPassWord
      ..ifLogin = ifLogin
      ..screenW = screenW
      ..screenH = screenH
      ..themeColor = themeColor;
  }

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState()
    ..controllerForPassWord = TextEditingController()
    ..controllerForAccount = TextEditingController();
}
