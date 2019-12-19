import 'package:fish_redux/fish_redux.dart';

import 'ProjectList_adapter/project_adapter.dart';
import 'project_child_effect.dart';
import 'project_child_reducer.dart';
import 'project_child_state.dart';
import 'project_child_view.dart';

class ProjectChildPage extends Page<ProjectChildState, Map<String, dynamic>> {
  ProjectChildPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ProjectChildState>(
              adapter: NoneConn<ProjectChildState>() + ProjectListAdapter(),
              slots: <String, Dependent<ProjectChildState>>{}),
          middleware: <Middleware<ProjectChildState>>[],
        );
}
