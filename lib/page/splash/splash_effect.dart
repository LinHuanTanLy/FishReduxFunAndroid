import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/utils/SpUtils.dart';
import 'splash_action.dart';
import 'splash_state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {}

void _onInitState(Action action, Context<SplashState> ctx) {
  SpUtils.getInt('themeColor').then((color) {
    debugPrint('the themeColor is $color');
    GlobalStore.store
        .dispatch(GlobalActionCreator.onChangeThemeColor(color));
  });
  Future.delayed(Duration(milliseconds: 3), () {
    Navigator.pushNamed(ctx.context, 'home');
  });
}
