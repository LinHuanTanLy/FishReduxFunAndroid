import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';
import 'package:flutter_android_fun/widget/RefreshWidget.dart';

import 'system_child_action.dart';
import 'system_child_state.dart';

Widget buildView(
    SystemChildState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: LyAppBar.getAppBar(state.themeColor, state?.title),
    body: RefreshWidget(
        state.themeColor, state.refreshController, state.pageNum, _listAdapter,
        () {
      dispatch(SystemChildActionCreator.onRefresh());
    }, () {
      dispatch(SystemChildActionCreator.onLoadMore());
    }),
  );
}
