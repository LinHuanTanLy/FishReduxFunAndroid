import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/NaviTreeBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'navi_action.dart';
import 'navi_effect.dart';
import 'navi_reducer.dart';
import 'navi_state.dart';
import 'navi_view.dart';

Effect<NaviState> buildEffect() {
  return combineEffects(<Object, Effect<NaviState>>{
    NaviAction.action: _onAction,
    NaviAction.toWebView:_onToWebView,
    Lifecycle.initState: _onInitState,

  });
}

void _onAction(Action action, Context<NaviState> ctx) {}
void _onToWebView(Action action, Context<NaviState> ctx) {
  Navigator.pushNamed(ctx.context, 'webView',arguments: action.payload);
}
void _onInitState(Action action, Context<NaviState> ctx) {
  DioUtils.getInstance().doGet('navi/json', (data) {
    NaviTreeBean _bean = NaviTreeBean.fromJson(data);
    ctx.dispatch(NaviActionCreator.onUpdateNaviList(_bean?.data));
  });
}
