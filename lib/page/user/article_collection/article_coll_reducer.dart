import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'article_coll_action.dart';
import 'article_coll_state.dart';

Reducer<ArticleCollectionState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleCollectionState>>{
      ArticleCollectionAction.action: _onAction,
      ArticleCollectionAction.updateArticleList: _onUpdateList,
      ArticleCollectionAction.deleteSuccess: _onDeleteSuc,
      ArticleCollectionAction.addSuccess: _onAddSuc,
    },
  );
}

ArticleCollectionState _onAction(ArticleCollectionState state, Action action) {
  final ArticleCollectionState newState = state.clone();
  return newState;
}

ArticleCollectionState _onAddSuc(ArticleCollectionState state, Action action) {
  final ArticleCollectionState newState = state.clone();
  List<ArticleCollCellBean> listForArticle = [];
  debugPrint("before add,the length is ${listForArticle.length}");
  listForArticle.add(action.payload);
  listForArticle.addAll(state.listForArticle);
  debugPrint("after add,the length is ${listForArticle.length}");
  return newState..listForArticle = listForArticle;
}

ArticleCollectionState _onDeleteSuc(
    ArticleCollectionState state, Action action) {
  final ArticleCollectionState newState = state.clone();
  newState.listForArticle.removeWhere((e) => e.id == action.payload);
  return newState;
}

ArticleCollectionState _onUpdateList(
    ArticleCollectionState state, Action action) {
  final ArticleCollectionState newState = state.clone();
  int pageNum = state.pageNum;
  List<ArticleCollCellBean> list = action.payload;
  if (pageNum == 0) {
    newState..listForArticle = list;
    state.refreshController.refreshCompleted();
  } else {
    List<ArticleCollCellBean> _tempList = state.listForArticle;
    _tempList.addAll(list);
    newState..listForArticle = _tempList;
    state.refreshController.loadComplete();
    if (list.isEmpty) {
      ToastUtils.showTs('没有更多数据了');
    }
  }
  return newState..pageNum = ++pageNum;
}
