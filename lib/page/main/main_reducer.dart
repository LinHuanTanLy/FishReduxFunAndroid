import 'package:fish_redux/fish_redux.dart';

import 'main_action.dart';
import 'main_state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.updatePageContent: _onUpdatePageContent,
    },
  );
}


MainState _onUpdatePageContent(MainState state, Action action) {
  print('_onUpdatePageContent------------------');
  final MainState newState = state.clone();
  newState.currIndex = action.payload;
  return newState;
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}
