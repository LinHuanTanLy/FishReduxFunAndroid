import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/AddWebKitBean.dart';
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/dialog/OptionDialog.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'web_collection_action.dart';
import 'web_collection_state.dart';

Effect<WebCollectionState> buildEffect() {
  return combineEffects(<Object, Effect<WebCollectionState>>{
    WebCollectionAction.action: _onAction,
    WebCollectionAction.addWebKit: _onAddWebKit,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<WebCollectionState> ctx) {}

void _onAddWebKit(Action action, Context<WebCollectionState> ctx) {
  showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: ctx.context,
      builder: (BuildContext context) {
        return WebOptionDialog(null, null, ctx.state.themeColor, (name, link) {
          _addWebKit(ctx, name, link);
        });
      });
}

void _onInitState(Action action, Context<WebCollectionState> ctx) {
  DioUtils.getInstance().doGet('lg/collect/usertools/json', (data) {
    WebKitCollectionBean _bean = WebKitCollectionBean.fromJson(data);
    ctx.dispatch(WebCollectionActionCreator.onUpdateWebKitList(_bean?.data));
  });
}

/// 添加网页收藏
_addWebKit(Context<WebCollectionState> ctx, String name, String link) {
  DioUtils.getInstance().doPost('lg/collect/addtool/json', (data) {
    ToastUtils.showTs('添加收藏成功');
    AddWebKitBean _bean = AddWebKitBean.fromJson(data);
    ctx.dispatch(WebCollectionActionCreator.onAddWebKitSuc(_bean?.data));
  }, params: {"name": name, "link": link});
}
