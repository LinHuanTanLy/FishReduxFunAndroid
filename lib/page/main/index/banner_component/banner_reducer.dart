import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Reducer<BannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<BannerState>>{
      BannerAction.action: _onAction,
      BannerAction.initBannerDataSource: _onInitBannerData,
    },
  );
}

BannerState _onAction(BannerState state, Action action) {
  final BannerState newState = state.clone();
  return newState;
}

BannerState _onInitBannerData(BannerState state, Action action) {
  List<Data> _tempForBannerData = action.payload;
  print('buildReducer---_onInitBannerData=$_tempForBannerData');
  final BannerState newState = state.clone();
  newState..dataForBanner.addAll(_tempForBannerData);
  print('buildReducer---_onInitBannerData=$_tempForBannerData');
  return newState..dataForBanner = _tempForBannerData;
}
