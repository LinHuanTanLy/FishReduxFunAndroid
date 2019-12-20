import 'package:fish_redux/fish_redux.dart';

import 'draw_effect.dart';
import 'draw_reducer.dart';
import 'draw_state.dart';
import 'draw_view.dart';

class DrawPage extends Page<DrawState, Map<String, dynamic>> {
  DrawPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DrawState>(
                adapter: null,
                slots: <String, Dependent<DrawState>>{
                }),
            middleware: <Middleware<DrawState>>[
            ],);

}
