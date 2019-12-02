import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'index_action.dart';
import 'index_state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<IndexState> ctx) {}

void _onInitState(Action action, Context<IndexState> ctx) {
  DioUtils.getInstance().doGet('banner/json', (data) {
    BannerInfoBean _banner = BannerInfoBean.fromJson(data);
    List<Data> _dataForBanner = _banner?.data ?? [];
    ctx.dispatch(IndexActionCreator.onInitBannerDataSource(_dataForBanner));
  });
}
