import 'package:fish_redux/fish_redux.dart';

import 'web_collection_cell_action.dart';
import 'web_collection_cell_state.dart';

Reducer<WebCollectionCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebCollectionCellState>>{
      WebCollectionCellAction.action: _onAction,
    },
  );
}

WebCollectionCellState _onAction(WebCollectionCellState state, Action action) {
  final WebCollectionCellState newState = state.clone();
  return newState;
}
