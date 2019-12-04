import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'hot_action.dart';
import 'hot_state.dart';

Widget buildView(
    HotArticleState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Text(state.hotArticleDataSource.toString() + state.commArticleDataSource.toString()),
  );
}
