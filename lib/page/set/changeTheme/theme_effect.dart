import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'theme_action.dart';
import 'theme_state.dart';

Effect<ThemeChangeState> buildEffect() {
  return combineEffects(<Object, Effect<ThemeChangeState>>{
    ThemeChangeAction.action: _onAction,
    ThemeChangeAction.onSelectItem: _onSelectItem,
  });
}

void _onAction(Action action, Context<ThemeChangeState> ctx) {}

void _onSelectItem(Action action, Context<ThemeChangeState> ctx) {
  int indexFlag=action.payload;
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor(indexFlag));
}
