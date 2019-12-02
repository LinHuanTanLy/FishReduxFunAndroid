import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    SecondAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SecondState> ctx) {
}
