import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/rank/user_rank_page/user_rank_state.dart';

import 'rank_list_view.dart';

class RankListPage extends Page<UserRankState, Map<String, dynamic>> {
  RankListPage()
      : super(
            initState: initState,
            view: buildView,
            dependencies: Dependencies<UserRankState>(
                adapter: null,
                slots: <String, Dependent<UserRankState>>{
                }),
            middleware: <Middleware<UserRankState>>[
            ],);

}
