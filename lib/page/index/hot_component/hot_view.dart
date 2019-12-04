import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'hot_action.dart';
import 'hot_state.dart';

Widget buildView(
    HotArticleState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Container(
    padding: const EdgeInsets.only(left: 14, top: 18, right: 14),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '置顶推荐',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConf.Color48586D),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 0),
          itemBuilder: _listAdapter.itemBuilder,
          itemCount: _listAdapter.itemCount,
          shrinkWrap: true,
        )
      ],
    ),
  );
}
