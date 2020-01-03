import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { action, toFinish,toRegister }

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onToFinish() {
    return const Action(RegisterAction.toFinish);
  }
  static Action onToRegister() {
    return const Action(RegisterAction.toRegister);
  }
}
