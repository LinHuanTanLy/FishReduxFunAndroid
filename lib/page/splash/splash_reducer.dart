import 'package:fish_redux/fish_redux.dart';

import 'splash_action.dart';
import 'splash_state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.action: _onAction,
    },
  );
}

SplashState _onAction(SplashState state, Action action) {
  final SplashState newState = state.clone();
  return newState;
}
