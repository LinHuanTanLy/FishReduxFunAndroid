import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';

//TODO replace with your own action
enum ArticleCollectionAction {
  action,
  refresh,
  loadMore,

  /// 更新文章列表
  updateArticleList,

  /// 添加收藏文章
  addArticle,

  /// 收藏文章成功
  addSuccess,

  /// 删除文章成功
  deleteSuccess,

  /// 编辑文章成功
  updateSuccess,
}

class ArticleCollectionActionCreator {
  static Action onAction() {
    return const Action(ArticleCollectionAction.action);
  }

  static Action onRefresh() {
    return const Action(ArticleCollectionAction.refresh);
  }

  static Action onLoadMore() {
    return const Action(ArticleCollectionAction.loadMore);
  }

  static Action onAddArticle() {
    return const Action(ArticleCollectionAction.addArticle);
  }

  static Action onUpdateArticleList(List<ArticleCollCellBean> list) {
    return Action(ArticleCollectionAction.updateArticleList, payload: list);
  }

  static Action onAddSuccess() {
    return const Action(ArticleCollectionAction.addSuccess);
  }

  static Action onDeleteSuccess() {
    return const Action(ArticleCollectionAction.deleteSuccess);
  }

  static Action onUpdateSuccess() {
    return const Action(ArticleCollectionAction.updateSuccess);
  }
}
