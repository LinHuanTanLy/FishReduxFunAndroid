import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';

//TODO replace with your own action
enum WebCollectionCellAction { action, toWebView, showDialog, delete }

class WebCollectionCellActionCreator {
  static Action onAction() {
    return const Action(WebCollectionCellAction.action);
  }

  static Action onToWebView(dynamic params) {
    return Action(WebCollectionCellAction.toWebView, payload: params);
  }

  static Action onDelete(String id) {
    return Action(WebCollectionCellAction.delete, payload: id);
  }

  static Action onShowDialog(WebKitCellCollectionBean bean) {
    return Action(WebCollectionCellAction.showDialog, payload: bean);
  }
}
