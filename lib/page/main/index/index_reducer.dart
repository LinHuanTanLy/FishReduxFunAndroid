import 'package:fish_redux/fish_redux.dart';

import 'index_action.dart';
import 'index_state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.action: _onAction,
      IndexAction.initBannerDataSource: _onInitBannerDataSource,
    },
  );
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}

IndexState _onInitBannerDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState..dataForBanner = action.payload;
}
