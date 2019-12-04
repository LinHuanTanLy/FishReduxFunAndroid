import 'package:fish_redux/fish_redux.dart';
import 'hot_action.dart';
import 'hot_state.dart';

Effect<HotArticleState> buildEffect() {
  return combineEffects(<Object, Effect<HotArticleState>>{
    HotArticleAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HotArticleState> ctx) {
}
