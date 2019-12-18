import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/point/point_cell_component/point_cell_component.dart';
import 'package:flutter_android_fun/page/user/point/point_cell_component/point_cell_state.dart';
import 'package:flutter_android_fun/page/user/point/point_header_component/point_header_component.dart';
import 'package:flutter_android_fun/page/user/point/point_header_component/point_header_state.dart';
import 'package:flutter_android_fun/page/user/point/user_point_page/user_point_state.dart';

import 'point_list_reducer.dart';

class PointListAdapter extends DynamicFlowAdapter<UserPointState> {
  PointListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "point_cell": PointCellComponent(),
            "point_header_cell": PointHeaderComponent()
          },
          connector: _PointListConnector(),
          reducer: buildReducer(),
        );
}

class _PointListConnector extends ConnOp<UserPointState, List<ItemBean>> {
  @override
  List<ItemBean> get(UserPointState state) {
    List<ItemBean> _listForItemBean = [];

    _listForItemBean.add(ItemBean(
        "point_header_cell",
        PointHeaderState()
          ..userPointBean = state.userPointBean
          ..themeColor = state.themeColor));

    if (state.pointCell != null && state.pointCell.isNotEmpty == true) {
      _listForItemBean.addAll(state.pointCell
          .map((e) => ItemBean('point_cell', PointCellState()..pointCell = e))
          .toList());
    }
    return _listForItemBean;
  }

  @override
  void set(UserPointState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
