import 'package:fish_redux/fish_redux.dart';

import 'search_adapter/search_adapter.dart';
import 'search_effect.dart';
import 'search_reducer.dart';
import 'search_state.dart';
import 'search_view.dart';

class SearchPage extends Page<SearchState, Map<String, dynamic>> {
  SearchPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SearchState>(
              adapter: NoneConn<SearchState>() + SearchAdapter(),
              slots: <String, Dependent<SearchState>>{}),
          middleware: <Middleware<SearchState>>[],
        );
}
