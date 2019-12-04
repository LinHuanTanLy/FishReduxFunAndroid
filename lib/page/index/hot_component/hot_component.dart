import 'package:fish_redux/fish_redux.dart';

import 'article_adapter/article_adapter.dart';
import 'hot_effect.dart';
import 'hot_reducer.dart';
import 'hot_state.dart';
import 'hot_view.dart';

class HotArticleComponent extends Component<HotArticleState> {
  HotArticleComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HotArticleState>(
                adapter: NoneConn<HotArticleState>() + ArticleAdapter(),
                slots: <String, Dependent<HotArticleState>>{
                }),);

}
