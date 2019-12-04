import 'package:fish_redux/fish_redux.dart';

import 'hot_action.dart';
import 'hot_state.dart';

Reducer<HotArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<HotArticleState>>{
      HotArticleAction.action: _onAction,
    },
  );
}

HotArticleState _onAction(HotArticleState state, Action action) {
  final HotArticleState newState = state.clone();
  return newState;
}
