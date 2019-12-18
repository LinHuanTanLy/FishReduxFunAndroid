import 'package:fish_redux/fish_redux.dart';

import 'coll_cell_effect.dart';
import 'coll_cell_reducer.dart';
import 'coll_cell_state.dart';
import 'coll_cell_view.dart';

class ArticleCollCellComponent extends Component<ArticleCollCellState> {
  ArticleCollCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ArticleCollCellState>(
                adapter: null,
                slots: <String, Dependent<ArticleCollCellState>>{
                }),);

}
