import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/main/index/banner_component/banner_component.dart';

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
              adapter: null,
              slots: <String, Dependent<IndexState>>{
                "banner": BannerConnector() + BannerComponent(),
              }),
        );
}
