import 'package:fish_redux/fish_redux.dart';

import 'system_cell_action.dart';
import 'system_cell_state.dart';

Reducer<SystemCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemCellState>>{
      SystemCellAction.action: _onAction,
    },
  );
}

SystemCellState _onAction(SystemCellState state, Action action) {
  final SystemCellState newState = state.clone();
  return newState;
}
