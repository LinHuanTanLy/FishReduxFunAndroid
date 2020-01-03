import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import '../article_coll_action.dart';
import 'coll_cell_action.dart';
import 'coll_cell_state.dart';

Effect<ArticleCollCellState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleCollCellState>>{
    ArticleCollCellAction.action: _onAction,
    ArticleCollCellAction.toWebView: _toWebView,
    ArticleCollCellAction.deleteColl: _toDelete,
  });
}

void _onAction(Action action, Context<ArticleCollCellState> ctx) {}

void _toDelete(Action action, Context<ArticleCollCellState> ctx) {
  showDialog(
      context: ctx.context,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                _deleteWeb(ctx);
              },
              child: Text(
                '删除',
                style: TextStyle(fontSize: 12, color: ColorConf.Color48586D),
              ),
            ),
          ],
          title: Container(
            child: Text(
              '提示',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            margin: const EdgeInsets.only(bottom: 10),
          ),
          content: Text('您是否要删除该收藏？'),
        );
      });
}

void _toWebView(Action action, Context<ArticleCollCellState> ctx) {
  Navigator.pushNamed(ctx.context, "webView", arguments: {
    "url": ctx?.state?.articleCollCellBean?.link,
    "title": ctx?.state?.articleCollCellBean?.title,
    "id": ctx.state?.articleCollCellBean?.id,
    "collect": true,
  });
}

/// 删除文章收藏
_deleteWeb(Context<ArticleCollCellState> ctx) {
  int id = ctx.state?.articleCollCellBean?.id;
  int originId = ctx.state?.articleCollCellBean?.originId ?? -1;
  DioUtils.getInstance().doPost('lg/uncollect/$id/json', (data) {
    ctx.dispatch(ArticleCollectionActionCreator.onDeleteSuccess(id));
    Navigator.pop(ctx.context);
  }, params: {"originId": originId});
}
