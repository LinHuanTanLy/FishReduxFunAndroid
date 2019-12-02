import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

enum BannerAction { action, initBannerDataSource }

class BannerActionCreator {
  static Action onAction() {
    return const Action(BannerAction.action);
  }

  static Action onInitBannerDataSource(List<Data> data) {
    return Action(BannerAction.initBannerDataSource, payload: data);
  }
}
