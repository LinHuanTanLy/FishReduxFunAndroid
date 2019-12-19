import 'package:fish_redux/fish_redux.dart';

import 'system_adapter/system_adapter.dart';
import 'system_effect.dart';
import 'system_reducer.dart';
import 'system_state.dart';
import 'system_view.dart';

///体系列表
class SystemPage extends Page<SystemState, Map<String, dynamic>> {
  SystemPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SystemState>(
              adapter: NoneConn<SystemState>() + SystemAdapter(),
              slots: <String, Dependent<SystemState>>{}),
          middleware: <Middleware<SystemState>>[],
        );
}
