import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/wechat_author/author_article_page/article_cell_component/article_cell_component.dart';
import 'package:flutter_android_fun/page/wechat_author/author_article_page/article_cell_component/article_cell_state.dart';

import '../article_list_state.dart';
import 'article_adapter_reducer.dart';

class ArticleListAdapter extends DynamicFlowAdapter<AuthorArticleState> {
  ArticleListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "article_cell": ArticleCellComponent()
          },
          connector: _ArticleListConnector(),
          reducer: buildReducer(),
        );
}

class _ArticleListConnector extends ConnOp<AuthorArticleState, List<ItemBean>> {
  @override
  List<ItemBean> get(AuthorArticleState state) {
    return state.listForArticleList.map((e) =>
        ItemBean("article_cell", ArticleAuthorCellState()..articleCellChildList = e)).toList();
  }

  @override
  void set(AuthorArticleState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
