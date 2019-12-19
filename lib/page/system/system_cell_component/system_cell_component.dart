import 'package:fish_redux/fish_redux.dart';

import 'system_cell_effect.dart';
import 'system_cell_reducer.dart';
import 'system_cell_state.dart';
import 'system_cell_view.dart';

class SystemCellComponent extends Component<SystemCellState> {
  SystemCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SystemCellState>(
                adapter: null,
                slots: <String, Dependent<SystemCellState>>{
                }),);

}
