import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';

enum SecondAction { action, getUserInfo }

class SecondActionCreator {
  static Action onAction() {
    return const Action(SecondAction.action);
  }

  static Action onGetUserInfo(UserPointBean userPointBean) {
    return  Action(SecondAction.getUserInfo, payload: userPointBean);
  }
}
