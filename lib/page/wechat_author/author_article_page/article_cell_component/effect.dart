import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ArticleAuthorCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleAuthorCellState>>{
    ArticleCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ArticleAuthorCellState> ctx) {
}
