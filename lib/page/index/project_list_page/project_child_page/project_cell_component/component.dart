import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
