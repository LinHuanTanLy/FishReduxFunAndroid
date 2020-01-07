import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SearchResultBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'search_action.dart';
import 'search_state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.action: _onAction,
      SearchAction.updateHotSearchList: _onUpdateHotSearchList,
      SearchAction.updateSearchResult: _onUpdateSearchList,
      SearchAction.toClean: _onToClean,
    },
  );
}

SearchState _onAction(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState;
}

SearchState _onToClean(SearchState state, Action action) {
  final SearchState newState = state.clone();
  newState..textEditingControllerForInput.text = "";
  newState..pageIndex = 0;
  newState..searchResultList = [];
  newState..ifTextFieldAble = true;
  return newState;
}

SearchState _onUpdateSearchList(SearchState state, Action action) {
  final SearchState newState = state.clone();
  List<SearchResultCellBean> tempList = action.payload["list"];
  String key = action.payload["key"];
  List<SearchResultCellBean> oldList = state.searchResultList;
  int pageIndex = state.pageIndex;
  oldList.addAll(tempList);
  state.refreshController.loadComplete();
  return newState
    ..textEditingControllerForInput.text = key
    ..searchResultList = oldList
    ..ifTextFieldAble = false
    ..pageIndex = ++pageIndex;
}

SearchState _onUpdateHotSearchList(SearchState state, Action action) {
  final SearchState newState = state.clone();
  newState..hotSearchBeanList = action.payload;
  return newState;
}
