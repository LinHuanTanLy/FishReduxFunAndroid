import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PointCellState> buildEffect() {
  return combineEffects(<Object, Effect<PointCellState>>{
    PointCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PointCellState> ctx) {
}
