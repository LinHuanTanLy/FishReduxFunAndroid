import 'package:fish_redux/fish_redux.dart';

import 'article_cell_effect.dart';
import 'article_cell_reducer.dart';
import 'article_cell_state.dart';
import 'article_cell_view.dart';

class ArticleCellComponent extends Component<ArticleAuthorCellState> {
  ArticleCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ArticleAuthorCellState>(
                adapter: null,
                slots: <String, Dependent<ArticleAuthorCellState>>{
                }),);

}
