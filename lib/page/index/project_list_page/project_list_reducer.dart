import 'package:fish_redux/fish_redux.dart';

import 'project_list_action.dart';
import 'project_list_state.dart';

Reducer<ProjectListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectListState>>{
      ProjectListAction.action: _onAction,
      ProjectListAction.updateProjectMenuList: _onUpdateProjectMenuList,
    },
  );
}

ProjectListState _onAction(ProjectListState state, Action action) {
  final ProjectListState newState = state.clone();
  return newState;
}

ProjectListState _onUpdateProjectMenuList(
    ProjectListState state, Action action) {
  final ProjectListState newState = state.clone();
  newState.projectList = action.payload;
  return newState;
}
