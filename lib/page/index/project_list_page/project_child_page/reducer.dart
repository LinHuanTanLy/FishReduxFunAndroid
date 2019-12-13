import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProjectChildState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectChildState>>{
      ProjectChildAction.action: _onAction,
      ProjectChildAction.updateProjectList: _onUpdateProjectList,
    },
  );
}

ProjectChildState _onAction(ProjectChildState state, Action action) {
  final ProjectChildState newState = state.clone();
  return newState;
}

ProjectChildState _onUpdateProjectList(ProjectChildState state, Action action) {

  print('更新数据------------newState..dataSourceForList=${action.payload}');

  final ProjectChildState newState = state.clone();
  newState..dataSourceForList = action.payload;
  return newState;
}
