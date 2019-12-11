import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'article_list_action.dart';
import 'article_list_state.dart';

Widget buildView(
    AuthorArticleState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter listAdapter = viewService.buildAdapter();
  return Container(
    child: ListView.builder(
      itemBuilder: listAdapter.itemBuilder,
      itemCount: listAdapter.itemCount,
    ),
  );
}
