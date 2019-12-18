import 'package:fish_redux/fish_redux.dart';

import 'point_header_effect.dart';
import 'point_header_reducer.dart';
import 'point_header_state.dart';
import 'point_header_view.dart';

class PointHeaderComponent extends Component<PointHeaderState> {
  PointHeaderComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PointHeaderState>(
                adapter: null,
                slots: <String, Dependent<PointHeaderState>>{
                }),);

}
