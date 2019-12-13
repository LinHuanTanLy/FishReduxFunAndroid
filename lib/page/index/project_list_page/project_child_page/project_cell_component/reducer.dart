import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProjectCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectCellState>>{
      ProjectCellAction.action: _onAction,
    },
  );
}

ProjectCellState _onAction(ProjectCellState state, Action action) {
  final ProjectCellState newState = state.clone();
  return newState;
}
