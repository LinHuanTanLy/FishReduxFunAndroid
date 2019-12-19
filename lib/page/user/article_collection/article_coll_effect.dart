import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/AddArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/dialog/OptionDialog.dart';
import 'article_coll_action.dart';
import 'article_coll_state.dart';

Effect<ArticleCollectionState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCollectionState>>{
    ArticleCollectionAction.action: _onAction,
    ArticleCollectionAction.refresh: _onRefresh,
    ArticleCollectionAction.loadMore: _onLoadMore,
    ArticleCollectionAction.addArticle: _onAddArticle,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<ArticleCollectionState> ctx) {}

void _onAddArticle(Action action, Context<ArticleCollectionState> ctx) {
  showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: ctx.context,
      builder: (BuildContext context) {
        return WebOptionDialog(null, null, ctx.state.themeColor, (name, link) {
          _requestAddArticle(action, ctx, name, link);
        });
      });
}

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

/// 请求收藏文章列表
_requestCollArticleList(Action action, Context<ArticleCollectionState> ctx) {
  int pageNum = ctx.state.pageNum;
  DioUtils.getInstance().doGet('lg/collect/list/$pageNum/json', (data) {
    ArticleCollListBean _bean = ArticleCollListBean.fromJson(data);
    ctx.dispatch(
        ArticleCollectionActionCreator.onUpdateArticleList(_bean?.data?.datas));
  });
}

/// 收藏站外文章
_requestAddArticle(Action action, Context<ArticleCollectionState> ctx,
    String name, String link) {
  DioUtils.getInstance().doPost('lg/collect/add/json', (data) {
    AddArticleBean _bean = AddArticleBean.fromJson(data);
    ctx.dispatch(ArticleCollectionActionCreator.onAddSuccess(_bean?.data));
  }, params: {"title": name, "author": ctx?.state?.userName, "link": link});
}
