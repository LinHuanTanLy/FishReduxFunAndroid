import 'package:fish_redux/fish_redux.dart';

import 'system_action.dart';
import 'system_state.dart';

Reducer<SystemState> buildReducer() {
  return asReducer(
    <Object, Reducer<SystemState>>{
      SystemAction.action: _onAction,
      SystemAction.updateSystemList: _onUpdateSystemList,
    },
  );
}

SystemState _onAction(SystemState state, Action action) {
  final SystemState newState = state.clone();
  return newState;
}

SystemState _onUpdateSystemList(SystemState state, Action action) {
  final SystemState newState = state.clone();
  newState..listForSystemTree = action.payload;
  return newState;
}
