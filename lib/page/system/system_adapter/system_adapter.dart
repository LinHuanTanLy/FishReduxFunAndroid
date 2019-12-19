import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/system/system_cell_component/system_cell_component.dart';
import 'package:flutter_android_fun/page/system/system_cell_component/system_cell_state.dart';

import '../system_state.dart';

class SystemAdapter extends DynamicFlowAdapter<SystemState> {
  SystemAdapter()
      : super(
          pool: <String, Component<Object>>{
            "system_cell": SystemCellComponent()
          },
          connector: _SystemConnector(),
        );
}

class _SystemConnector extends ConnOp<SystemState, List<ItemBean>> {
  @override
  List<ItemBean> get(SystemState state) {
    return state?.listForSystemTree
        ?.map((e) =>
            ItemBean('system_cell', SystemCellState()..systemTreeCellBean = e..color=state.themeColor))
        ?.toList();
  }

  @override
  void set(SystemState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
