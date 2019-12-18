import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'coll_cell_action.dart';
import 'coll_cell_state.dart';

Widget buildView(
    ArticleCollCellState state, Dispatch dispatch, ViewService viewService) {
  String author = state?.articleCollCellBean?.author;
  TextStyle _styleForName =
      TextStyle(fontSize: 11, color: ColorConf.Color48586D);
  TextStyle _styleForDate =
      TextStyle(fontSize: 11, color: ColorConf.Color48586D);
  TextStyle _styleForTitle = TextStyle(fontSize: 14, color: Colors.black);
  TextStyle _styleForDesc =
      TextStyle(fontSize: 14, color: ColorConf.Color48586D);

  /// 渲染desc 因为有些是没有的
  Widget _renderDesc() {
    String desc = state?.articleCollCellBean?.desc;
    String envelopePic = state?.articleCollCellBean?.envelopePic;
    Widget _picWidget;
    if (envelopePic.isNotEmpty == true) {
      _picWidget = Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: NetworkImage(envelopePic))),
      );
    }

    if (desc.isNotEmpty == true) {
      return Container(
        child: _picWidget == null
            ? Text(
                desc,
                style: _styleForDesc,
                maxLines: 3,
              )
            : Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    desc,
                    style: _styleForDesc,
                    maxLines: 3,
                  )),
                  _picWidget,
                ],
              ),
        margin: const EdgeInsets.only(top: 10),
      );
    } else {
      return Container();
    }
  }

  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.only(top: 6, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            author.isNotEmpty ? author : "匿名",
            style: _styleForName,
          ),
          Container(
            child: Text(
              state?.articleCollCellBean?.title,
              style: _styleForTitle,
            ),
            margin: const EdgeInsets.only(top: 8),
          ),
          _renderDesc(),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  state?.articleCollCellBean?.chapterName,
                  style: _styleForName,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    state?.articleCollCellBean?.niceDate,
                    style: _styleForDate,
                  ),
                ))
              ],
            ),
            margin: const EdgeInsets.only(top: 16),
          )
        ],
      ),
    ),
    onTap: () {
      dispatch(ArticleCollCellActionCreator.onToWebView());
    },
  );
}
