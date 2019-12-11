import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebLoadAction { action, showPopDialog }

class WebLoadActionCreator {
  static Action onAction() {
    return const Action(WebLoadAction.action);
  }

  static Action onShowPopDialog() {
    return const Action(WebLoadAction.showPopDialog);
  }
}
