import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';

import 'main_action.dart';
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
//  GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLoginStatus(false));
}
