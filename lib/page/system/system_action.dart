import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemTreeBean.dart';

//TODO replace with your own action
enum SystemAction { action, updateSystemList }

class SystemActionCreator {
  static Action onAction() {
    return const Action(SystemAction.action);
  }

  static Action onUpdateSystemList(List<SystemTreeCellBean> listForSystemTree) {
    return Action(SystemAction.updateSystemList, payload: listForSystemTree);
  }
}
