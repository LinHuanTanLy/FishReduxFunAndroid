import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/index/hot_component/article_adapter/article_adapter_action.dart';
import 'article_list_action.dart';
import 'article_list_state.dart';

Effect<AuthorArticleState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorArticleState>>{
    AuthorArticleAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<AuthorArticleState> ctx) {}

void _onInitState(Action action, Context<AuthorArticleState> ctx) {
  DioUtils.getInstance()
      .doGet('/wxarticle/list/${ctx.state.courseId}/${ctx.state.pageNum}/json',
          (data) {
    ArticleListBean _bean = ArticleListBean.fromJson(data);
    ctx.dispatch(AuthorArticleActionCreator.onUpdateArticleList(
        _bean?.data?.datas ?? []));
  });
}
