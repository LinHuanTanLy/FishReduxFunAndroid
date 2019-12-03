import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_adapter/classify_adapter.dart';

import 'classify_effect.dart';
import 'classify_reducer.dart';
import 'classify_state.dart';
import 'classify_view.dart';

class ClassifyComponent extends Component<ClassifyState> {
  ClassifyComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ClassifyState>(
              adapter: NoneConn<ClassifyState>() + ClassifyAdapter(),
              slots: <String, Dependent<ClassifyState>>{}),
        );
}
