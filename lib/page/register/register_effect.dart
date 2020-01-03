import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/page/login/login_action.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'register_action.dart';
import 'register_state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.toFinish: _onToFinish,
    RegisterAction.toRegister: _onToRegister,
  });
}

void _onAction(Action action, Context<RegisterState> ctx) {}

void _onToRegister(Action action, Context<RegisterState> ctx) {
  String account = ctx.state.controllerForAccount.text;
  String psw = ctx.state.controllerForPsw.text;
  String pswConfirm = ctx.state.controllerForPswConfirm.text;
  if (account != null && account.isNotEmpty == true) {
    if (psw != null && psw.isNotEmpty == true) {
      if (pswConfirm != null && pswConfirm.isNotEmpty == true) {
        if (psw == pswConfirm) {
          _requestRegister(action, ctx, account, psw);
        } else {
          ToastUtils.showTs('两次密码不一致,请重新确认');
        }
      } else {
        ToastUtils.showTs('请确认您的密码');
      }
    } else {
      ToastUtils.showTs('请输入密码');
    }
  } else {
    ToastUtils.showTs('请输入账号');
  }
}

/// 注册操作
void _requestRegister(
    Action action, Context<RegisterState> ctx, String account, String psw) {
  DioUtils.getInstance().doPost('user/register', (data) {
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLoginStatus(true));
    Navigator.pop(ctx.context,"suc");
  },
      params: {"username": account, "password": psw, "repassword": psw},
      ifNeedSaveCookie: true);
}

void _onToFinish(Action action, Context<RegisterState> ctx) {
  Navigator.pop(ctx.context);
}
