import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'index_action.dart';
import 'index_state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _adapter = viewService.buildAdapter();
  return ListView.builder(
    itemBuilder: _adapter.itemBuilder,
    itemCount: _adapter.itemCount,
  );
}
