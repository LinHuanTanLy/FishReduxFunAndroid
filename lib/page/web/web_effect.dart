import 'package:fish_redux/fish_redux.dart';
import 'web_action.dart';
import 'web_state.dart';

Effect<WebLoadState> buildEffect() {
  return combineEffects(<Object, Effect<WebLoadState>>{
    WebLoadAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WebLoadState> ctx) {
}
