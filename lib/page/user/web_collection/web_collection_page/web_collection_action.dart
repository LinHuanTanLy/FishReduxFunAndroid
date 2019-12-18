import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/AddWebKitBean.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';

//TODO replace with your own action
enum WebCollectionAction {
  action,
  updateWebKitList,
  addWebKit,
  onAddSuccess,
  onDeleteSuccess,
  onUpdateSuccess,
}

class WebCollectionActionCreator {
  static Action onAction() {
    return const Action(WebCollectionAction.action);
  }

  static Action onAddWebKitSuc(WebKitCellCollectionBean addWebKitBean) {
    return Action(WebCollectionAction.onAddSuccess, payload: addWebKitBean);
  }

  static Action onUpdateSuccess(WebKitCellCollectionBean addWebKitBean) {
    return Action(WebCollectionAction.onUpdateSuccess, payload: addWebKitBean);
  }

  static Action onUpdateWebKitList(List<WebKitCellCollectionBean> data) {
    return Action(WebCollectionAction.updateWebKitList, payload: data);
  }

  static Action onDeleteSuccess(int id) {
    return Action(WebCollectionAction.onDeleteSuccess, payload: id);
  }

  static Action onAddWebKit() {
    return const Action(
      WebCollectionAction.addWebKit,
    );
  }
}
