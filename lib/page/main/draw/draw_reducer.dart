import 'package:fish_redux/fish_redux.dart';

import 'draw_action.dart';
import 'draw_state.dart';

Reducer<DrawState> buildReducer() {
  return asReducer(
    <Object, Reducer<DrawState>>{
      DrawAction.action: _onAction,
    },
  );
}

DrawState _onAction(DrawState state, Action action) {
  final DrawState newState = state.clone();
  return newState;
}
