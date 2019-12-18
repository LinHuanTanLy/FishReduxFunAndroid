import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'article_coll_action.dart';
import 'article_coll_state.dart';

Effect<ArticleCollectionState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCollectionState>>{
    ArticleCollectionAction.action: _onAction,
    ArticleCollectionAction.refresh: _onRefresh,
    ArticleCollectionAction.loadMore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<ArticleCollectionState> ctx) {}

void _onRefresh(Action action, Context<ArticleCollectionState> ctx) {
  ctx.state.pageNum = 0;
  _requestCollArticleList(action, ctx);
}

void _onLoadMore(Action action, Context<ArticleCollectionState> ctx) {
  _requestCollArticleList(action, ctx);
}

void _onInitState(Action action, Context<ArticleCollectionState> ctx) {
  _requestCollArticleList(action, ctx);
}

_requestCollArticleList(Action action, Context<ArticleCollectionState> ctx) {
  int pageNum = ctx.state.pageNum;
  DioUtils.getInstance().doGet('lg/collect/list/$pageNum/json', (data) {
    ArticleCollListBean _bean = ArticleCollListBean.fromJson(data);
    ctx.dispatch(
        ArticleCollectionActionCreator.onUpdateArticleList(_bean?.data?.datas));
  });
}
