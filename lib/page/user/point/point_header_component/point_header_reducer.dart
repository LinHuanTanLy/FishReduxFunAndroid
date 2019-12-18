import 'package:fish_redux/fish_redux.dart';

import 'point_header_action.dart';
import 'point_header_state.dart';

Reducer<PointHeaderState> buildReducer() {
  return asReducer(
    <Object, Reducer<PointHeaderState>>{
      PointHeaderAction.action: _onAction,
    },
  );
}

PointHeaderState _onAction(PointHeaderState state, Action action) {
  final PointHeaderState newState = state.clone();
  return newState;
}
