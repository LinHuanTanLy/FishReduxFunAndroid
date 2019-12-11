import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArticleAuthorCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleAuthorCellState>>{
      ArticleCellAction.action: _onAction,
    },
  );
}

ArticleAuthorCellState _onAction(ArticleAuthorCellState state, Action action) {
  final ArticleAuthorCellState newState = state.clone();
  return newState;
}
