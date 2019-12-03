import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

enum IndexAction { action, updateBannerDataSource }

class IndexActionCreator {
  static Action onAction() {
    return const Action(IndexAction.action);
  }

  static Action onUpdateBannerSource(List<Data> list) {
    return Action(IndexAction.updateBannerDataSource, payload: list);
  }
}
