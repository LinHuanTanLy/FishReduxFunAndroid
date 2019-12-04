import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommArticleCellComponent extends Component<CommArticleCellState> {
  CommArticleCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommArticleCellState>(
                adapter: null,
                slots: <String, Dependent<CommArticleCellState>>{
                }),);

}
