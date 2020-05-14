import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'StateWithTickerProvider.dart';
import 'author_action.dart';
import 'author_state.dart';

Effect<AuthorState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorState>>{
    AuthorAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<AuthorState> ctx) {}

void _onInitState(Action action, Context<AuthorState> ctx) {
  DioUtils.getInstance().doGet('wxarticle/chapters/json', (data) {
    ClassifyBean _bean = ClassifyBean.fromJson(data);
    ctx.dispatch(AuthorActionCreator.onUpdateClassifySource(_bean?.data ?? []));
    final TickerProvider tickerProvider =
        ctx.stfState as StateWithTickerProvider;
    ctx.state.tabController =
        TabController(length: _bean?.data?.length ?? 0, vsync: tickerProvider);

    var result =
        _bean?.data?.singleWhere((item) => item.id == ctx.state.defIndexId);
    var index = _bean?.data?.indexOf(result);
    if (index != -1) {
      ctx.state.tabController.animateTo(index);
    }
  });
}
