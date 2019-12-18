import 'package:fish_redux/fish_redux.dart';

import 'article_coll_effect.dart';
import 'article_coll_reducer.dart';
import 'article_coll_state.dart';
import 'article_coll_view.dart';
import 'coll_adapter/coll_adapter.dart';

class ArticleCollectionPage
    extends Page<ArticleCollectionState, Map<String, dynamic>> {
  ArticleCollectionPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ArticleCollectionState>(
              adapter:
                  NoneConn<ArticleCollectionState>() + ArticleCollAdapter(),
              slots: <String, Dependent<ArticleCollectionState>>{}),
          middleware: <Middleware<ArticleCollectionState>>[],
        );
}
