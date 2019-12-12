import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserPointAction { action }

class UserPointActionCreator {
  static Action onAction() {
    return const Action(UserPointAction.action);
  }
}
