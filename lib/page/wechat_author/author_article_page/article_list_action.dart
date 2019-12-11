import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';

enum AuthorArticleAction { action, updateArticleList, refresh, loadmore }

class AuthorArticleActionCreator {
  static Action onAction() {
    return const Action(AuthorArticleAction.action);
  }

  static Action onUpdateArticleList(List<ArticleCellChildList> tempList) {
    return Action(AuthorArticleAction.updateArticleList, payload: tempList);
  }

  static Action onRefresh() {
    return const Action(AuthorArticleAction.refresh);
  }

  static Action onLoadMore() {
    return const Action(AuthorArticleAction.loadmore);
  }
}
