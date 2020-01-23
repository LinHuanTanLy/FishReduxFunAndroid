import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'login_action.dart';
import 'login_state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.toFinish: _onFinish,
    LoginAction.toRegister: _onToRegister,
    LoginAction.toLogin: _onToLogin,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onFinish(Action action, Context<LoginState> ctx) {
  Navigator.pop(ctx.context);
}

void _onToRegister(Action action, Context<LoginState> ctx) {
  Navigator.pushNamed(ctx.context, 'register').then((data) {
    if (data == "suc") {
      Navigator.pop(ctx.context);
    }
  });
}

void _onToLogin(Action action, Context<LoginState> ctx) {
  String account = ctx.state.controllerForAccount.text;
  String password = ctx.state.controllerForPassWord.text;

  if (account != null && account.isNotEmpty == true) {
    // 账号不为空
    if (password != null && password.isNotEmpty == true) {
      // 密码不为空
      // 进行登录操作
      _requestLogin(action, ctx, account, password);
    } else {
      ToastUtils.showTs('请输入正确的密码');
    }
  } else {
    ToastUtils.showTs('请输入账号');
  }
}

_requestLogin(
    Action action, Context<LoginState> ctx, String account, String pass) {
  DioUtils.getInstance().doPost('user/login', (data) {
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLoginStatus(true));
//    GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor());
    ctx.dispatch(LoginActionCreator.onToFinish());
  }, params: {"username": account, "password": pass}, ifNeedSaveCookie: true);
}
