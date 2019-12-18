import 'package:fish_redux/fish_redux.dart';

import 'rank_cell_effect.dart';
import 'rank_cell_reducer.dart';
import 'rank_cell_state.dart';
import 'rank_cell_view.dart';

class RankCellComponent extends Component<RankCellState> {
  RankCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RankCellState>(
                adapter: null,
                slots: <String, Dependent<RankCellState>>{
                }),);

}
