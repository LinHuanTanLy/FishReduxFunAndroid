import 'package:fish_redux/fish_redux.dart';

import 'project_cell_action.dart';
import 'project_cell_state.dart';

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
