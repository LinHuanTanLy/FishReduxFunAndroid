import 'package:fish_redux/fish_redux.dart';

import 'project_cell_effect.dart';
import 'project_cell_reducer.dart';
import 'project_cell_state.dart';
import 'project_cell_view.dart';

class ProjectCellComponent extends Component<ProjectCellState> {
  ProjectCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProjectCellState>(
                adapter: null,
                slots: <String, Dependent<ProjectCellState>>{
                }),);

}
