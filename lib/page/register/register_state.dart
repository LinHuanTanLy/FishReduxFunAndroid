import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_state.dart';

class RegisterState implements GlobalBaseState, Cloneable<RegisterState> {
  TextEditingController controllerForAccount;
  TextEditingController controllerForPsw;
  TextEditingController controllerForPswConfirm;

  @override
  RegisterState clone() {
    return RegisterState()
      ..themeColor = themeColor
      ..ifLogin = ifLogin
      ..controllerForAccount = controllerForAccount
      ..controllerForPsw = controllerForPsw
      ..controllerForPswConfirm = controllerForPswConfirm;
  }

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  int userPoint;
}

RegisterState initState(Map<String, dynamic> args) {
  return RegisterState()
    ..controllerForPswConfirm = TextEditingController()
    ..controllerForPsw = TextEditingController()
    ..controllerForAccount = TextEditingController();
}
