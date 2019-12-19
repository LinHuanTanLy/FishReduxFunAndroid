import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/system/system_child/system_child_cell_component/system_child_cell_component.dart';
import 'package:flutter_android_fun/page/system/system_child/system_child_cell_component/system_child_cell_state.dart';

import '../system_child_state.dart';

class SystemChildAdapter extends DynamicFlowAdapter<SystemChildState> {
  SystemChildAdapter()
      : super(
          pool: <String, Component<Object>>{
            'system_child_cell': SystemChildCellComponent()
          },
          connector: _SystemChildAdapterConnector(),
        );
}

class _SystemChildAdapterConnector
    extends ConnOp<SystemChildState, List<ItemBean>> {
  @override
  List<ItemBean> get(SystemChildState state) {
    return state.listForSystemArticle.map((e) => ItemBean(
        'system_child_cell', SystemChildCellState()..systemChildCellBean = e)).toList();
  }

  @override
  void set(SystemChildState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
