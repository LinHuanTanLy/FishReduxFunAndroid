import 'package:fish_redux/fish_redux.dart';

import 'web_action.dart';
import 'web_state.dart';

Reducer<WebLoadState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebLoadState>>{
      WebLoadAction.action: _onAction,
    },
  );
}

WebLoadState _onAction(WebLoadState state, Action action) {
  final WebLoadState newState = state.clone();
  return newState;
}
