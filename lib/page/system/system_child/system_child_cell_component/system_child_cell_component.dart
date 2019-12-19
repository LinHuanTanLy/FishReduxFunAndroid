import 'package:fish_redux/fish_redux.dart';

import 'system_child_cell_action.dart';
import 'system_child_cell_state.dart';
import 'system_child_cell_effect.dart';
import 'system_child_cell_reducer.dart';
import 'system_child_cell_view.dart';

class SystemChildCellComponent extends Component<SystemChildCellState> {
  SystemChildCellComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SystemChildCellState>(
              adapter: null,
              slots: <String, Dependent<SystemChildCellState>>{}),
        );
}
