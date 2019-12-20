import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';

import 'theme_action.dart';
import 'theme_state.dart';

Reducer<ThemeChangeState> buildReducer() {
  return asReducer(
    <Object, Reducer<ThemeChangeState>>{
      ThemeChangeAction.action: _onAction,

    },
  );
}

ThemeChangeState _onAction(ThemeChangeState state, Action action) {
  final ThemeChangeState newState = state.clone();
  return newState;
}


