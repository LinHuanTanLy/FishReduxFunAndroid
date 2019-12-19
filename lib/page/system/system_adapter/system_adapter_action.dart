import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SystemAction { action }

class SystemActionCreator {
  static Action onAction() {
    return const Action(SystemAction.action);
  }
}
