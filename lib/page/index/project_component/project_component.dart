import 'package:fish_redux/fish_redux.dart';

import 'project_effect.dart';
import 'project_reducer.dart';
import 'project_state.dart';
import 'project_view.dart';

class ProjectComponent extends Component<ProjectState> {
  ProjectComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProjectState>(
                adapter: null,
                slots: <String, Dependent<ProjectState>>{
                }),);

}
