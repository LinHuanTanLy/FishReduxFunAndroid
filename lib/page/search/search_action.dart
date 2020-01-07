import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/HotSearchBean.dart';
import 'package:flutter_android_fun/domain/entity/SearchResultBean.dart';

//TODO replace with your own action
enum SearchAction {
  action,
  updateHotSearchList,
  toSearch,
  clickTag,
  toClean,
  updateSearchResult,
  loadMore,
}

class SearchActionCreator {
  static Action onAction() {
    return const Action(SearchAction.action);
  }

  static Action onLoadMore() {
    return const Action(SearchAction.loadMore);
  }

  static Action onToClean() {
    return const Action(SearchAction.toClean);
  }

  static Action onToSearch() {
    return const Action(SearchAction.toSearch);
  }

  static Action onClickTag(String tagName) {
    return Action(SearchAction.clickTag, payload: tagName);
  }

  static Action onUpdateSearchResult(
      List<SearchResultCellBean> searchResultList, String key) {
    return Action(SearchAction.updateSearchResult,
        payload: {'list': searchResultList, "key": key});
  }

  static Action updateHotSearchList(List<HotSearchCellBean> hotSearchBeanList) {
    return Action(SearchAction.updateHotSearchList, payload: hotSearchBeanList);
  }
}
