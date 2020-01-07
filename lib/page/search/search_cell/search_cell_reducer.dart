import 'package:fish_redux/fish_redux.dart';

import 'search_cell_action.dart';
import 'search_cell_state.dart';

Reducer<SearchCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchCellState>>{
      SearchCellAction.action: _onAction,
    },
  );
}

SearchCellState _onAction(SearchCellState state, Action action) {
  final SearchCellState newState = state.clone();
  return newState;
}
