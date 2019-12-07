import 'package:fish_redux/fish_redux.dart';

import 'project_action.dart';
import 'project_state.dart';

Reducer<ProjectState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectState>>{
      ProjectAction.action: _onAction,
      ProjectAction.initW: _onInitW,
    },
  );
}

ProjectState _onAction(ProjectState state, Action action) {
  final ProjectState newState = state.clone();
  return newState;
}

ProjectState _onInitW(ProjectState state, Action action) {
  final ProjectState newState = state.clone();
  double w = action.payload;
  print('初始化的时候 w是 $w');
  return newState..w = w;
}
