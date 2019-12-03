import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';

import 'index_action.dart';
import 'index_state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.action: _onAction,
      IndexAction.updateBannerDataSource: _onUpdateBannerDataSource,
      IndexAction.updateClassifySource: _onUpdateClassifyDataSource,
    },
  );
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}

IndexState _onUpdateBannerDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  newState.bannerDataSource = action.payload;
  return newState;
}

IndexState _onUpdateClassifyDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  List _tempList = action.payload;
  if (_tempList != null && _tempList.isNotEmpty == true) {
    _tempList =
        _tempList.length > 9 ? _tempList.getRange(0, 9).toList() : _tempList;
  }
  if (_tempList.length < 10) {
    _tempList.add(ClassifyData(name: '更多'));
  }
  newState.dartForClassify = _tempList;
  return newState;
}
