import 'package:fish_redux/fish_redux.dart';

enum BannerAction { action, toWebView, toLogin }

class BannerActionCreator {
  static Action onAction() {
    return const Action(BannerAction.action);
  }

  static Action onToWebView(dynamic url) {
    return Action(BannerAction.toWebView, payload: url);
  }

  static Action onToLogin() {
    return Action(BannerAction.toLogin);
  }
}
