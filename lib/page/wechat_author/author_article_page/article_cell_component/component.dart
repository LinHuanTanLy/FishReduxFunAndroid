import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

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
