import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';
import 'package:flutter_android_fun/widget/RefreshWidget.dart';

import 'system_action.dart';
import 'system_state.dart';

Widget buildView(
    SystemState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: LyAppBar.getAppBar(state.themeColor, '体系大全'),
    body: RefreshWidget(
      state.themeColor,
      null,
      0,
      _listAdapter,
      null,
      null,
      ifNeedSeparated: false,
      defIndex: 0,
    ),
  );
}
