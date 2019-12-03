import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'banner_action.dart';
import 'banner_state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.action: _onAction,
    Lifecycle.initState: _onInitStats,
  });
}

void _onAction(Action action, Context<BannerState> ctx) {}

void _onInitStats(Action action, Context<BannerState> ctx) {
  print('----------------------bannerPart liftcycle=${ctx.state.dataForBanner}');
}
