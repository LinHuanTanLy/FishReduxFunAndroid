import 'package:fish_redux/fish_redux.dart';

import 'rank_cell_action.dart';
import 'rank_cell_state.dart';

Reducer<RankCellState> buildReducer() {
  return asReducer(
    <Object, Reducer<RankCellState>>{
      RankCellAction.action: _onAction,
    },
  );
}

RankCellState _onAction(RankCellState state, Action action) {
  final RankCellState newState = state.clone();
  return newState;
}
