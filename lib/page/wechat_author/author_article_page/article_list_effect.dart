import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/index/hot_component/article_adapter/article_adapter_action.dart';
import 'article_list_action.dart';
import 'article_list_state.dart';

Effect<AuthorArticleState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorArticleState>>{
    AuthorArticleAction.action: _onAction,
    AuthorArticleAction.refresh: _onRefresh,
    AuthorArticleAction.loadmore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<AuthorArticleState> ctx) {}

void _onInitState(Action action, Context<AuthorArticleState> ctx) {
  _requestList(action, ctx, 1);
}

void _onRefresh(Action action, Context<AuthorArticleState> ctx) {
  ctx.state.pageNum=1;
  _requestList(action, ctx, 1);
}

void _onLoadMore(Action action, Context<AuthorArticleState> ctx) {
  int pageNum = ctx.state.pageNum;
  pageNum++;
  _requestList(action, ctx, pageNum);
}

/// 请求网络
_requestList(Action action, Context<AuthorArticleState> ctx, int pageNum) {
  DioUtils.getInstance()
      .doGet('/wxarticle/list/${ctx.state.courseId}/$pageNum/json', (data) {
    ArticleListBean _bean = ArticleListBean.fromJson(data);
    ctx.dispatch(AuthorArticleActionCreator.onUpdateArticleList(
        _bean?.data?.datas ?? []));
  });
}
