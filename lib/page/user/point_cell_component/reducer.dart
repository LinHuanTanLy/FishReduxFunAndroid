import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PointCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<PointCellState>>{
      PointCellAction.action: _onAction,
    },
  );
}

PointCellState _onAction(PointCellState state, Action action) {
  final PointCellState newState = state.clone();
  return newState;
}
