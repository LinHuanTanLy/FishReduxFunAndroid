import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'classify_state.dart';

Widget buildView(
    ClassifyState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.88,
        crossAxisCount: 5,
        crossAxisSpacing: 4,
        mainAxisSpacing: 10),
    itemBuilder: _listAdapter.itemBuilder,
    itemCount: _listAdapter.itemCount,
  );
}
