import 'package:fish_redux/fish_redux.dart';

import 'web_effect.dart';
import 'web_reducer.dart';
import 'web_state.dart';
import 'web_view.dart';

class WebLoadPage extends Page<WebLoadState, Map<String, dynamic>> {
  WebLoadPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WebLoadState>(
                adapter: null,
                slots: <String, Dependent<WebLoadState>>{
                }),
            middleware: <Middleware<WebLoadState>>[
            ],);

}
