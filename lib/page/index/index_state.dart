import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

import 'banner_component/banner_state.dart';


class IndexState implements Cloneable<IndexState> {
  List<Data> bannerDataSource;

  @override
  IndexState clone() {
    return IndexState()..bannerDataSource = bannerDataSource;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState()..bannerDataSource=[];
}

class BannerConnector extends Reselect1<IndexState, BannerState, List<Data>> {
  @override
  BannerState computed(List<Data> state) {
    return BannerState()..bannerDataSource = state;
  }

  @override
  List<Data> getSub0(IndexState state) {
    return state.bannerDataSource;
  }

  @override
  void set(IndexState state, BannerState subState) {
    subState.bannerDataSource = state.bannerDataSource;
  }
}
