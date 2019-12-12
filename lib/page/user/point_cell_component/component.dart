import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
