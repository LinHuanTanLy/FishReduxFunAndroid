import 'package:fish_redux/fish_redux.dart';

import 'system_child_adapter/system_child_adapter.dart';
import 'system_child_effect.dart';
import 'system_child_reducer.dart';
import 'system_child_state.dart';
import 'system_child_view.dart';

class SystemChildPage extends Page<SystemChildState, Map<String, dynamic>> {
  SystemChildPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SystemChildState>(
              adapter: NoneConn<SystemChildState>() + SystemChildAdapter(),
              slots: <String, Dependent<SystemChildState>>{}),
          middleware: <Middleware<SystemChildState>>[],
        );
}
