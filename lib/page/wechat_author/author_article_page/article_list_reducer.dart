import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';

import 'article_list_action.dart';
import 'article_list_state.dart';

Reducer<AuthorArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorArticleState>>{
      AuthorArticleAction.action: _onAction,
      AuthorArticleAction.updateArticleList: _onUpdateArticleList,
    },
  );
}

AuthorArticleState _onAction(AuthorArticleState state, Action action) {
  final AuthorArticleState newState = state.clone();
  return newState;
}

AuthorArticleState _onUpdateArticleList(
    AuthorArticleState state, Action action) {
  final AuthorArticleState newState = state.clone();
  List<ArticleCellChildList> _listForArticleList = action.payload;
  if (state.pageNum == 1) {
    newState.listForArticleList = _listForArticleList;
  } else {
    newState.listForArticleList.addAll(_listForArticleList);
  }
  return newState;
}
