import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/rank/rank_list_adapter/rank_list_adapter.dart';

import 'user_rank_effect.dart';
import 'user_rank_reducer.dart';
import 'user_rank_state.dart';
import 'user_rank_view.dart';

class UserRankPage extends Page<UserRankState, Map<String, dynamic>> {
  UserRankPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<UserRankState>(
              adapter: NoneConn<UserRankState>() + UserRankAdapter(),
              slots: <String, Dependent<UserRankState>>{}),
          middleware: <Middleware<UserRankState>>[],
        );
}
