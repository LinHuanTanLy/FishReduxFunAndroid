import 'package:fish_redux/fish_redux.dart';

import 'banner_component/banner_component.dart';
import 'index_effect.dart';
import 'index_reducer.dart';
import 'index_state.dart';
import 'index_view.dart';


class IndexPage extends Page<IndexState, Map<String, dynamic>> {
  IndexPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<IndexState>(
              adapter: null,
              slots: <String, Dependent<IndexState>>{
                "banner": BannerConnector() + BannerComponent()
              }),
          middleware: <Middleware<IndexState>>[],
        );
}
