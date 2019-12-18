import 'package:fish_redux/fish_redux.dart';
import 'rank_cell_action.dart';
import 'rank_cell_state.dart';

Effect<RankCellState> buildEffect() {
  return combineEffects(<Object, Effect<RankCellState>>{
    RankCellAction.action: _onAction,
  });
}

void _onAction(Action action, Context<RankCellState> ctx) {
}
