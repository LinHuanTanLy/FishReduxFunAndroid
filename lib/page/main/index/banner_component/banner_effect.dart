import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'banner_action.dart';
import 'banner_state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<BannerState> ctx) {}

void _onInitState(Action action, Context<BannerState> ctx) {
  DioUtils.getInstance().doGet('banner/json', (data) {
    BannerInfoBean _banner = BannerInfoBean.fromJson(data);
    List<Data> _dataForBanner = _banner?.data ?? [];
    ctx.dispatch(BannerActionCreator.onInitBannerDataSource(_dataForBanner));
  });
}
