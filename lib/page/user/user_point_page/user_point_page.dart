import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/point_list_adapter/point_list_adapter.dart';

import 'user_point_effect.dart';
import 'user_point_reducer.dart';
import 'user_point_state.dart';
import 'user_point_view.dart';

class UserPointPage extends Page<UserPointState, Map<String, dynamic>> {
  @override
  StateWithTickerProvider createState() => StateWithTickerProvider();

  UserPointPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<UserPointState>(
              adapter: NoneConn<UserPointState>() + PointListAdapter(),
              slots: <String, Dependent<UserPointState>>{}),
          middleware: <Middleware<UserPointState>>[],
        );
}
