import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/utils/SpUtils.dart';

import 'main_action.dart';
import 'main_page.dart';
import 'main_state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    MainAction.action: _onAction,
    MainAction.clickTab: _onClickTab,
    Lifecycle.initState: _onInitState,
  });
}

void _onClickTab(Action action, Context<MainState> ctx) {
  ctx.dispatch(MainActionCreator.onUpdatePageContent(action.payload));
}

void _onAction(Action action, Context<MainState> ctx) {}

void _onInitState(Action action, Context<MainState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as StateWithTickerProvider;
  ctx.state.tabControllerForMenu =
      TabController(length: ctx.state.menuList.length, vsync: tickerProvider);
  ctx.state.tabControllerForMenu.animateTo(1);
  SpUtils.getStringList('cookie').then((data) {
    if (data != null) {
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLoginStatus(true));
    } else {
      GlobalStore.store
          .dispatch(GlobalActionCreator.onUpdateLoginStatus(false));
    }
  });
}
