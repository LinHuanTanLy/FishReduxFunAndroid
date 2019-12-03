import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'action.dart';
import 'state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<IndexState> ctx) {}

void _onInitState(Action action, Context<IndexState> ctx) {
  DioUtils.getInstance().doGet("banner/json", (data) {
    BannerInfoBean _bean = BannerInfoBean.fromJson(data);
    ctx.dispatch(IndexActionCreator.onUpdateBannerSource(_bean?.data ?? []));
  });
}
