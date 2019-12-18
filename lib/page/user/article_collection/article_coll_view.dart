import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';
import 'package:flutter_android_fun/widget/RefreshWidget.dart';

import 'article_coll_action.dart';
import 'article_coll_state.dart';

Widget buildView(
    ArticleCollectionState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Scaffold(
    floatingActionButton: Container(
        child: FloatingActionButton(
      onPressed: () {
        dispatch(ArticleCollectionActionCreator.onAddArticle());
      },
      child: Icon(Icons.add),
    )),
    appBar: LyAppBar.getAppBar(state.themeColor, '收藏文章'),
    body: RefreshWidget(
      state.themeColor,
      state.refreshController,
      state.pageNum,
      _listAdapter,
      () {
        dispatch(ArticleCollectionActionCreator.onRefresh());
      },
      () {
        dispatch(ArticleCollectionActionCreator.onLoadMore());
      },
      defIndex: 0,
    ),
  );
}
