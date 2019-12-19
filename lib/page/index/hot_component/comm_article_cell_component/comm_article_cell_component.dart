import 'package:fish_redux/fish_redux.dart';

import 'comm_article_cell_effect.dart';
import 'comm_article_cell_reducer.dart';
import 'comm_article_cell_state.dart';
import 'comm_article_cell_view.dart';

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
