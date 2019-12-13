import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/index/project_list_page/project_child_page/project_cell_component/component.dart';
import 'package:flutter_android_fun/page/index/project_list_page/project_child_page/project_cell_component/state.dart';

import '../state.dart';
import 'reducer.dart';

class ProjectListAdapter extends DynamicFlowAdapter<ProjectChildState> {
  ProjectListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'project_cell': ProjectCellComponent()
          },
          connector: _ProjectListConnector(),
          reducer: buildReducer(),
        );
}

class _ProjectListConnector extends ConnOp<ProjectChildState, List<ItemBean>> {
  @override
  List<ItemBean> get(ProjectChildState state) {
    return state.dataSourceForList
        .map((e) =>
            ItemBean("project_cell", ProjectCellState()..projectSingleCell = e))
        .toList();
  }

  @override
  void set(ProjectChildState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
