import 'package:fish_redux/fish_redux.dart';

import 'article_action.dart';
import 'article_state.dart';

Reducer<ArticleCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleCellState>>{
      ArticleCellAction.action: _onAction,
    },
  );
}

ArticleCellState _onAction(ArticleCellState state, Action action) {
  final ArticleCellState newState = state.clone();
  return newState;
}
