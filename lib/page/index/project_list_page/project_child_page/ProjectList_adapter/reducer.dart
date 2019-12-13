import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';


Reducer<ProjectChildState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProjectChildState>>{
      ProjectListAction.action: _onAction,
    },
  );
}

ProjectChildState _onAction(ProjectChildState state, Action action) {
  final ProjectChildState newState = state.clone();
  return newState;
}
