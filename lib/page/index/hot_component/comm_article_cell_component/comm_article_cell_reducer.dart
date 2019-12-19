import 'package:fish_redux/fish_redux.dart';

import 'comm_article_cell_action.dart';
import 'comm_article_cell_state.dart';

Reducer<CommArticleCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommArticleCellState>>{
      CommArticleCellAction.action: _onAction,
    },
  );
}

CommArticleCellState _onAction(CommArticleCellState state, Action action) {
  final CommArticleCellState newState = state.clone();
  return newState;
}
