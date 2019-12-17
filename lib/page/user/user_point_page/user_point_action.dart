import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointListBean.dart';

enum UserPointAction {
  action,
  updateUserPoint,
  updatePointList,
  loadmore,
  refresh,
}

class UserPointActionCreator {
  static Action onAction() {
    return const Action(UserPointAction.action);
  }

  static Action onRefresh() {
    return const Action(UserPointAction.refresh);
  }

  static Action onLoadmore() {
    return const Action(UserPointAction.loadmore);
  }

  static Action onUpdateUserPoint(UserPointBean userPointBean) {
    return Action(UserPointAction.updateUserPoint, payload: userPointBean);
  }

  static Action onUpdatePointList(List<UserPointCell> userPointCellList) {
    return Action(UserPointAction.updatePointList, payload: userPointCellList);
  }
}
