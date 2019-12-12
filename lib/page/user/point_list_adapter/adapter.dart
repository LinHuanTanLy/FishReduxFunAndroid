import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/point_cell_component/component.dart';
import 'package:flutter_android_fun/page/user/point_cell_component/state.dart';
import 'package:flutter_android_fun/page/user/user_point_page/state.dart';

import 'reducer.dart';

class PointListAdapter extends DynamicFlowAdapter<UserPointState> {
  PointListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "point_cell": PointCellComponent(),
          },
          connector: _PointListConnector(),
          reducer: buildReducer(),
        );
}

class _PointListConnector extends ConnOp<UserPointState, List<ItemBean>> {
  @override
  List<ItemBean> get(UserPointState state) {
    if(state.pointCell!=null && state.pointCell.isNotEmpty==true) {
      return state.pointCell
          .map((e) =>
          ItemBean('point_cell', PointCellState()
            ..pointCell = e))
          .toList();
    }else{
      return <ItemBean>[];
    }
  }

  @override
  void set(UserPointState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
