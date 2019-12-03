import 'package:fish_redux/fish_redux.dart';
import 'classify_cell_action.dart';
import 'classify_cell_state.dart';

Effect<ClassifyCellState> buildEffect() {
  return combineEffects(<Object, Effect<ClassifyCellState>>{
    ClassifyCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ClassifyCellState> ctx) {
}
