import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/AddWebKitBean.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_collection_page/web_collection_action.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_option_dialog/WebOptionDialog.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'web_collection_cell_action.dart';
import 'web_collection_cell_state.dart';

Effect<WebCollectionCellState> buildEffect() {
  return combineEffects(<Object, Effect<WebCollectionCellState>>{
    WebCollectionCellAction.action: _onAction,
    WebCollectionCellAction.toWebView: _onToWebView,
    WebCollectionCellAction.showDialog: _onShowDialog,
  });
}

void _onAction(Action action, Context<WebCollectionCellState> ctx) {}

void _onToWebView(Action action, Context<WebCollectionCellState> ctx) {
  dynamic params = action.payload;
  String url = params['url'];
  String title = params['title'];
  Navigator.pushNamed(ctx.context, "webView",
      arguments: {"url": url, "title": title});
}

/// 显示弹窗
void _onShowDialog(Action action, Context<WebCollectionCellState> ctx) {
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
            MaterialButton(
              onPressed: () {
                Navigator.pop(ctx.context);
                _modifyInfo(ctx, action.payload);
              },
              child: Text(
                '再改改',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            )
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

/// 删除web收藏
_deleteWeb(Context<WebCollectionCellState> ctx) {
  DioUtils.getInstance().doPost(
      'lg/collect/deletetool/json',
      (data) {
        ctx.dispatch(WebCollectionActionCreator.onDeleteSuccess(
            ctx?.state?.cellCollectionBean?.id));
        ToastUtils.showTs('删除成功');
        Navigator.pop(ctx.context);
      },
      params: {"id": ctx.state.cellCollectionBean?.id},
      error: (data) {
        ToastUtils.showTs(data);
      });
}

/// 编辑web
_modifyWeb(Context<WebCollectionCellState> ctx, String name, String link) {
  DioUtils.getInstance().doPost('lg/collect/updatetool/json', (data) {
    AddWebKitBean _bean = AddWebKitBean.fromJson(data);
    ctx.dispatch(WebCollectionActionCreator.onUpdateSuccess(_bean?.data));
    ToastUtils.showTs('修改成功');
  }, params: {
    "id": ctx?.state?.cellCollectionBean?.id,
    "name": name,
    "link": link
  });
}

/// 修改web信息
_modifyInfo(Context<WebCollectionCellState> ctx,
    WebKitCellCollectionBean cellCollectionBean) {
  showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: ctx.context,
      builder: (BuildContext context) {
        return WebOptionDialog(
            ctx.state?.cellCollectionBean?.name,
            ctx.state?.cellCollectionBean?.link,
            ctx.state.themeColor, (name, link) {
          _modifyWeb(ctx, name, link);
        });
      });
}
