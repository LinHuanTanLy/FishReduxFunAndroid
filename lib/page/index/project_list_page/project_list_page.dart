import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'project_list_effect.dart';
import 'project_list_reducer.dart';
import 'project_list_state.dart';
import 'project_list_view.dart';

class ProjectListPage extends Page<ProjectListState, Map<String, dynamic>> {
  @override
  StateWithTickerProvider createState() => StateWithTickerProvider();
  ProjectListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ProjectListState>(
              adapter: null, slots: <String, Dependent<ProjectListState>>{}),
          middleware: <Middleware<ProjectListState>>[],
        );
}

class StateWithTickerProvider extends ComponentState<ProjectListState>
    with TickerProviderStateMixin {}
