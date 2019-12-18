import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';
import 'package:flutter_android_fun/widget/RefreshWidget.dart';

import 'web_collection_action.dart';
import 'web_collection_state.dart';

Widget buildView(
    WebCollectionState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Scaffold(
    floatingActionButton: Container(
        child: FloatingActionButton(
      onPressed: () {
        dispatch(WebCollectionActionCreator.onAddWebKit());
      },
      child: Icon(Icons.add),
    )),
    appBar: LyAppBar.getAppBar(state.themeColor, '网址收藏'),
    body: RefreshWidget(state.themeColor, state.refreshController,
        state.pageNum, listAdapter, null, null),
  );
}
