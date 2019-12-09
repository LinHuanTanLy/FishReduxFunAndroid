import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebLoadAction { action }

class WebLoadActionCreator {
  static Action onAction() {
    return const Action(WebLoadAction.action);
  }
}
