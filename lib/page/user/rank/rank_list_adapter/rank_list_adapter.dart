import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/rank/rank_cell_component/rank_cell_component.dart';
import 'package:flutter_android_fun/page/user/rank/rank_cell_component/rank_cell_state.dart';
import 'package:flutter_android_fun/page/user/rank/user_rank_page/user_rank_state.dart';

class UserRankAdapter extends DynamicFlowAdapter<UserRankState> {
  UserRankAdapter()
      : super(
          pool: <String, Component<Object>>{'rank_cell': RankCellComponent()},
          connector: _UserRankConnector(),
        );
}

class _UserRankConnector extends ConnOp<UserRankState, List<ItemBean>> {
  @override
  List<ItemBean> get(UserRankState state) {
    return state.listForRank.map(
        (e) => ItemBean('rank_cell', RankCellState()..userCellRankBean = e)).toList();
  }

  @override
  void set(UserRankState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
