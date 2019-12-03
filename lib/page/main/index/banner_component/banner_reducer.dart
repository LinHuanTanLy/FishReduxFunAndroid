import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Reducer<BannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<BannerState>>{
      BannerAction.action: _onAction,

    },
  );
}

BannerState _onAction(BannerState state, Action action) {
  final BannerState newState = state.clone();
  return newState;
}


