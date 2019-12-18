import 'package:fish_redux/fish_redux.dart';

import 'coll_cell_action.dart';
import 'coll_cell_state.dart';

Reducer<ArticleCollCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleCollCellState>>{
      ArticleCollCellAction.action: _onAction,
    },
  );
}

ArticleCollCellState _onAction(ArticleCollCellState state, Action action) {
  final ArticleCollCellState newState = state.clone();
  return newState;
}
