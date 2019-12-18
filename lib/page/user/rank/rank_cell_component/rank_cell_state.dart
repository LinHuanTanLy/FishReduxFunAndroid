import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserRankBean.dart';

class RankCellState implements Cloneable<RankCellState> {
  UserCellRankBean userCellRankBean;

  @override
  RankCellState clone() {
    return RankCellState()..userCellRankBean = userCellRankBean;
  }
}

RankCellState initState(Map<String, dynamic> args) {
  return RankCellState();
}
