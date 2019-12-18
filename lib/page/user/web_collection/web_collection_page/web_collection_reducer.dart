import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';
import 'web_collection_action.dart';
import 'web_collection_state.dart';

Reducer<WebCollectionState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebCollectionState>>{
      WebCollectionAction.action: _onAction,
      WebCollectionAction.updateWebKitList: _onUpdateWebKitList,
      WebCollectionAction.onAddSuccess: _onAddWebKitSuc,
      WebCollectionAction.onDeleteSuccess: _onDeleteSuccess,
      WebCollectionAction.onUpdateSuccess: _onUpdateSuccess,
    },
  );
}

WebCollectionState _onAction(WebCollectionState state, Action action) {
  final WebCollectionState newState = state.clone();
  return newState;
}

WebCollectionState _onUpdateSuccess(WebCollectionState state, Action action) {
  WebKitCellCollectionBean webKitCellCollectionBean = action.payload;
  List<WebKitCellCollectionBean> listForWebkit = state?.listForWebkit;
  for (int i = 0; i < listForWebkit.length; i++) {
    if (listForWebkit[i].id == webKitCellCollectionBean.id) {
      listForWebkit[i].name = webKitCellCollectionBean.name;
      listForWebkit[i].link = webKitCellCollectionBean.link;
    }
  }
  final WebCollectionState newState = state.clone();
  return newState..listForWebkit = listForWebkit;
}

WebCollectionState _onDeleteSuccess(WebCollectionState state, Action action) {
  int id = action.payload;
  List<WebKitCellCollectionBean> listForWebkit = state?.listForWebkit;
  listForWebkit.removeWhere((e) => e.id == id);
  final WebCollectionState newState = state.clone();
  return newState..listForWebkit = listForWebkit;
}

WebCollectionState _onAddWebKitSuc(WebCollectionState state, Action action) {
  final WebCollectionState newState = state.clone();
  List<WebKitCellCollectionBean> listForWebkit = state.listForWebkit;
  listForWebkit.add(action.payload);
  return newState..listForWebkit = listForWebkit;
}

WebCollectionState _onUpdateWebKitList(
    WebCollectionState state, Action action) {
  List<WebKitCellCollectionBean> listForWebkit = action.payload;
  final WebCollectionState newState = state.clone();
  return newState..listForWebkit = listForWebkit;
}
