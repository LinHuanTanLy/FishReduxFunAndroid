import 'package:fish_redux/fish_redux.dart';

import 'banner_effect.dart';
import 'banner_reducer.dart';
import 'banner_state.dart';
import 'banner_view.dart';

class BannerComponent extends Component<BannerState> {
  BannerComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<BannerState>(
              adapter: null, slots: <String, Dependent<BannerState>>{}),
        );
}
