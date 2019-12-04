import 'package:fish_redux/fish_redux.dart';

import '../hot_state.dart';
import 'article_adapter_action.dart';

Reducer<HotArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<HotArticleState>>{
      ArticleAdapterAction.action: _onAction,
    },
  );
}

HotArticleState _onAction(HotArticleState state, Action action) {
  final HotArticleState newState = state.clone();
  return newState;
}
