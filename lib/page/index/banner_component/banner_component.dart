import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BannerComponent extends Component<BannerState> {
  BannerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BannerState>(
                adapter: null,
                slots: <String, Dependent<BannerState>>{
                }),);

}
