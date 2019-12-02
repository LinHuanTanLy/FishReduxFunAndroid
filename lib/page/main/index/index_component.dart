import 'package:fish_redux/fish_redux.dart';

import 'index_adapter/adapter.dart';
import 'index_effect.dart';
import 'index_reducer.dart';
import 'index_state.dart';
import 'index_view.dart';

class IndexComponent extends Component<IndexState> {
  IndexComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<IndexState>(
              adapter: NoneConn<IndexState>() + ListIndexAdapter(),
              slots: <String, Dependent<IndexState>>{}),
        );
}
