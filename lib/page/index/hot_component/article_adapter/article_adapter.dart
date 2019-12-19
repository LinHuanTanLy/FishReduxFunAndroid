import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/index/hot_component/article_cell_component/article_component.dart';
import 'package:flutter_android_fun/page/index/hot_component/article_cell_component/article_state.dart';
import 'package:flutter_android_fun/page/index/hot_component/comm_article_cell_component/comm_article_cell_component.dart';
import 'package:flutter_android_fun/page/index/hot_component/comm_article_cell_component/comm_article_cell_state.dart';
import 'package:flutter_android_fun/page/index/hot_component/project_component/project_component.dart';
import 'package:flutter_android_fun/page/index/hot_component/project_component/project_state.dart';

import '../hot_state.dart';
import 'article_adapter_reducer.dart';

class ArticleAdapter extends DynamicFlowAdapter<HotArticleState> {
  ArticleAdapter()
      : super(
          pool: <String, Component<Object>>{
            "article_cell": ArticleCellComponent(),
            "comm_article_cell": CommArticleCellComponent(),
            "hot_project_cell": ProjectComponent(),
          },
          connector: _ArticleAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _ArticleAdapterConnector extends ConnOp<HotArticleState, List<ItemBean>> {
  @override
  List<ItemBean> get(HotArticleState state) {
    List<ItemBean> _tempList = [];
    _tempList.addAll(state.hotArticleDataSource
        .map((e) => ItemBean(
            "article_cell", ArticleCellState()..hotArticleCellBean = e))
        .toList());
    _tempList.add(ItemBean(
        "hot_project_cell",
        ProjectState()
          ..projectListDataSource = state.projectDataSource
          ..screenW = state.size?.width
          ..screenH = state.size?.height));
    _tempList.addAll(state.commArticleDataSource
        .map((e) =>
            ItemBean("comm_article_cell", CommArticleCellState()..cellBean = e))
        .toList());
    return _tempList;
  }

  @override
  void set(HotArticleState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
