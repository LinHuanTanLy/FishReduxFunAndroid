import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

enum IndexAction {
  action,
  initBannerDataSource,
}

class IndexActionCreator {
  static Action onAction() {
    return const Action(IndexAction.action);
  }

  static Action onInitBannerDataSource(List<Data> data) {
    return Action(IndexAction.initBannerDataSource, payload: data);
  }
}
