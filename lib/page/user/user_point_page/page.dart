import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/point_list_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
              adapter: NoneConn<UserPointState>()+PointListAdapter(), slots: <String, Dependent<UserPointState>>{}),
          middleware: <Middleware<UserPointState>>[],
        );
}
