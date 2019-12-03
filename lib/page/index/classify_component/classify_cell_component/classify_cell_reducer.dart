import 'package:fish_redux/fish_redux.dart';

import 'classify_cell_action.dart';
import 'classify_cell_state.dart';

Reducer<ClassifyCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassifyCellState>>{
      ClassifyCellAction.action: _onAction,
    },
  );
}

ClassifyCellState _onAction(ClassifyCellState state, Action action) {
  final ClassifyCellState newState = state.clone();
  return newState;
}
