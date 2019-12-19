import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/NaviTreeBean.dart';

enum NaviAction { action, updateNaviList, toWebView, clickLeftItem }

class NaviActionCreator {
  static Action onAction() {
    return const Action(NaviAction.action);
  }

  static Action onUpdateNaviList(List<NaviCellBean> listForNavi) {
    return Action(NaviAction.updateNaviList, payload: listForNavi);
  }

  static Action onClickLeftItem(int id) {
    return Action(NaviAction.clickLeftItem, payload: id);
  }

  static Action onToWebView(dynamic params) {
    return Action(NaviAction.toWebView, payload: params);
  }
}
