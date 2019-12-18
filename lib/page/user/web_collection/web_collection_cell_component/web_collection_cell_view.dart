import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'web_collection_cell_action.dart';
import 'web_collection_cell_state.dart';

Widget buildView(
    WebCollectionCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(12),
      child: Text(state?.cellCollectionBean?.name),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    ),
    onTap: () {
      dispatch(WebCollectionCellActionCreator.onToWebView({
        'url': state?.cellCollectionBean?.link,
        'title': state?.cellCollectionBean?.name,
      }));
    },
    onLongPress: () {
      dispatch(WebCollectionCellActionCreator.onShowDialog(
          state?.cellCollectionBean));
    },
  );
}
