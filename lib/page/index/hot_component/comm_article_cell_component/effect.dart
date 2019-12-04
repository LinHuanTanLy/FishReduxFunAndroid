import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommArticleCellState> buildEffect() {
  return combineEffects(<Object, Effect<CommArticleCellState>>{
    CommArticleCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommArticleCellState> ctx) {
}
