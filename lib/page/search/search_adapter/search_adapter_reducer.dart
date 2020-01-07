import 'package:fish_redux/fish_redux.dart';

import '../search_state.dart';
import 'search_adapter_action.dart';
import 'search_adapter_state.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAdapterAction.action: _onAction,
    },
  );
}

SearchState _onAction(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState;
}
