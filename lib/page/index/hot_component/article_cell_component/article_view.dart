import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'article_action.dart';
import 'article_state.dart';

Widget buildView(
    ArticleCellState state, Dispatch dispatch, ViewService viewService) {
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
          Row(
            children: <Widget>[
              Image.asset(
                'images/icon_hot_flag.png',
                width: 16,
              ),
              Expanded(
                  child: Container(
                child: Text(
                  '${state.hotArticleCellBean?.title ?? ""}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                margin: const EdgeInsets.only(left: 2),
              ))
            ],
          ),
          Container(
            child: Row(
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
                  '${state.hotArticleCellBean?.author ?? "匿名用户"}',
                  style: TextStyle(fontSize: 10, color: ColorConf.Color48586D),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${state?.hotArticleCellBean?.niceDate ?? ""}',
                    style: TextStyle(fontSize: 8, color: ColorConf.Color48586D),
                  ),
                ))
              ],
            ),
            margin: const EdgeInsets.only(top: 10, left: 16),
          ),
        ],
      ),
    ),
    onTap: () {
      dispatch(ArticleCellActionCreator.onToWebView({
        "url": state?.hotArticleCellBean?.link,
        "title": state?.hotArticleCellBean?.title
      }));
    },
  );
}
