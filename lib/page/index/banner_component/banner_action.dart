import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BannerAction { action }

class BannerActionCreator {
  static Action onAction() {
    return const Action(BannerAction.action);
  }
}
