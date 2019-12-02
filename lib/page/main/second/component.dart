import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SecondComponent extends Component<SecondState> {
  SecondComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SecondState>(
                adapter: null,
                slots: <String, Dependent<SecondState>>{
                }),);

}
