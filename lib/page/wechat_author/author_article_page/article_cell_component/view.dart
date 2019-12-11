import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ArticleAuthorCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: ClipOval(
                    child: Image.asset(
                      'images/author_pic9.jpg',
                      width: 16,
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 4),
                ),
                Text(
                  state?.articleCellChildList?.author,
                  style: TextStyle(fontSize: 13, color: ColorConf.Color48586D),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state?.articleCellChildList?.niceDate,
                      style: TextStyle(
                          fontSize: 11, color: ColorConf.Color8048586D),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                state?.articleCellChildList?.title,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  '${state?.articleCellChildList?.superChapterName}·${state?.articleCellChildList?.chapterName}',
                  style:
                      TextStyle(fontSize: 12, color: ColorConf.Color8048586D),
                )
              ],
            )
          ],
        )),
    onTap: () {
      dispatch(ArticleCellActionCreator.onToWebViewPage({
        "url": state?.articleCellChildList?.link,
        "title": state?.articleCellChildList?.title
      }));
    },
  );
}
