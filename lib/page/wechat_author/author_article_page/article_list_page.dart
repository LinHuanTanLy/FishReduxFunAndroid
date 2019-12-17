import 'package:fish_redux/fish_redux.dart';

import 'article_adapter/article_adapter.dart';
import 'article_list_effect.dart';
import 'article_list_reducer.dart';
import 'article_list_state.dart';
import 'article_list_view.dart';

class AuthorArticlePage extends Page<AuthorArticleState, Map<String, dynamic>> {


  AuthorArticlePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AuthorArticleState>(
              adapter: NoneConn<AuthorArticleState>() + ArticleListAdapter(),
              slots: <String, Dependent<AuthorArticleState>>{}),
          middleware: <Middleware<AuthorArticleState>>[],
        );
}
