import 'package:fish_redux/fish_redux.dart';

import 'system_child_cell_action.dart';
import 'system_child_cell_state.dart';

Reducer<SystemChildCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemChildCellState>>{
      SystemChildCellAction.action: _onAction,
    },
  );
}

SystemChildCellState _onAction(SystemChildCellState state, Action action) {
  final SystemChildCellState newState = state.clone();
  return newState;
}
