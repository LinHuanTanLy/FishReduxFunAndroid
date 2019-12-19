import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemChildBean.dart';

enum SystemChildAction { action, refresh, loadMore, updateList }

class SystemChildActionCreator {
  static Action onAction() {
    return const Action(SystemChildAction.action);
  }

  static Action onRefresh() {
    return const Action(SystemChildAction.refresh);
  }

  static Action onLoadMore() {
    return const Action(SystemChildAction.loadMore);
  }

  static Action onUpdateList(List<SystemChildCellBean> list) {
    return Action(SystemChildAction.updateList, payload: list);
  }
}
