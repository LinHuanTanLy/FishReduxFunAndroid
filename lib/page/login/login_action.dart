import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum loginAction { action }

class loginActionCreator {
  static Action onAction() {
    return const Action(loginAction.action);
  }
}
