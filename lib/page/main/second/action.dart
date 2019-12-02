import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SecondAction { action }

class SecondActionCreator {
  static Action onAction() {
    return const Action(SecondAction.action);
  }
}
