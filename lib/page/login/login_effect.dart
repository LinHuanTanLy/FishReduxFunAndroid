import 'package:fish_redux/fish_redux.dart';
import 'login_action.dart';
import 'login_state.dart';

Effect<loginState> buildEffect() {
  return combineEffects(<Object, Effect<loginState>>{
    loginAction.action: _onAction,
  });
}

void _onAction(Action action, Context<loginState> ctx) {
}
