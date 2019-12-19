import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'comm_article_cell_action.dart';
import 'comm_article_cell_state.dart';

Widget buildView(
    CommArticleCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0x0D181A2B), offset: Offset(0, 2), blurRadius: 10)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${state.cellBean?.title ?? ""}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  '作者：${state.cellBean?.author?.isEmpty == true ? state.cellBean?.shareUser : state.cellBean?.author}',
                  style: TextStyle(fontSize: 10, color: ColorConf.Color48586D),
                ),
                Container(
                  child: Text(
                    '分类：${state.cellBean?.superChapterName}/${state.cellBean?.chapterName}',
                    style:
                        TextStyle(fontSize: 10, color: ColorConf.Color48586D),
                  ),
                  margin: const EdgeInsets.only(left: 14),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${state?.cellBean?.niceDate ?? ""}',
                    style: TextStyle(fontSize: 8, color: ColorConf.Color48586D),
                  ),
                ))
              ],
            ),
            margin: const EdgeInsets.only(top: 10),
          ),
        ],
      ),
    ),
    onTap: () {
      dispatch(CommArticleCellActionCreator.onToWebView(
          {"url": state?.cellBean?.link, "title": state?.cellBean?.title}));
    },
  );
}
