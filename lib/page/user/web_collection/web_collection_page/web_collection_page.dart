import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_collection_adapter/web_collection_adapter.dart';

import 'web_collection_effect.dart';
import 'web_collection_reducer.dart';
import 'web_collection_state.dart';
import 'web_collection_view.dart';

class WebCollectionPage extends Page<WebCollectionState, Map<String, dynamic>> {
  WebCollectionPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WebCollectionState>(
              adapter: NoneConn<WebCollectionState>() + WebCollectionAdapter(),
              slots: <String, Dependent<WebCollectionState>>{}),
          middleware: <Middleware<WebCollectionState>>[],
        );
}
