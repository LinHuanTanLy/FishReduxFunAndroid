import 'package:fish_redux/fish_redux.dart';

import 'classify_cell_effect.dart';
import 'classify_cell_reducer.dart';
import 'classify_cell_state.dart';
import 'classify_cell_view.dart';

class ClassifyCellComponent extends Component<ClassifyCellState> {
  ClassifyCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ClassifyCellState>(
                adapter: null,
                slots: <String, Dependent<ClassifyCellState>>{
                }),);

}
