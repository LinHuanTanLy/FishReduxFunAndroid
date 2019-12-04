import 'package:fish_redux/fish_redux.dart';

import 'article_effect.dart';
import 'article_reducer.dart';
import 'article_state.dart';
import 'article_view.dart';

class ArticleCellComponent extends Component<ArticleCellState> {
  ArticleCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ArticleCellState>(
                adapter: null,
                slots: <String, Dependent<ArticleCellState>>{
                }),);

}
