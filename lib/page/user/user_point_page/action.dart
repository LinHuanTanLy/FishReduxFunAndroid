import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';

//TODO replace with your own action
enum UserPointAction { action, updateUserPoint, updatePointList }

class UserPointActionCreator {
  static Action onAction() {
    return const Action(UserPointAction.action);
  }

  static Action onUpdateUserPoint(UserPointBean userPointBean) {
    return Action(UserPointAction.updateUserPoint, payload: userPointBean);
  }

  static Action onUpdatePointList(List<UserPointCell> userPointCellList) {
    return Action(UserPointAction.updatePointList, payload: userPointCellList);
  }
}
