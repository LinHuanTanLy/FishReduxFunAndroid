import 'package:fish_redux/fish_redux.dart';
import '../article_list_state.dart';
import 'action.dart';


Effect<AuthorArticleState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorArticleState>>{
    ArticleListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AuthorArticleState> ctx) {
}
