import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserRankBean.dart';

//TODO replace with your own action
enum UserRankAction { action, updateRankList, refresh, loadMore }

class UserRankActionCreator {
  static Action onAction() {
    return const Action(UserRankAction.action);
  }

  static Action onRefresh() {
    return const Action(UserRankAction.refresh);
  }

  static Action onLoadMore() {
    return const Action(UserRankAction.loadMore);
  }

  static Action onUpdateRankList(List<UserCellRankBean> listForRank) {
    return Action(UserRankAction.updateRankList, payload: listForRank);
  }
}
