import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ProjectChildState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Container(
    child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: _listAdapter.itemBuilder,
      itemCount: _listAdapter.itemCount,
    ),
  );
}
