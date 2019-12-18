import 'package:fish_redux/fish_redux.dart';

import 'point_cell_effect.dart';
import 'point_cell_reducer.dart';
import 'point_cell_state.dart';
import 'point_cell_view.dart';

class PointCellComponent extends Component<PointCellState> {
  PointCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PointCellState>(
                adapter: null,
                slots: <String, Dependent<PointCellState>>{
                }),);

}
