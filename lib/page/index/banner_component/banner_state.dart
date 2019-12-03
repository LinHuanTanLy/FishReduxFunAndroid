import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

class BannerState implements Cloneable<BannerState> {
  List<Data> bannerDataSource;

  @override
  BannerState clone() {
    return BannerState()..bannerDataSource = bannerDataSource;
  }
}
