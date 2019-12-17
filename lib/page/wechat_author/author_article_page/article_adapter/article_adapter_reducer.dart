import 'package:fish_redux/fish_redux.dart';

import '../article_list_state.dart';
import 'article_adapter_action.dart';


Reducer<AuthorArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorArticleState>>{
      ArticleListAction.action: _onAction,
    },
  );
}

AuthorArticleState _onAction(AuthorArticleState state, Action action) {
  final AuthorArticleState newState = state.clone();
  return newState;
}
