import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;

enum GlobalAction {
  changeThemeColor,
  updateGlobalW,
  updateGlobalH,
  updateLoginStatus,
  toLoginPage,
  updateUserPoint,
}

class GlobalActionCreator {
  static Action onChangeThemeColor(int  indexFlag) {
    return  Action(GlobalAction.changeThemeColor,payload: indexFlag);
  }

  static Action onUpdateUserPoint(int userPoint) {
    return Action(GlobalAction.updateUserPoint, payload: userPoint);
  }

  static Action onUpdateGlobalH(double h) {
    return Action(GlobalAction.updateGlobalH, payload: h);
  }

  static Action onUpdateGlobalW(double w) {
    return Action(GlobalAction.updateGlobalW, payload: w);
  }

  static Action onUpdateLoginStatus(bool ifLogin) {
    return Action(GlobalAction.updateLoginStatus, payload: ifLogin);
  }

  static Action onToLoginPage() {
    return Action(
      GlobalAction.toLoginPage,
    );
  }
}
