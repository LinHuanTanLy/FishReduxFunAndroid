import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

import 'index_action.dart';
import 'index_state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.action: _onAction,
      IndexAction.initBannerDataSource: _onInitBannerData,
    },
  );
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}

IndexState _onInitBannerData(IndexState state, Action action) {
  List<Data> _tempForBannerData = action.payload;
  print('buildReducer---_onInitBannerData=$_tempForBannerData');
  final IndexState newState = state.clone();
  newState..dataForBanner = _tempForBannerData;
  print('buildReducer---_onInitBannerData=${newState.dataForBanner}');
  return newState;
}
