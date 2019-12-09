import 'package:fish_redux/fish_redux.dart';

enum BannerAction { action, toWebView }

class BannerActionCreator {
  static Action onAction() {
    return const Action(BannerAction.action);
  }

  static Action onToWebView(String url) {
    return Action(BannerAction.toWebView, payload: url);
  }
}
