import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<UserPointState> buildEffect() {
  return combineEffects(<Object, Effect<UserPointState>>{
    UserPointAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<UserPointState> ctx) {}

void _onInit(Action action, Context<UserPointState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as StateWithTickerProvider;
  ctx.state.tabController =
      TabController(length: ctx.state.menuList.length, vsync: tickerProvider);
}
