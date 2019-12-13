import 'package:fish_redux/fish_redux.dart';

import 'ProjectList_adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
