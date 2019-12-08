import 'package:fish_redux/fish_redux.dart';

import 'project_action.dart';
import 'project_state.dart';

Reducer<ProjectState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectState>>{
      ProjectAction.action: _onAction,
    },
  );
}

ProjectState _onAction(ProjectState state, Action action) {
  final ProjectState newState = state.clone();
  return newState;
}


