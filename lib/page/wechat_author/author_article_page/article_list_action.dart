import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleListBean.dart';

//TODO replace with your own action
enum AuthorArticleAction { action, updateArticleList }

class AuthorArticleActionCreator {
  static Action onAction() {
    return const Action(AuthorArticleAction.action);
  }

  static Action onUpdateArticleList(List<ArticleCellChildList> tempList) {
    return Action(AuthorArticleAction.updateArticleList, payload: tempList);
  }
}
