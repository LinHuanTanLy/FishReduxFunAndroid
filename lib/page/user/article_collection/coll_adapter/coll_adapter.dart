import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/article_collection/coll_cell_component/coll_cell_component.dart';
import 'package:flutter_android_fun/page/user/article_collection/coll_cell_component/coll_cell_state.dart';

import '../article_coll_state.dart';

class ArticleCollAdapter extends DynamicFlowAdapter<ArticleCollectionState> {
  ArticleCollAdapter()
      : super(
          pool: <String, Component<Object>>{
            'article_coll_cell': ArticleCollCellComponent()
          },
          connector: _ArticleCollConnector(),
        );
}

class _ArticleCollConnector
    extends ConnOp<ArticleCollectionState, List<ItemBean>> {
  @override
  List<ItemBean> get(ArticleCollectionState state) {
    return state.listForArticle.map((e) => ItemBean(
        'article_coll_cell', ArticleCollCellState()..articleCollCellBean = e)).toList();
  }

  @override
  void set(ArticleCollectionState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
