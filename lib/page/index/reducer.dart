import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.action: _onAction,
      IndexAction.updateBannerDataSource:_onUpdateBannerDataSource,
    },
  );
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}
IndexState _onUpdateBannerDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  newState.bannerDataSource=action.payload;
  return newState;
}
