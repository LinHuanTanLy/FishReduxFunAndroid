import 'package:fish_redux/fish_redux.dart';

enum BannerAction { action, toWebView, toLogin, updatePoint, toPointPage }

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

  static Action onUpdatePoint(int point) {
    return Action(BannerAction.updatePoint, payload: point);
  }

  static Action onToPointPage() {
    return Action(BannerAction.toPointPage);
  }
}
