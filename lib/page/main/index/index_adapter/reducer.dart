import 'package:fish_redux/fish_redux.dart';

import '../index_state.dart';
import 'action.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      ListIndexAction.action: _onAction,
    },
  );
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}
